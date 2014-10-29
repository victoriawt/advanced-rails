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
  describe 'new' do
    it 'should render the new template' do
      get :new
      response.should render_template 'new'
    end
  end
  describe 'create' do
    before :each do
      post :create, :movie => {:title => 'Foo'}
    end
    it 'should create a new movie' do
      Movie.find_by_title('Foo').should_not == nil
    end
    it 'should redirect to the index' do
      response.should redirect_to movies_path
    end
    it 'should say the movie was successfully created' do
      flash[:notice].should =~ /Foo/
      flash[:notice].should =~ /was successfully created/
    end
  end
  describe 'edit' do
    before :each do
      @movie = Movie.create!(:title => 'Foo')
      get :edit, :id => 1
    end
    it 'should provide the appropriate movie' do
      assigns(:movie).should == @movie
    end
    it 'should render the edit template' do
      response.should render_template 'edit'
    end
  end
  describe 'update' do
    before :each do
      @movie = Movie.create!(:title => 'Foo')
      post :update, :id => @movie.id, :movie => {:title => 'Bar'}
    end
    it 'should update the movie' do
      Movie.find_by_id(@movie.id).title.should == 'Bar'
    end
    it 'should redirect to the movie details' do
      response.should redirect_to movie_path(@movie.id)
    end
    it 'should say the movie was successfully updated' do
      flash[:notice].should =~ /was successfully updated/
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
