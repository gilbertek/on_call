module AppointmentsHelper
  def display_date_format(datetime)
    datetime.strftime("%Y-%m-%d %l:%M %p")
  end
end
