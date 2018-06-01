class ArtistsController < ApplicationController
  before_action :set_board
  before_action :set_artist, only: [:edit, :show, :update, :destroy]
  
  def index
    @artists = @board.artists 
  end

  def new
    @artist = Artist.new 
    render :form
  end

  def show
  end

  def edit
    render :form
  end

  def create 
    @artist = @board.artists.create(artist_params)
    if @artist.save 
      redirect_to board_path(@board)
    else
      render :new 
  end

  def update
    if @artist.update(artist_params)
      redirect_to [@board, @artist]
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy 
    redirect_to board_path(@board)
  end

  private 

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:aritst).permit(:name)
  end
end
