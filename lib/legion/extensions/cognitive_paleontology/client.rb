# frozen_string_literal: true

module Legion
  module Extensions
    module CognitivePaleontology
      class Client
        include Runners::CognitivePaleontology

        def initialize(engine: nil)
          @default_engine = engine || Helpers::PaleontologyEngine.new
        end
      end
    end
  end
end
