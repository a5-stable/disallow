require_relative 'lib/disallow/version'

Gem::Specification.new do |spec|
  spec.name          = "disallow"
  spec.version       = Disallow::VERSION
  spec.authors       = ["a5-stable"]
  spec.email         = ["sh07e1916@gmail.com"]

  spec.summary       = "disallow certain features in ActiveRecord models such as `default_scope`` and `callbacks`"
  spec.homepage      = "https://github.com/a5-stable/disallow"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/a5-stable/disallow"
  spec.metadata["changelog_uri"] = "https://github.com/a5-stable/disallow"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency('activerecord')

  spec.add_development_dependency('with_model')
  spec.add_development_dependency "sqlite3"
end
