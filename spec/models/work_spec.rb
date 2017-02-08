require 'rails_helper'

describe Work do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :artist }
  it { should validate_presence_of :author }
  it { should validate_presence_of :image }

  it { should have_many :reviews }
end
