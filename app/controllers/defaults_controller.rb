class DefaultsController < ApplicationController
  before_action :set_default, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @defaults = Default.all
    respond_with(@defaults)
  end

  def show
    respond_with(@default)
  end

  def new
    @default = Default.new
    respond_with(@default)
  end

  def edit
  end

  def create
    @default = Default.new(default_params)
    @default.save
    respond_with(@default)
  end

  def update
    @default.update(default_params)
    respond_with(@default)
  end

  def destroy
    @default.destroy
    respond_with(@default)
  end

  private
    def set_default
      @default = Default.find(params[:id])
    end

    def default_params
      params.require(:default).permit(:name)
    end
end
