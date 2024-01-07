module MessagesHelper
  def formatted_message_creation_dt_for_room(room)
    creation_date = last_message_creation_dt(room)
    return unless creation_date.present?

    format = case
             when creation_date.today? then "%l:%M %p"
             when ((1.weeks.ago)..(1.day.ago)).cover?(creation_date) then "%a"
             else "%d-%m-%Y"
             end

     creation_date.strftime(format)
  end

  def last_message_text(room) = room.last_message&.body&.truncate_words(4) || 'Write your first message'

  private def last_message_creation_dt(room) = room.last_message&.created_at
end
