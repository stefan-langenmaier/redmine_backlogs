require_dependency 'settings_controller'

module Backlogs
  module SettingsControllerPatch
    def self.included(base) # :nodoc:
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)

      base.class_eval do
        unloadable # Send unloadable so it will not be unloaded in development
        
        helper :projects
        include ProjectsHelper
      end
    end

    module ClassMethods
    end

    module InstanceMethods
    end
  end
end

SettingsController.send(:include, Backlogs::SettingsControllerPatch) unless SettingsController.included_modules.include? Backlogs::SettingsControllerPatch
