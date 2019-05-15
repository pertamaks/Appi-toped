#
#
#  For Explicit Wait,
#
#
def wait_for
  Selenium::WebDriver::Wait.new(timeout: 15).until {yield}
end

#
#
#  For user swiping action behavior
#
#
class Swipe_action
  def self.left(y1, y2)
    Appium::TouchAction.new.swipe(start_x: 950, start_y: y1, end_x: 60, end_y: y2, duration: 800).perform
  end

  def self.right(y1, y2)
    Appium::TouchAction.new.swipe(start_x: 60, start_y: y1, end_x: 950, end_y: y2, duration: 800).perform
  end

  def self.up(x1, x2)
    Appium::TouchAction.new.swipe(start_x: x1, start_y: 200, end_x: x2, end_y: 1600, duration: 800).perform
  end

  def self.down(x1, x2)
    Appium::TouchAction.new.swipe(start_x: x1, start_y: 1600, end_x: x2, end_y: 200, duration: 800).perform
  end
end
#
#
#  For swiping action until user found the expected element
#
#
class Swipe_until

  attr_accessor :ajib
  @ajib = 0

  def self.see(text, swipedo)
    cur_screen = get_source
    prev_screen = ''
    until (exists {text_exact(text)}) || (cur_screen == prev_screen)
      swipedo
      prev_screen = cur_screen
      cur_screen = get_source
    end

    if exists {text_exact(text)}
      text_exact(text).click
    else
      raise("#{text} cannot be found")
    end
  end
end
