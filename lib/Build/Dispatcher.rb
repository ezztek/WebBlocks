require 'observer'

module WebBlocks
  
  module Build
    
    module Dispatcher
      
      def observers 
        
        @observers = [] unless @observers
        @observers
        
      end
      
      def reset_observers
        
        @observers = []
        
      end
      
      def observer observer
        
        observers << observer
        
      end
      
      def execute event
        
        ["before_#{event}", event, "after_#{event}"].each do |event|
          log.task 'Dispatcher', "Executing task: #{event}" do
            observers.each do |object|
               object.send(event) if object.respond_to? event
            end 
          end
        end
        
      end
      
    end
    
  end
  
end