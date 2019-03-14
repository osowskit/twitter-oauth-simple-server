# Simple Server to obtain Twitter OAuth tokens

Simple web server to obtain an Twitter 3-legged OAuth access token. 

* Create Twitter App
  * Add **Callback URL** using `auth/twitter/callback` - e.g. `http://127.0.0.1:5000/auth/twitter/callback` 
* Copy the `.env.example` to `.env` and set the Key and Secret from :point_up: 
* Run the server - e.g. `ruby server.rb -p 5000`
* Visit the local site - http://127.0.0.1:5000

Your token will be printed to the console.

Inspired by [this blog](https://code.tutsplus.com/tutorials/twitter-sign-in-for-rails-application--cms-28097) using Omni-Auth
