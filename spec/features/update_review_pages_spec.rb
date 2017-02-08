require 'rails_helper'

describe "the delete a review process" do
  it "deletes a review" do
    visit works_path
    click_link 'New Comic'
    fill_in 'Name', :with => 'Batman'
    fill_in 'Description', :with => 'book'
    fill_in 'Artist', :with => 'Jim Capullo'
    fill_in 'Author', :with => 'Frank Miller'
    fill_in 'Subgenre', :with => 'superhero'
    fill_in 'Image', :with => 'http://www.go.com'
    click_on 'Save'
    click_link 'Batman'
    click_link 'New Review'
    fill_in 'Name', :with => 'James Capullo'
    fill_in 'Details', :with => 'sad'
    fill_in 'Rating', :with => 1
    click_on 'Save'
    click_link 'Edit'
    fill_in 'Name', :with => 'Clark Kent'
    fill_in 'Details', :with => 'strong'
    fill_in 'Rating', :with => 6
    click_on 'Save'
    expect(page).to have_content 'Clark'
  end
end
