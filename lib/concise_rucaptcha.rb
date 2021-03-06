require 'rails'
require 'action_controller'
require 'active_support/all'
require 'concise_rucaptcha/concise_rucaptcha'
require 'concise_rucaptcha/version'
require 'concise_rucaptcha/configuration'
require 'concise_rucaptcha/controller_helpers'
require 'concise_rucaptcha/view_helpers'
require 'concise_rucaptcha/cache'
require 'concise_rucaptcha/engine'

module ConciseRuCaptcha
  class << self
    def config
      return @config if defined?(@config)
      @config = Configuration.new
      @config.style       = :colorful
      @config.expires_in  = 2.minutes
      if Rails.application
        @config.cache_store = Rails.application.config.cache_store
      else
        @config.cache_store = :mem_cache_store
      end
      @config.cache_store
      @config
    end

    def configure(&block)
      config.instance_exec(&block)
    end

    def generate()
      style = config.style == :colorful ? 1 : 0
      self.create(style)
    end

    def check_cache_store!
      cache_store = ConciseRuCaptcha.config.cache_store
      store_name = cache_store.is_a?(Array) ? cache_store.first : cache_store
      if [:memory_store, :null_store, :file_store].include?(store_name)
        ConciseRuCaptcha.config.cache_store = [:file_store, Rails.root.join('tmp/cache/concise_rucaptcha/session')]

        puts "

  RuCaptcha's cache_store requirements are stored across processes and machines,
  such as :mem_cache_store, :redis_store, or other distributed storage.
  But your current set is #{cache_store}, it has changed to :file_store for working.
  NOTE: :file_store is still not a good way, it only works with single server case.

  Please make config file `config/initializers/concise_rucaptcha.rb` to setup `cache_store`.
  More infomation please read GitHub RuCaptcha README file.
  https://github.com/liuzhenangel/concise_rucaptcha

"
      end
    end
  end
end

ActiveSupport.on_load(:action_controller) do
  ActionController::Base.send :include, ConciseRuCaptcha::ControllerHelpers
end

ActiveSupport.on_load(:action_view) do
  include ConciseRuCaptcha::ViewHelpers
end
