require 'spec_helper'

describe MoviesController do
  describe 'show' do
    before :each do
      @fake_movie = FactoryGirl.create(:movie)
      get :show, { :id => @fake_movie.id}
    end
    it 'should select the show template for rendering' do
      response.should render_template('show')
    end
    it 'should make the movie available to that template' do
      assigns(:movie).should == @fake_movie
    end
  end
end
