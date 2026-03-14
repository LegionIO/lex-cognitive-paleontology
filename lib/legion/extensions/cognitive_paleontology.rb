# frozen_string_literal: true

require 'securerandom'

require_relative 'cognitive_paleontology/version'
require_relative 'cognitive_paleontology/helpers/constants'
require_relative 'cognitive_paleontology/helpers/fossil'
require_relative 'cognitive_paleontology/helpers/excavation'
require_relative 'cognitive_paleontology/helpers/paleontology_engine'
require_relative 'cognitive_paleontology/runners/cognitive_paleontology'
require_relative 'cognitive_paleontology/client'

module Legion
  module Extensions
    module CognitivePaleontology
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
