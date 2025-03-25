class PricesController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]
  before_action :set_price, only: [:show, :edit, :update, :destroy]

  # GET /prices
  # GET /prices.json
  def index
    if params[:search]
      @prices = Price.where(entity_name: params[:search])
    else
      @prices = Price.all
    end
  end

  # GET /prices/1
  # GET /prices/1.json
  def show
  end

  # GET /prices/new
  def new
    @entities = Entity.pluck(:name)
    @price = Price.new
  end

  # GET /prices/1/edit
  def edit
  end

  # POST /prices
  # POST /prices.json
  def create
    #@price = Price.new(price_params)

    @entities = Entity.pluck(:name)

    @entities.each do | entity |
      fuel = Entity.find_by_name(entity)
      fuel_price = price_params["price_#{entity.parameterize.underscore}"].to_i
      if fuel_price > 0
        Price.create!(entity_id: fuel.id, entity_name: fuel.name,  price_on: price_params["common_date"].to_date, price: fuel_price)
      end
    end

    #respond_to do |format|
    #  if @price.save
    #    format.html { redirect_to prices_path, notice: 'Price was successfully created.' }
    #    format.json { render :show, status: :created, location: @price }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @price.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /prices/1
  # PATCH/PUT /prices/1.json
  def update
    respond_to do |format|
      if @price.update(price_params)
        format.html { redirect_to @price, notice: 'Price was successfully updated.' }
        format.json { render :show, status: :ok, location: @price }
      else
        format.html { render :edit }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    @price.destroy
    respond_to do |format|
      format.html { redirect_to prices_url, notice: 'Price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_params
      params.permit(:authenticity_token, :commit, :common_date, :price_ron95, :price_ron97, :price_diesel, :price_diesel_euro5, :price_ron100, :price_vpower )
    end
end
