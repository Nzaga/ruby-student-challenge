# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Student"
  spec.version       = '1.0'
  spec.authors       = ["Amos Nzaga"]
  spec.email         = ["nzagajunior@gmail.com"]
  spec.summary       = %q{Collage results}
  spec.description   = %q{Register and display results.}
  spec.homepage      = "http://collage.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/Student.rb']
  spec.executables   = ['bin/Student']
  spec.test_files    = ['tests/test_Student.rb']
  spec.require_paths = ["lib"]
end
