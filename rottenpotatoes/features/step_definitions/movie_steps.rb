# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create! movie
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  assert(page.body =~ /#{e1}.*#{e2}/m, "#{e1} is not before #{e2}")
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split.each do |rating|
    step %Q{I #{uncheck}check "ratings_#{rating}"}
  end
end


Then /I should( not)? see the following movies: (.*)/ do |notsee, movies|
  movies.split(',').map{|x| x.strip}.each do |movie|
    step %Q{I should#{notsee} see "#{movie}"}
  end
end

Then /^I should not see any of the movies$/ do
  Movie.all.map{|x| x.title}.each do |movie|
    step %Q{I should not see "#{movie}"}
  end
end

Then /^I should see all of the movies$/ do
  Movie.all.map{|x| x.title}.each do |movie|
    step %Q{I should see "#{movie}"}
  end
end

Then /^I should see all movies sorted by (.*) in ([^\s]+) order$/ do |sort_field, ordering|
  sort_method = sort_field.gsub(/ /, '_')
  field_values = Movie.all.map{|x| x.send(sort_method)}.sort
  field_values.reverse!  if ordering == 'decreasing'
  0.upto(field_values.size - 1) do |i|
    step %Q{I should see "#{field_values[i]}" before "#{field_values[i+1]}"}
  end
end
