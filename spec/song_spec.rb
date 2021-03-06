describe "Song class" do
  before(:each) do 
    @song = Song.new.tap do |s|
      binding.pry
      s.name = "Party in the USA"
      s.artist_id = 1
      s.genre_id = 1
      s.save
    end

    @genre = Genre.new.tap do |g|
      g.name = "pop"
      g.save
    end
    
    @artist = Artist.new.tap do |a|
      a.name = "Miley"
      a.save
    end
  end
  
  it "lists instances in all method" do
    expect(Song.all.size).to eq(1)
  end

  it "can find by name" do
    expect(Song.find_by_name("Party in the USA")).to eq(@song)
  end

  # it "can create instance from db row" do
  #   @adele = Song.new
  #   @adele.name = 
  #   @adele.genre = 
  #   @adele.artist = 
  #   expect(self.new_from_db(["Adele", "Rolling In the Deep", "folk"])).to eq()
  # end

  it "initializes correctly" do 
    expect(@song).to be_an_instance_of(Song)
  end

  it "has a name" do
    expect(@song.name).to eq("Party in the USA") 
  end

  it "can initalize parsed filenames as Song instances" do
    @song.get_songs
    expect(@song.all.length).to eq(Parser.files.length)
  end

  it "knows its artist" do 
    expect(@song.artist).to eq(miley)
  end

  it "can determine song genres" do 
    expect(@song.genre).to eq(pop)
  end
end