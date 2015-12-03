class Timer
  require "time"

  def initialize
    @seconds = 0
    @time_string = "00:00:00"
  end

  def seconds=(seconds)
    @seconds = seconds
    @time_string = Time.at(@seconds).utc.strftime("%H:%M:%S")
  end

  def seconds
    @seconds
  end

  def time_string
    @time_string
  end
end
