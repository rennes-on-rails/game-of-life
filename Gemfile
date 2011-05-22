source 'http://rubygems.org'

group :development, :test do
  gem 'rspec'
  gem 'guard'
  gem 'guard-rspec'
  if RUBY_PLATFORM =~ /darwin/i
    gem 'rb-fsevent'
    gem 'growl'
  end
  if RUBY_PLATFORM =~ /linux/i
    gem 'rb-inotify'
    gem 'libnotify'
  end
end
