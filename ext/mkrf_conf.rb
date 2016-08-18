require 'rubygems/dependency_installer'

di = Gem::DependencyInstaller.new

begin
  if RUBY_VERSION < '1.9'
    di.install "json", "~> 1.0"
    di.install "httparty", "0.11.0"
  else
    di.install "httparty", "~> 0.0"
  end
rescue => e
  warn "#{$0}: #{e}"

  exit!
end

puts "Writing fake Rakefile"

# Write fake Rakefile for rake since Makefile isn't used
File.open(File.join(File.dirname(__FILE__), 'Rakefile'), 'w') do |f|
  f.write("task :default" + $/)
end
