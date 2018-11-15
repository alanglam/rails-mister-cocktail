class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
     if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  # DELETE /cocktails/1
  # DELETE /cocktails/1.json
  def destroy
    @cocktail.destroy
    respond_to do |format|
        format.html { redirect_to cocktails_url, notice: 'cocktail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredient, :description, :dose)
  end
end
