class CompaniesController < ApplicationController
  before_filter :find_or_build_company, :except => :index

  def index
    @companies = Company.all
  end

  def show
  end

  def new
  end

  def edit
    
  end

  def create
    if @company.save
      redirect_to @company, :notice => 'Company successfully created'
    else
      render :new
    end
  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to @company, :notice => 'Company successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to :companies
  end

private
  def find_or_build_company
    @company = params[:id] ? Company.find(params[:id]) : Company.new(params[:company])
  end
end

