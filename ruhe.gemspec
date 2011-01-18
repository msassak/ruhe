Gem::Specification.new do |s|
  s.name        = 'ruhe'
  s.version     = '0.0.1'
  s.authors     = ["Mike Sassak"]
  s.description = 'Cucumber steps for RESTful API development'
  s.summary     = "ruhe-#{s.version}"
  s.email       = 'cukes@googlegroups.com'
  s.homepage    = 'http://github.com/msassak/ruhe'

  s.add_dependency 'cucumber', '~> 0.10.0'
  s.add_dependency 'rspec', '~> 2.4.0'
  s.add_dependency 'patron'

  s.add_development_dependency 'sinatra', '~> 1.1.0'

  s.rubygems_version   = "1.3.7"
  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = ["LICENSE", "README.md", "History.txt"]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end

