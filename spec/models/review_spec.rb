require 'rails_helper'

describe Review do
  it { should validate_presence_of :name }
  it { should validate_presence_of :details }
  it { should validate_presence_of :rating }

  it { should belong_to :work }
end
