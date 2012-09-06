package :ruby19 do
  description "Latest Ruby 1.9 interpreter"

  apt 'ruby1.9.1'

  verify do
    has_apt 'ruby1.9.1'
  end
end

package :ruby19_dev do
  description "Latest Ruby 1.9 development kit"

  requires :ruby19

  apt 'ruby1.9.1-dev'

  verify do
    has_apt 'ruby1.9.1-dev'
  end
end

package :ruby19_bundler do
  description "Latest Ruby 1.9 development kit and bundler"

  requires :ruby19_dev

  gem 'bundler'

  verify do
    has_gem 'bundler'
  end
end
