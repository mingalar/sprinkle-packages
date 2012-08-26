# Sprinkle deployment script

# Setup code
#  Code to run on the local system before Sprinkle.

#  Load environment variables from ENV['CONFIGENV'] or config.env if any.
require 'dotenv'
Dotenv.load(ENV['CONFIGENV'] || 'config.env')

#  This gets the name of the target system from the command-line
TARGET = ARGV.first

# The email address for system messages and reports
ADMIN_EMAIL = ARGV[1] || 'root@localhost'

# The name of the user account on the remote system, default to "deploy"
ACCOUNT = ARGV[2] || 'deploy'

unless TARGET && ADMIN_EMAIL && ACCOUNT
  puts "Usage: bundle exec sprinkle -s #{File.basename(__FILE__)} " \
       "<target_address> <email_address> <remote_account> [<recipe1> ... <recipen>]"
  puts "Type `bundle exec sprinkle --help for sprinkle options.`"
  exit(1)
end

# Recipe list, default to "minimal"
RECIPES = Array(ARGV[3..-1])
RECIPES << 'minimal' if RECIPES.empty?

# aborts if any invalid recipes is found.
def barf_on_invalid_recipes(recipes, recipe_dir)
  valid_recipes = Dir.glob(File.join(recipe_dir, '*.rb')).collect { |e| File.basename(e, '.rb') }
  invalid_recipes = recipes - valid_recipes
  unless invalid_recipes.empty?
    puts "Invalid recipes found: #{invalid_recipes.join(', ')}. Valid recipes are: #{valid_recipes.join(', ')}."
    exit(1)
  end
end

# load the specified recipes unless invalid recipes present.
recipe_dir = File.join(File.dirname(__FILE__), 'recipes')
barf_on_invalid_recipes(RECIPES, recipe_dir)
RECIPES.each do |recipe|
  # require_relative doesn't work in this context
  require File.join(recipe_dir, recipe)
end

# Sprinkle Deployment
#  Defines script wide settings,
#  such as a delivery mechanism for executing commands on the target
#  system (eg. Capistrano), and installer defaults (eg. build locations, etc).

deployment do

  delivery :capistrano do

    # Use Capistrano options in Capfile
    recipes 'Capfile'

    set :user, ACCOUNT
    role :app, TARGET

  end

end