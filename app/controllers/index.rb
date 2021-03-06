enable :sessions
before '/secret' do
  if session[:name]
    @message_name = session[:name]
    erb :secret
  else
    erb :index
  end
end
#en esta forma solo se utilizan 3 vistas, de otra forma se podria
#implementar 5 vistas para cada caso: login,logout,registrer,invalid y valid registrer
#esto se hace al crear mas vistas en el view
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
    
    redirect to '/secret'
  end
end

get '/secret' do
  erb :secret
end

get '/logout' do
  session.clear
  @bulean2 = true
  erb :index
end