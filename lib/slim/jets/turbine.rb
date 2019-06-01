require "slim"

module Slim::Jets
  class Turbine < ::Jets::Turbine
    initializer "slim.register" do |app|
      ActiveSupport.on_load(:action_view) do
        # Reference: https://github.com/slim-template/slim/blob/master/lib/slim/template.rb
        Temple::Templates::Rails(Slim::Engine,
                                 register_as: :slim,
                                 # Use rails-specific generator. This is necessary
                                 # to support block capturing and streaming.
                                 generator: Temple::Generators::RailsOutputBuffer,
                                 # Disable the internal slim capturing.
                                 # Rails takes care of the capturing by itself.
                                 disable_capture: true,
                                 streaming: true)
      end
    end
  end
end
