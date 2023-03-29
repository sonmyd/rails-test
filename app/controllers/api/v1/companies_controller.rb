class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show update destroy ]
  before_action :set_models, only: [:index, :show]
  # GET /companies
  def index
    @companies = Company.all

    render json: @companies, include: @models
  end

  # GET /companies/1
  def show
    render json: @company, include: @models
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  private
    def set_models
      @models = [:worker]
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :headline)
    end
end
