require 'rails_helper'

describe Movie do
  describe 'instance methods' do
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

  describe 'class methods' do
    before :each do
      @params = {}
      @params1 = { 'name' => { 'category' => 'All' } }
      @params2 = { 'name' => { 'category' => 'Best Picture' } }
      @category = FactoryGirl.create(:oscar_category)
      @movie1 = FactoryGirl.create(:movie, title: 'Movie 1')
      FactoryGirl.create(:movie, title: 'Movie 2')
      FactoryGirl.create(:movie, title: 'Movie 3')
      @movie4 = FactoryGirl.create(:movie, title: 'Movie 4')
      @movie4.oscar_categories << @category
      @movie4.save!
    end
    it '#self.filter_by_category filters if no category selected' do
      movies = Movie.filter_by_category(@params)
      expect(movies.count).to eq(4)
      expect(movies.first).to eq(@movie1)
      expect(movies.last).to eq(@movie4)
    end

    it '#self.filter_by_category filters if category is All ' do
      movies = Movie.filter_by_category(@params1)
      expect(movies.count).to eq(4)
      expect(movies.first).to eq(@movie1)
      expect(movies.last).to eq(@movie4)
    end

    it '#self.filter_by_category filters if category is selected ' do
      movies = Movie.filter_by_category(@params2)
      expect(movies.count).to eq(1)
      expect(movies.first).to eq(@movie4)
      expect(movies.first.oscar_categories[0].name).to eq('Best Picture')
    end
  end
end
