class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    # your code here
    erb :home
  end

  get '/registrations/signup' do
    # your code here
    erb :'registrations/signup'
  end

  post '/registrations' do
    # your code here
    puts params
    @user = User.create(name: params["name"], email: params["email"], password: params["password"])
    session[:user_id] = @user.id

    redirect '/users/home'
  end

  get '/users/home' do
    @user = User.find(session[:user_id])
    # your code here
    erb :'/users/home'
  end

  get '/sessions/login' do
    # the line of code below render the view page in app/views/sessions/login.erb
    erb :'sessions/login'
  end

  post '/sessions' do
    # your code here

    redirect '/users/home'
  end

  get '/sessions/logout' do
    # your code here
    
    redirect '/'
  end

end
