class SpotsController < ApplicationController
  # GET /spots
  # GET /spots.xml
  def index
    @spots = Spot.all
    
    if @spots.empty?
     for i in 1..12 do
      spot = Spot.new
      spot.occupied = false
      spot.save
     end
     @spots = Spot.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spots }
    end
  end
  
  def occupyspot
    @spot = Spot.find(params[:id])
    @spot.occupied = true
    @spot.save
    
    respond_to do |format|
      format.html { redirect_to("/") }
    end
    
  end
  
  def unoccupyspot
    @spot = Spot.find(params[:id])
    @spot.occupied = false
    @spot.save
    
    respond_to do |format|
      format.html { redirect_to("/") }
    end
    
  end

end
