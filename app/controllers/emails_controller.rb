class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(object: Faker::Hipster.sentence,
    body: Faker::TvShows::Simpsons.quote)
    
    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
      flash[:notice] = "Email created"
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
      flash[:notice] = "Please try again"
    end

  end 

  def show
    @id = params[:id]
    @email = Email.find(@id)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
     end 
  end

  def destroy
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
     end
    @email.destroy
   
  end


end
