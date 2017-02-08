require 'rails_helper'

describe "the delete a work process" do
  it "deletes a work" do
    visit works_path
    click_link 'New Work'
    fill_in 'Name', :with => 'Batman'
    fill_in 'Description', :with => 'book'
    fill_in 'Artist', :with => 'Jim Capullo'
    fill_in 'Author', :with => 'Frank Miller'
    fill_in 'Subgenre', :with => 'superhero'
    fill_in 'Image', :with => 'http://www.go.com'
    click_on 'Create Work'
    click_link 'Batman'
    click_link 'Delete Work'
    expect(page).to_not have_content 'Batman'
  end
end
