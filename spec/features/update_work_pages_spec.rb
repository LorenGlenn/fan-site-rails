require 'rails_helper'

describe "update work process" do
  it "update work object" do
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
    click_on 'Edit Batman'
    fill_in 'Name', :with => 'Superman'
    fill_in 'Description', :with => 'book'
    fill_in 'Artist', :with => 'Jim Capullo'
    fill_in 'Author', :with => 'Frank Miller'
    fill_in 'Subgenre', :with => 'superhero'
    fill_in 'Image', :with => 'http://www.go.com'
    click_on 'Save'
    expect(page).to have_content 'Superman'
  end
end
