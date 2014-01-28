class BeersController < ApplicationController
  
  before_action :set_beer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @beers = current_user.beers.order(dateBrewed: :desc)
  end

  def new
  	@beer = Beer.new
    @beer_styles = BeerStyle.all
  end

  def create
    @beer = Beer.create(beer_params)

    if @beer.save
      current_user.beers << @beer
      redirect_to "/beers/#{@beer.id}", notice: "Beer Successfully Created!"
    else
      flash[:error] = "Something went wrong! Please double-check your records."
      redirect_to new_beer_path
    end
  end

  def show
  end

  def edit
  end

  def update
  	@beer.update_attributes(beer_params)
    redirect_to beer_path
  end

  def destroy
    @beer.destroy
    redirect_to beers_path
  end

  def search
    @query = params[:query].to_s
    @beers = Beer.search_for(params[:query])
  end

  private
  def beer_params
  	params.require(:beer).permit(:id, :name, :beer_style_id, :og, :fg, :abv, :dateBrewed, :dateBottled, :priming, :recipe, :rating, :brewerComment)
  end

  def set_beer
    @beer = Beer.find(params[:id])
  end
end
