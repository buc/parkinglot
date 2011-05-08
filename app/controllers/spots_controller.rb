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
    end
     @spot_1 = Spot.find(1)
     @spot_2 = Spot.find(2)
     @spot_3 = Spot.find(3)
     @spot_4 = Spot.find(4)
     @spot_5 = Spot.find(5)
     @spot_6 = Spot.find(6)
     @spot_7 = Spot.find(7)
     @spot_8 = Spot.find(8)
     @spot_9 = Spot.find(9)
     @spot_10 = Spot.find(10)
     @spot_11 = Spot.find(11)
     @spot_12 = Spot.find(12)

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
