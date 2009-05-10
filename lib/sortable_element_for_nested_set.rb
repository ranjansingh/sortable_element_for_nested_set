require "tree_calc"

# SortableElementForNestedSet
module SortableElementForNestedSet
  def self.included(base)
    base.extend(ClassMethods)              
  end
  
  module ClassMethods 
    def handles_sorting_of_nested_set
      include SortableElementForNestedSet::InstanceMethods
    end
  end
  
  module InstanceMethods
    protected
    
    def position_of(record_id_param_name)
      @dragged_record_id = params[record_id_param_name].to_i
      self
    end
    
    def in_tree(tree_param_name)
      calculator = TreeMoveCalculator.new( params[tree_param_name] )
      calculator.placement_of(@dragged_record_id)
    end
  end
  
end