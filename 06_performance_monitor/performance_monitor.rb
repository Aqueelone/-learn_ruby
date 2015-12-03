require "time"

def measure(n = 1)
  time_start = Time.now
  i = n
  begin
    yield
    i -=1
  end until i <= 0
  (Time.now - time_start) / n
end