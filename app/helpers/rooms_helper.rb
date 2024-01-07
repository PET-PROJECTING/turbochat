module RoomsHelper
  def room_active?(room) = ('active' if ((params[:id] == room.id.to_s) && (controller_name == "rooms")))
end
