describe "Movie" do
  describe "model validations" do
    it "should reject an empty title" do
      m = Movie.new(:title => '', :rating => 'G', :release_date => '1980-01-01')
      m.should_not be_valid
      m.errors[:title].should == ["can't be blank"]
    end
    it "should reject an invalid rating" do
      m = Movie.new(:title => 'HelloWorld', :rating => 'RG', :release_date => '1980-01-01')
      m.should_not be_valid
      m.errors[:rating].should == ["is not included in the list"]
    end
    it "should reject an empty rating" do
      m = Movie.new(:title => 'HelloWorld', :rating => '', :release_date => '1980-01-01')
      m.should_not be_valid
      m.errors[:rating].should == ["can't be blank"]
    end
    it "should grandfather a movie older than 1968 with no rating"
      m = Movie.new(:title => 'HelloWorld', :rating => '', :release_date => '1960-01-01')
      m.should_not be_valid
      m.errors[:rating].should == ["can't be blank"]
    end
    it "should reject an empty date" do
      m = Movie.new(:title => 'HelloWorld', :rating => 'PG', :release_date => '')
      m.should_not be_valid
      m.errors[:release_date].should == ["can't be blank"]
    end
    it "should reject a date older than 1930"
      m = Movie.new(:title => 'HelloWorld', :rating => 'PG', :release_date => '1920-01-01')
      m.should_not be_valid
      m.errors[:release_date].should == ["Release date must be 1930 or later"]
    end
end
