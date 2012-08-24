# Mingalar Sprinkle Packages #

## What is it? ##

This is a collection of [Sprinkle][1] recipes to use as base to your own stack.

It borrows a lot from [The Spritz Sprinkle Collection by Stuart Ellis][4].

## Usage ##

Fork this repository on GitHub. Then create a local clone and branch:

    git clone git@github.com:your-github-account/sprinkle-packages.git
    git remote add upstream git://github.com/mingalar/sprinkle-packages.git
    git checkout -b your-branch


Use [Bundler][2] to install the dependencies:

    bundle install

Check that the target system meets these requirements:

* You need a user account that can run administrative commands with `sudo`
* This account must be accessible with SSH
* RECOMMENDED: For security, this account should use SSH key-based authentication

Sprinkle does not require any other software on the target system.

To run the default recipe on the target system:

    sprinkle -s install.rb <target_address> <email_address> <remote_account>

For example:

    sprinkle -s install.rb myserver.mydomain.com me@mydomain.com deploy

This connects to the target with SSH, logs in as the user `deploy`, and immediately applies the recipe.

To run a different recipe on the target system:

    sprinkle -s install.rb <target_address> <email_address> <remote_account> <recipe_name>

To see the options for Sprinkle:

    sprinkle --help

## Resources ##

### Articles ###

* [An introduction to Sprinkle][3]

### Other Sprinkle Stacks ###

This Sprinkle stack owes a lot to:

* [The Spritz Sprinkle Collection by Stuart Ellis][4]
* [The Rails Sprinkle Stack by Jonas Grimfelt][5]

## Contact ##

Email:

<community@mingalar.net>

## License ##

(The MIT License)

Copyright 2012, Mingalar SAS

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[1]: https://github.com/crafterm/sprinkle/ "Sprinkle"
[2]: http://gembundler.com/ "Bundler"
[3]: http://redartisan.com/2008/5/27/sprinkle-intro "Sprinkle introduction"
[4]: https://github.com/stuartellis/spritz "Spritz Sprinkle Collection"
[5]: https://github.com/grimen/sprinkle-stack "Rails Sprinkle Stack"