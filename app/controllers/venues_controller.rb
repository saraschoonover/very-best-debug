class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/index" })
  end

  def show
    venue_id = params.fetch("an_id")
    @the_venue = Venue.find(venue_id)
    
    render({ :template => "venue_templates/show" })
  end

  def create
    @venue = Venue.new
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    @venue.save

    redirect_to("/venues/#{@venue.id}")
  end
  
  def update
    the_id = params.fetch("the_id")
    @the_venue = Venue.find(the_id)
   

    @the_venue.address = params.fetch("query_address")
    @the_venue.name = params.fetch("query_name")
    @the_venue.neighborhood = params.fetch("query_neighborhood")
    @the_venue.save
    
    redirect_to("/venues/#{@the_venue.id}")
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_venue = Venue.find(the_id)
    @the_venue.destroy
    

    redirect_to("/venues")
  end

end
