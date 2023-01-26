class navigation
    static var mapping = {0: 1, 10: 2, 20: 3}
    var ticks
    def init()
        self.ticks = 0            
    end
    def handle_timer()
        var pages = [global.p1, global.p1, global.p2, global.p3]
        if navigation.mapping.contains(self.ticks)
            pages[navigation.mapping[self.ticks]].show()
        end
        if self.ticks == 30
            self.ticks = 0
        else
            self.ticks = self.ticks + 1
        end
    end
end

var nav = navigation()
global.nav = nav
#tasmota.add_cron("*/1 * * * * *", /-> global.p2.show(), "every_1_s")
tasmota.add_cron("*/1 * * * * *", /-> nav.handle_timer(), "every_1_s")

#-
import introspect
introspect.members(nav)
-#

#-
if !tasmota.memory().contains("psram")
    print("PSRAM")
else
    print("No PSRAM")
end
-#







