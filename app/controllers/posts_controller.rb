class PostsController < ApplicationController

#CREATE ACTION

	get '/posts/new' do 
		erb :"posts/new"
	end

	post '/posts' do
		# binding.pry
		@post = Post.new(params)
		@post.save
		redirect "/posts"
	end

	get '/posts' do 
		@post = Post.all

		erb :"posts/index"
	end
	
	#READ/SHOW ACTION
	get '/posts/:id' do
		@post = Post.find(params[:id])

		erb :"posts/info"
	end

	#UPDATE ACTION

	get '/posts/:id/edit' do
		@post = Post.find(params[:id])

		erb :"posts/edit"
	end


	patch '/posts/:id' do
		@post = Post.find(params[:id])
		@post.update(name: params[:name])
		@post.update(content: params[:content])

		redirect"/posts/#{@post.id}"
	end 

	#DELETE ACTION

	delete '/posts/:id/delete' do 
		@post = Post.find(params[:id])
		@post.destroy

		erb :"posts/delete"
		# redirect "post/#{@post.id/delete}"
	end


end
