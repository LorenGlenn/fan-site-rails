require 'rails_helper'

describe "add a review process" do
  it "adds a new review" do
    visit works_path
    click_link 'New Comic'
    fill_in 'Name', :with => 'Batman'
    fill_in 'Description', :with => 'book'
    fill_in 'Artist', :with => 'Jim Capullo'
    fill_in 'Author', :with => 'Frank Miller'
    fill_in 'Subgenre', :with => 'superhero'
    fill_in 'Image', :with => 'http://www.go.com'
    click_on 'Save'
    click_on 'Batman'
    click_link 'New Review'
    fill_in 'Name', :with => 'Batman'
    fill_in 'Details', :with => 'book'
    fill_in 'Rating', :with => '10'
    click_on 'Save'
    expect(page).to have_content '10'

  end
end
