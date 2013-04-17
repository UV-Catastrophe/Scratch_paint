class PiecesController < ApplicationController

  def create
  	@piece = Piece.new(params[:piece])
  end

  def show
    @piece = Piece.find(params[:id])
    @category = Category.find(@piece.category_id)
    @page_num = params[:page_num].nil? ? 1 : params[:page_num]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @piece }
    end
  end

  def edit
  	@piece = Piece.find(params[:id])
    @category = Category.find(params[:category_id])
    @page_num = params[:page_num].nil? ? 1 : params[:page_num]
  end

  def update
    @piece = Piece.find(params[:id])

    respond_to do |format|
      if @piece.update_attributes(params[:piece])
        format.html  { redirect_to(piece_path(@piece, :category_id => @piece.category_id, :page_num => 1),
                    :notice => 'piece was successfully updated.') }
        format.json  { render :json => @piece,
                    :status => :created, :location => @piece }
      else
        format.html  { render :action => "update" }
        format.json  { render :json => @piece.errors,
                    :status => :unprocessable_entity }
      end
    end
  end

end
