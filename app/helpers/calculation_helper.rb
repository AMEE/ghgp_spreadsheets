# To change this template, choose Tools | Templates
# and open the template in the editor.

module CalculationHelper

end

module AMEE
  module DataAbstraction

    class TermsList
      
      def move_by(attr,value,index)
        term = find {|t| t.send(attr) == value }
        return if term.nil?
        delete(term)
        insert(index, term)
      end

      def rotate
        push(self.shift)
      end

      def method_missing(method, *args, &block)
        if labels.include? method
          TermsList.new select{ |x| x.label == method }
        elsif method.to_s =~ /sort_by_(.*)!/ and self.class::TermProperties.include? $1.to_sym
          sort_by! $1.to_sym
        elsif method.to_s =~ /sort_by_(.*)/ and self.class::TermProperties.include? $1.to_sym
          sort_by $1.to_sym
        elsif
          method.to_s =~ /move_by_(.*)/ and self.class::TermProperties.include? $1.to_sym
          move_by $1.to_sym, *args
        else
          super
        end
      end

    end
  end
end
