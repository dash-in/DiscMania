module ApplicationHelper
    def simple_time(time)
        time.strftime("%Y-%m-%d %H:%M")
    end 
    def simple_date(time)
        time.strftime("%Y-%m-%d")
    end
end
