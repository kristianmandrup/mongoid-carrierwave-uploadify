class PetsittersController < ApplicationController
  # GET /petsitters
  # GET /petsitters.xml
  def index
    @petsitters = Petsitter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @petsitters }
    end
  end

  # GET /petsitters/1
  # GET /petsitters/1.xml
  def show
    @petsitter = Petsitter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @petsitter }
    end
  end

  # GET /petsitters/new
  # GET /petsitters/new.xml
  def new
    @petsitter = Petsitter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @petsitter }
    end
  end

  # GET /petsitters/1/edit
  def edit
    @petsitter = Petsitter.find(params[:id])
  end

  # POST /petsitters
  # POST /petsitters.xml
  def create
    @petsitter = Petsitter.new(params[:petsitter])

    respond_to do |format|
      if @petsitter.save
        format.html { redirect_to(@petsitter, :notice => 'Petsitter was successfully created.') }
        format.xml  { render :xml => @petsitter, :status => :created, :location => @petsitter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @petsitter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /petsitters/1
  # PUT /petsitters/1.xml
  def update
    @petsitter = Petsitter.find(params[:id])

    respond_to do |format|
      if @petsitter.update_attributes(params[:petsitter])
        format.html { redirect_to(@petsitter, :notice => 'Petsitter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @petsitter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /petsitters/1
  # DELETE /petsitters/1.xml
  def destroy
    @petsitter = Petsitter.find(params[:id])
    @petsitter.destroy

    respond_to do |format|
      format.html { redirect_to(petsitters_url) }
      format.xml  { head :ok }
    end
  end
end
