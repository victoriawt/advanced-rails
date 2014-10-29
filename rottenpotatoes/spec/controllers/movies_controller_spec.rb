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
  describe 'index' do
    before :each do
      @fake_movie = FactoryGirl.create(:movie)
      get :index
    end
    it 'should select the index template for rendering' do
      response.should render_template('index')
    end
    it 'should make all the movies available to that template' do
      assigns(:movies).should == [@fake_movie] 
    end
    describe 'restful routing' do
      before :each do
        @session = {}
        @session[:sort] = 'title'
        @session[:ratings] = Hash[Movie.all_ratings.map{|r| [r,r]}]
      end
      it 'should redirect if session is specified and params are not' do
        get :index, nil, @session
        response.should redirect_to movies_path(@session)
      end
      it 'should redirect if only sort is specified' do
        params = {:sort => 'release_date'} 
        get :index, params, @session
        @session.merge! params
        response.should redirect_to movies_path(@session)
      end
      it 'should redirect if ratings differ' do
        params = @session.clone
        params[:ratings] = {'G' => 'G'}
        get :index, params, @session
        response.should redirect_to movies_path(params)
      end
      it 'should not redirect if parameters match the session exactly' do
        get :index, @session, @session
        response.should render_template 'index'
      end
    end
  end
end
