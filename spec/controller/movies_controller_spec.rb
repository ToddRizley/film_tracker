require 'rails_helper'

describe MoviesController, type: :controller do
    before(:each) do
      # @params = {}
      # @params1 = { 'name' => { 'category' => 'All' } }
      # @params2 = { 'name' => { 'category' => 'Best Picture' } }
      @category = FactoryGirl.create(:oscar_category)
      @movie1 = FactoryGirl.create(:movie, title: 'Movie 1')
      FactoryGirl.create(:movie, title: 'Movie 2')
      FactoryGirl.create(:movie, title: 'Movie 3')
      @movie4 = FactoryGirl.create(:movie, title: 'Movie 4')
      @movie4.oscar_categories << @category
      @movie4.save!
    end

    it 'GET #index' do
      expect(Movie).to receive(:filter_by_category)

      get :index, params: { "name" => { "category" => "All" } }
      expect(response.status).to eq 200
      ## fix this
      binding.pry
      expect(controller.instance_variable_get(:@movies).count).to eq(4)
    end

    it 'GET #show' do
      get :show, params: { 'id' => @movie1.id }
      expect(response.status).to eq 200
      expect(controller.instance_variable_get(:@movie)).to eq(@movie1)
    end
    #
    # it 'PUT #update' do
    #   message_body = 'This is a new message!'
    #   put :update, params: { conversation_id: @conversation.id, body: message_body }
    #   expect(response.status).to eq 200
    #   expect(controller.instance_variable_get(:@messages)[:messages].last[:body]).to eq(message_body)
    #   expect(response.content_type).to eq("application/json")
    #   expect(controller.current_user).to eq(@employer_user)
    # end
    #
end
