enable :sessions

get '/' do

    erb :index
end

get '/register' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  User.create(name: name, email: email, password: password)
  @bulean = true
  erb :index
end

post '/login' do
  @error_message = ""
  email = params[:email]
  password = params[:password]
#buscar sio existe el usuario
  user = User.authenticate(email, password)
  if user == nil
    @error_message = "Usuario Inválido"
    erb :index
  else
#obtener id y email para crear sesión
    session[:name] = user.name
    @message_name = session[:name]
    erb :secret
  end
end

get '/logout' do
  session.clear
  @bulean2 = true
  erb :index
end