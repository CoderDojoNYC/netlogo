
Howto Setup (Ehtesh doesn't know the Ruby ecosystem)
==

    # install rvm by some means
    # check https://rvm.io/rvm/install
    rvm install 1.9.3 # (any version is good)
    gem install bundler
    bundle install
    gem install thin
    thin start
    # redirect browser to localhost:3000
