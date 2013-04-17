class CategoriesController < ApplicationController
  def index
    @title = 'Choose a Category'
  	@categories = Category.all
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @categories }
    end

  end

  def new
  	@category = Category.new
  	
  	respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @category }
    end

  end

  def create
  	@category = Category.new(params[:category])

  	respond_to do |format|
      if @category.save
        format.html  { redirect_to(@category,
                    :notice => 'Category was successfully created.') }
        format.json  { render :json => @category,
                    :status => :created, :location => @category }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @category.errors,
                    :status => :unprocessable_entity }
      end
    end
  end

  def show
  	@category = Category.find(params[:id])
    @title = @category.name
    @page_cap = 9
    @count = @category.pieces.size

    # Sets page_num to 1 if none given.  Reduces to the maximum if too large.
    @page_num = [params[:page_num].nil? ? 1 : params[:page_num].to_i, @count / @page_cap + 1].min

    @first_id = @page_cap * (@page_num - 1)
    @last_id = @first_id + @page_cap - 1

  	respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @category }
    end

  end

  def edit
    @category = Category.find(params[:id])
    @title = @category.name
    @page_cap = 9
    @count = @category.pieces.size

    # Sets page_num to 1 if none given.  Reduces to the maximum if too large.
    @page_num = [params[:page_num].nil? ? 1 : params[:page_num].to_i, @count / @page_cap + 1].min

    @first_id = @page_cap * (@page_num - 1)
    @last_id = @first_id + @page_cap - 1
  end

  def update
  	@category = Category.find(params[:id])

  	respond_to do |format|
  	  if @category.update_attributes(params[:category])
        format.html  { redirect_to(@category,
                    :notice => 'Category was successfully updated.') }
        format.json  { render :json => @category,
                    :status => :created, :location => @category }
      else
        format.html  { render :action => "update" }
        format.json  { render :json => @category.errors,
                    :status => :unprocessable_entity }
      end
    end


  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
 
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end


end
