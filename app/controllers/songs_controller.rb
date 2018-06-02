class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:edit, :create, :update, :destroy]
  
  def index
    @songs = @artist.songs
  end

  def new
    @song = Song.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @song = @artist.songs.create(song_params)
    if @song.save
      redirect_to [@artist, @song]
    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to [@artist, @song]
    else
      render :form
    end
  end

  def destroy
    @song.destroy
    redirect_to @artist
  end

  private

  def song_params
    params.require(:song).permit(:title, :rating)
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Songs.find(params[:id])
  end
end
