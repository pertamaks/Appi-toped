Given("user reach home screen") do
  wait_for {find_exact('Cek Rekomendasi')}

end

Then("user scroll down to see {string}") do |string|
  Swipe_until.see(string, Swipe_action.down(0.5, 0.5))
end

Then("user open the {string} menu") do |string|
  wait_for {text(string).click}
end
