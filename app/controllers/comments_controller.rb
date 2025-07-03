class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params) # Construit le commentaire pour cet article

    authorize @comment, :create?

    if @comment.save
      redirect_to post_path(@post), notice: "Votre commentaire a été ajouté avec succès."
    else
      @post = Post.find(params[:post_id])
      flash.now[:alert] = "Erreur lors de l'ajout du commentaire."
      render 'posts/show', status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment, :destroy? #autorise la supp via comment policy#destroy?
    @comment.destroy
    redirect_to post_path(@comment.post), notice: 'Commentaire supprimé'
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end
