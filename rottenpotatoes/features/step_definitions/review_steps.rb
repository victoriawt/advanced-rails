Given /the following reviews exist/ do |reviews_table|
  reviews_table.hashes.each do |review|
    review[:moviegoer] = Moviegoer.find_by_name review[:moviegoer]
    review[:movie]     = Movie.find_by_title review[:movie]
    Review.create! review
  end
end

Then(/^I should see (\w+)'s review with (\d+) (potato(?:|es))$/) do |name, potatoes, plural|
  step %Q{I should see "#{potatoes} #{plural} from #{name}"}
end

