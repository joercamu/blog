class ArticlesController < ApplicationController
	#callback ->antes de realizar cualquier accion vaya a :validate_user exepto :show e :index
	before_action :validate_user, except: [:show,:index]
	#GET /articles
	def index
		#todos los registros de articles
		@articles = Article.all
	end

	#GET /articles/:id
	def show
		#encuetra un articulo por su id
		@article = Article.find(params[:id])
	end

	#GET /articles/new
	def new
		@article = Article.new
	end

	# Get /aticles/:id/edit
	def edit
		@article = Article.find(params[:id])
	end

	#POST /articule
	def create
		#@article = Article.new(title: params[:article][:title],body: params[:article][:body])
		@article = current_user.articles.new(article_params)#pasar todo el arreglo
		if @article.save
			redirect_to @article
		else
			render :new
		end	
	end

	# PUT articles/:id
	def update
		#@article.update_attributes({title: "Nuevo titulo"})
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	# delete articles/:id
	def destroy
		@article = Article.find(params[:id])
		@article.destroy #Eliminar el elemento en la base de datos
		redirect_to articles_path
	end

	private

	def validate_user
		redirect_to new_user_session_path, notice: "Necesitas iniciar sesion"
	end

	def article_params
		params.require(:article).permit(:title,:body)
	end
end