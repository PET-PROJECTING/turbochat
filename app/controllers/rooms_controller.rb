class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :initiate_room,
                :preload_rooms,
                :preload_users,
                only: [:index, :show]

  def index; end

  def show
    @single_room = Room.find(params[:id])
    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    render 'index'
  end

  def create = @room = Room.create(room_params)

  private

  # Preloading/Initiating
  def initiate_room = @room = Room.new
  def preload_rooms = @rooms = Room.public_rooms
  def preload_users = @users = User.all_except(current_user)

  # Strong params
  def room_params = params.require(:room).permit(:name)
end
