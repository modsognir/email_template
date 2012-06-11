# -*- encoding: utf-8 -*-
require File.expand_path('../lib/email_template/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jared Fraser"]
  gem.email         = ["j.fraser@modsognir.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "email_template"
  gem.require_paths = ["lib"]
  gem.version       = EmailTemplate::VERSION
  gem.add_dependency "activesupport", ">=3.0.0"
  gem.add_dependency "actionmailer", ">=3.0.0"
  gem.add_development_dependency "rspec"
end
