module RoomsHelper
  def room_active?(room) =  ('active' if active?(room))

  private def active?(room) = params[:id] == room.id.to_s
end
