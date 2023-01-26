class navigation
    static var max_pages = 3
    static var mapping = {0: 1, 10: 2, 20: 3}
    var page_num, ticks

    def init()
        self.page_num = 1
        self.ticks = 0     
    end
    def next_page()
        self.page_num = self.page_num + 1
        if self.page_num == navigation.max_pages
            self.page_num = 1
        end
    end
    def handle_timer()
        self.ticks = self.ticks + 1
        if navigation.mapping.contains(self.ticks)
            self.next_page()
        end
        if self.ticks == 30
            self.ticks = 0
        end
    end
end

var nav = navigation()
global.nav = nav


#-
print(nav.ticks)
print(nav.page_num)
for i: 1 .. 10
    nav.handle_timer()
end
print(nav.ticks)
print(nav.page_num)
-#

#-
if !tasmota.memory().contains("psram")
    print("PSRAM")
else
    print("No PSRAM")
end
-#

