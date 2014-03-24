class BeersController < ApplicationController
  
  before_action :set_beer,           only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @beers = Beer.search_for(params[:query]).limit(100)
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
    @comment = Comment.new
  end

  def edit
    @followed = Followings.where(follower: current_user)
  end

  def update
    @beer.users.each do |u|
      unless params[:currentBrewers].include?(u.id.to_s)
        BeersUsers.where(beer_id: @beer.id, user_id: u.id).first.destroy
      end
    end

    unless params[:newBrewers].nil?
      params[:newBrewers].each do |u|
        @beer.users << User.find(u)
      end
    end

    @beer.update_attributes(beer_params)

    redirect_to beer_path(@beer)
  end

  def destroy
    @beer.users.destroy

    @beer.destroy
    redirect_to beers_path
  end

  def set_beer
    @beer = Beer.find(params[:id])
  end

  private
  def beer_params
  	params.require(:beer).permit(:id, :name, :beer_style_id, :og, :fg, :abv, :dateBrewed, :dateBottled, :priming, :recipe, :rating, :brewerComment)
  end
end