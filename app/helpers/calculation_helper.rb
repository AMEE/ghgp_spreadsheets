# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

module CalculationHelper

  # Generate an element rendering a single term. By default, this element
  # represents the term value, wrapped within <span> tags. In cases where units or
  # per units are involved, these are appended within successive <span> tags.
  #
  # By default, each element is wrapped within <span> tags.
  #
  # A number of options are supported:
  #
  # :tag => <some tag, e.g. 'td'> - Wraps each element within alternative html tags within tables.
  #
  # :unit_format => <symbol> - Set the format for describing units. Valid
  # values include :name, :pluralized_name,
  # :symbol and :label
  #
  # :decimal_places - Set the decimal places of any numeric value
  #
  # :per_unit_delimiter - Set the character or string used to delimit
  # units and per unit, Defaults to "/"
  #
  def show_term_tag(term,options={})
    options[:unit_format] ||= :symbol
    options[:term] = term
    options[:tag] ||= 'span'
    options[:per_unit_delimiter] ||= '/'
    options[:decimal_places] ||= nil
    options[:format_number] ||= false
    options[:delimiter] ||= nil
    options[:separator] ||= nil
    render 'calculation/show_term', options
  end

  # Generate a form input field (text field) for a term attribute. The second argument
  # represents a hash of options which can be optionally used to specify the term
  # attribute to be used and the size of the text field. Valid option keys are:
  #
  # :attribute - the label of the term attribute, e.g. :value, :unit
  # :size - size, in pixels, of the text field
  #
  # If no term attribute is explcitly specified, it is assume that the text field
  # represents the term 'value' attribute. Default text field size is 10 pixels.
  #
  def term_input_tag(term,options={})
    options[:size] ||= 10
    options[:disabled] = term.disabled?
    options[:class] = html_class_for_term(term,:value)
    text_field_tag options[:name], term.value, options
  end

  # Generate a select list containing the valid choices for a term value
  def term_choices_select_tag(term,options={})
    choices = term.options_for_select
    selected = (term.set? ? term.value : nil)
    options[:disabled] ||= term.disabled?
    options[:class] = html_class_for_term(term,:value)
    select_tag options[:name], options_for_select(choices, selected), options
  end

  # Generate a select list containing the valid alternatives for a term per unit.
  #
  # Specify the format for list entries as an optional key (:format) within the
  # options hash, i.e. the format in which the unit is described. Valid options
  # include:
  #
  # :name
  # :pluralized_name
  # :symbol
  # :label
  #
  # Defaults to :symbol if not explcitly specified
  #
  # This method generates default html classes for the select element, based
  # on the #html_class_for_term method.
  #
  # If options[:parent] is provided, this will be used as the parent key for the
  # selected value within the params hash, e.g.
  #
  # term_unit_select_tag(term,options[:parent]=>'mass') #=>
  #
  # <select class="profile aluminium_quantity unit" id="mass_unit" name="mass[unit]">
  # <option value="g">g</option>
  # <option value="ton_uk">ton</option>
  # ...
  # </select>
  #
  def term_unit_select_tag(term,options={})
    raise if options[:format] and not [:name,:pluralized_name,:symbol,:label].include? options[:format]
    format = options.delete(:format) || :symbol
    parent = options.delete(:parent) || nil
    options[:class] = html_class_for_term(term,:unit)
    collection_select parent,:unit,term.unit_choices,:label,format,
                    {:selected => term.unit.label},options
  end

  # Generate a select list containing the valid alternatives for a term per unit.
  #
  # Specify the format for list entries as an optional key (:format) within the
  # options hash, i.e. the format in which the unit is described. Valid options
  # are as above. Defaults to :symbol if not explcitly specified.
  #
  # This method generates default html classes for the select element, based
  # on the #html_class_for_term method.
  #
  # # If options[:parent] is provided, this will be used as the parent key for the
  # selected value within the params hash. See above.
  #
  def term_per_unit_select_tag(term,options={})
    raise if options[:format] and not [:name,:pluralized_name,:symbol,:label].include? options[:format]
    format = options.delete(:format) || :symbol
    parent = options.delete(:parent) || nil
    options[:class] = html_class_for_term(term,:per_unit)
    collection_select parent,:per_unit,term.per_unit_choices,:label,format,
                    {:selected => term.per_unit.label},options
  end

  # Return a term value rounded to the specified number of decimal places.
  # If the term value is not numeric, then the term value is simply returned.
  # This allows rounding to be applied systematically across caluclations and
  # terms without breaking.
  #
  def rounded_term_value(term, decimal_places)
    if term.has_numeric_value? && decimal_places
      return term.value.round(decimal_places)
    else
      return term.value
    end
  end

  # Generate a string providing some default html class for a term representation.
  # Requires the term to be provided as a first argument, and a reference to the
  # term attribute under consideration as the second argument, e.g.
  #
  # html_class_for_term(obj,:unit) #=> "profile mass unit"
  #
  # html_class_for_term(obj,:value) #=> "drill type value"
  #
  # The attribute can be provided as a string or a symbol
  #
  def html_class_for_term(term,attr)
    "amee-#{term_class_string(term)} calc-#{term.label} term-#{attr.to_s}"
  end

  protected

  # Parse the class name from the full namespace - used to provide
  # default html classes for term views
  def term_class_string(term)
    return term.class.to_s.split("::").last.downcase
  end
end