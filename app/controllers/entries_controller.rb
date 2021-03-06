class EntriesController < ApplicationController
  # Devise
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update] 
  before_filter :correct_user,   only: [:edit, :update, :destroy]
  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(params[:entry])
      if @entry.save
          if params[:entry][:image].present? || params[:entry][:remote_image_url].present?
            render :crop
          else
             redirect_to @entry, notice: 'You did it, you made an entry. Cool right? Proud of you - but you already knew that.'
          end
      else
        render action: "new"
      end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])

      if @entry.update_attributes(params[:entry])
          if params[:entry][:image].present?
            render :crop
          else
             redirect_to @entry, notice: 'Successfully updated. Glad you fixed that, I was a little embarrased for you.'
          end
      else
        render action: "edit"
      end

  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end

  private

  def correct_user
    @user = Entry.find(params[:id]).user
    redirect_to root_path unless current_user == @user
  end

end
