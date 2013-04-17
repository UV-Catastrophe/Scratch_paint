class CommentsController < ApplicationController
  def index
  	@comments = Comment.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @piece = Piece.find(@comment.piece_id)
    @comment.destroy
 
    respond_to do |format|
      format.html { redirect_to piece_path(@piece) }
      format.json { head :no_content }
    end
  end
end
