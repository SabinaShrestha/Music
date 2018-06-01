class BoardsController < ApplicationController
  before_action :set_board, only: [:edit, :update, :show, :destroy]
  before
  
  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
    render :form
  end

  def edit
    render :form
  end

  def update
    if @board.update(board_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create 
    @board = Board.new(board_params)
    if @board.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @board.destroy
    redirect_to root_path
  end


  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:genre)
  end

end
