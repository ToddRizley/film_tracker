require 'rails_helper'

describe Movie do
  before :each do
    @movie1 = FactoryGirl.create(:movie)
    @movie2 = FactoryGirl.create(:movie, status: 'Seen')
  end

  it '#update_status changes status to Seen' do
    movie1_unaltered = @movie1.status
    @movie1.update_status
    expect(movie1_unaltered).to_not eql(@movie1.status)
  end

  it '#update_status changes status to Not Seen' do
    expect(@movie2.status).to eql(1)
    @movie2.update_status
    expect(@movie2.status).to eql(0)
  end
end
