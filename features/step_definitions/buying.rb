Given(/^user scroll left the quick menu$/) do
  # binding.pry
  Swipe_action.left(860, 860)
end

And(/^user tap the "([^"]*)" icon$/) do |value|
  wait_for { text(value).click }
end

When(/^user reach the "([^"]*)" menu$/) do |value|
  wait_for { find_exact(value).displayed? }
end

And(/^user enter "([^"]*)" on mobile number$/) do |value|
  id('com.tokopedia.tkpd:id/ac_client_number').send_keys(value)
end

And(/^user open the nominal window$/) do
  begin
    err_msg = 'Nomor telpon yang anda masukkan tidak valid'
    nominal = exists { id('com.tokopedia.tkpd:id/tv_operator_product_name') }
    if !nominal
      raise(err_msg)
    else
      id('com.tokopedia.tkpd:id/tv_operator_product_name').click
    end
  rescue RuntimeError
    p err_msg
  end
end

And(/^user select "([^"]*)" nominal$/) do |value|
  Swipe_until.see(value, Swipe_action.down(550, 550))
end

Then(/^user tap the "([^"]*)" button$/) do |value|
  find_exact(value).click
end

Then(/^user swipe left the top to the "([^"]*)"$/) do |value|
  @ajib = 0
  begin
    @ajib += 1
    Swipe_until.see(value, Swipe_action.left(300, 300))
  rescue RuntimeError
    retry if @ajib <= 5
  end
end

And(/^user swipe down to find "([^"]*)"$/) do |value|
  @ajib = 0
  begin
    @ajib += 1
    Swipe_until.see(value, Swipe_action.down(550, 550))
  rescue RuntimeError
    retry if @ajib <= 5
  end
end

And(/^user select the (\d+)(?:st|nd|rd|th)? "([^"]*)" text$/) do |index, value|
  # binding.pry
  text = find_elements(xpath: "//android.widget.TextView[@text='#{value}']")[index.to_i - 1]
  text.click
end
