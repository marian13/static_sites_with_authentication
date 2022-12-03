ConvenientService::Dependencies.require_assigns_attributes_in_constructor_using_active_model_attribute_assignment
ConvenientService::Dependencies.require_has_attributes_using_active_model_attributes
ConvenientService::Dependencies.require_has_result_params_validations_using_active_model_validations

module ApplicationService
  module Config
    def self.included(service_class)
      service_class.class_exec do
        include ConvenientService::Standard::Config

        concerns do
          use ConvenientService::Plugins::Common::AssignsAttributesInConstructor::UsingActiveModelAttributeAssignment::Concern
          use ConvenientService::Plugins::Common::HasAttributes::UsingActiveModelAttributes::Concern
          use ConvenientService::Plugins::Service::HasResultParamsValidations::UsingActiveModelValidations::Concern
        end

        middlewares :initialize do
          use ConvenientService::Plugins::Common::AssignsAttributesInConstructor::UsingActiveModelAttributeAssignment::Middleware
        end

        middlewares :result do
          use ConvenientService::Plugins::Service::HasResultParamsValidations::UsingActiveModelValidations::Middleware
        end
      end
    end
  end
end
