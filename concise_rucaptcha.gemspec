lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'concise_rucaptcha/version'

Gem::Specification.new do |s|
  s.name                  = 'concise_rucaptcha'
  s.version               = ConciseRuCaptcha::VERSION
  s.authors               = 'Jason Lee, Rina Liu'
  s.email                 = 'huacnlee@gmail.com, rina.liuzhen@gmail.com'
  s.files                 = Dir.glob('lib/**/*.{rb}') +
                            Dir.glob("ext/**/*.{h,c,rb}") +
                            Dir.glob('app/**/*') +
                            Dir.glob('config/**/*') +
                            %w[README.md CHANGELOG.md]
  s.homepage              = 'https://github.com/liuzhenangel/concise_rucaptcha'
  s.require_paths         = ['lib']
  s.extensions            = %w[ext/concise_rucaptcha/extconf.rb]
  s.summary               = 'This is a Captcha gem for Rails Applications. It drawing captcha image with C code so it no dependencies.'
  s.license               = "MIT"
  s.required_ruby_version = ">= 2.0.0"

  s.add_dependency 'railties', '>= 3.2'
  s.add_development_dependency 'rake-compiler', '~> 1'
end
