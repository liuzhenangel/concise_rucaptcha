require 'fileutils'

module ConciseRuCaptcha
  class << self
    def cache
      return @cache if defined? @cache
      @cache = ActiveSupport::Cache.lookup_store(ConciseRuCaptcha.config.cache_store)
      @cache
    end
  end
end
