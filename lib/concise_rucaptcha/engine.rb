module ConciseRuCaptcha
  class Engine < ::Rails::Engine
    isolate_namespace ConciseRuCaptcha

    initializer 'concise_rucaptcha.init' do |app|
      # https://github.com/rails/rails/blob/3-2-stable/actionpack/lib/action_dispatch/routing/route_set.rb#L268
      # `app.routes.prepend` start from Rails 3.2 - 5.0
      app.routes.prepend do
        mount ConciseRuCaptcha::Engine => '/concise_rucaptcha'
      end

      ConciseRuCaptcha.check_cache_store!
    end
  end
end
