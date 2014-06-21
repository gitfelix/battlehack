class TestPicturesController < ApplicationController
  before_action :set_test_picture, only: [:show, :edit, :update, :destroy]

  # GET /test_pictures
  # GET /test_pictures.json
  def index
    @test_pictures = TestPicture.all
  end

  # GET /test_pictures/1
  # GET /test_pictures/1.json
  def show
  end

  # GET /test_pictures/new
  def new
    @test_picture = TestPicture.new
  end

  # GET /test_pictures/1/edit
  def edit
  end

  # POST /test_pictures
  # POST /test_pictures.json
  def create
    @test_picture = TestPicture.new(test_picture_params)

    respond_to do |format|
      if @test_picture.save
        format.html { redirect_to @test_picture, notice: 'Test picture was successfully created.' }
        format.json { render :show, status: :created, location: @test_picture }
      else
        format.html { render :new }
        format.json { render json: @test_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_pictures/1
  # PATCH/PUT /test_pictures/1.json
  def update
    respond_to do |format|
      if @test_picture.update(test_picture_params)
        format.html { redirect_to @test_picture, notice: 'Test picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_picture }
      else
        format.html { render :edit }
        format.json { render json: @test_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_pictures/1
  # DELETE /test_pictures/1.json
  def destroy
    @test_picture.destroy
    respond_to do |format|
      format.html { redirect_to test_pictures_url, notice: 'Test picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_picture
      @test_picture = TestPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_picture_params
     params.require(:test_picture).permit(:name, :description, :image)
    end
end
