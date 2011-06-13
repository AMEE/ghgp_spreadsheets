# Methods added to this helper will be available to all templates in the application.

module ApplicationHelper

  def calculation_terms_in_table_order(calculation,include_optional=false,include_outputs=true)
    terms = []
    terms = terms + calculation.metadata.visible
    terms += calculation.drills.visible
    terms += calculation.profiles.compulsory.visible
    terms += calculation.profiles.optional.visible if include_optional
    terms += calculation.outputs.visible if include_outputs
    return terms
  end

  def js_for_calculation_update(term,attr)
    id_string = ( term.parent.id ? "entry[id]=#{term.parent.id}" : "type=#{term.parent.label}" )
    return "#{remote_function(:url => {:controller => 'calculation',:action => 'update'},
                              :loading=> "$('#ajaxloader').show()",
                              :with => "'#{id_string}&entry[#{term.label}][#{attr.to_s}]='+value")}"
  end
  
end
