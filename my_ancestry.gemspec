# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Thiago Coutinho"]
  gem.email         = ["thiago@osfeio.com"]
  gem.description   = %q{
  Make search of objects parents/childrem/brothers}
  gem.summary       = %q{ Make search of objects parents/childrem/brothers }
  gem.homepage      = "http://github.com/selialkile/myancestry"

  gem.files         = [
                        "LICENSE",
                        "README.md",
                        "my_ancestry.gemspec",
                        "lib/my_ancestry.rb",
                      ]

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "my_ancestry"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"
end