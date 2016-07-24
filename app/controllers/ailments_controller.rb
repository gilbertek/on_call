class AilmentsController < ApplicationController
  before_action :set_ailment, only: [:show, :edit, :update, :destroy]

  def index
    @ailments = Ailment.all
  end

  def show
  end

  def new
    @ailment = Ailment.new
  end

  def edit
  end

  def create
    @ailment = Ailment.new(ailment_params)

    respond_to do |format|
      if @ailment.save
        format.html { redirect_to @ailment, notice: 'Ailment was successfully created.' }
        format.json { render :show, status: :created, location: @ailment }
      else
        format.html { render :new }
        format.json { render json: @ailment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ailment.update(ailment_params)
        format.html { redirect_to @ailment, notice: 'Ailment was successfully updated.' }
        format.json { render :show, status: :ok, location: @ailment }
      else
        format.html { render :edit }
        format.json { render json: @ailment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ailment.destroy
    respond_to do |format|
      format.html { redirect_to ailments_url, notice: 'Ailment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_ailment
      @ailment = Ailment.find(params[:id])
    end

    def ailment_params
      params.require(:ailment).permit(:name, :description)
    end
end
