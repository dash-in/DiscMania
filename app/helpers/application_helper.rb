module ApplicationHelper
    def simple_time(time)
        if time == nil
            nil
        else
            time.strftime("%Y-%m-%d %H:%M")
            
        end
    end 
    def simple_date(time)
        if time == nil
            nil
        else
            time.strftime("%Y-%m-%d")
        end
    end
end
