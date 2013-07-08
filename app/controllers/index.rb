enable :session

get '/' do
  erb :index
end

post '/twitter_name' do
  @user = TwitterUser.find_or_create_by_username(params[:username])
  redirect "/#{@user.username}"
end


get '/:twitter' do |twitter|
  @user = TwitterUser.find_by_username(twitter)
  if @user.tweets.empty? || @user.tweets.stale?
    @user.tweets.delete_all
    @user.fetch_tweets!
  end
  @tweets = @user.tweets
  
  erb :show_tweets
end


class Array
  def stale?
    times = self.map(&:time).map(&:to_i)
    future = DateTime.now.to_i + ((times.first.to_i - times.last.to_i)/ self.length)
    DateTime.strptime((DateTime.now.to_i).to_s, '%s') > DateTime.strptime(future.to_s, '%s')
  end
end







#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])

  if @user && @user.password == params[:password_hash] 
    session[:user] = @user.id
    redirect '/'
  else
    @error = "Sign in failed. Is caps lock on?"
    erb :sign_in
  end
end

delete '/sessions/:id' do
  session.clear
  200
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  if @user.save
    erb :sign_in
  else
    @error = @user.errors
    @error.each {|x| puts x}
    erb :sign_up
  end
end