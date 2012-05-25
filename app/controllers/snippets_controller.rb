class SnippetsController < ApplicationController
  skip_authorization_check only: [:index, :show]
  before_filter :authorize, except: [:index, :show]
  before_filter :load_snippets

  # GET /snippets
  # GET /snippets.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @snippets }
    end
  end

  # GET /snippets/1
  # GET /snippets/1.json
  def show
    @snippet = Snippet.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @snippet }
    end
  end

  # GET /snippets/new
  # GET /snippets/new.json
  def new
    @snippet = Snippet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @snippet }
    end
  end

  # GET /snippets/1/edit
  def edit
    @snippet = Snippet.find_by_slug(params[:id])
  end

  # POST /snippets
  # POST /snippets.json
  def create
    @snippet = Snippet.new(params[:snippet])

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to @snippet, flash: { success: 'Snippet was successfully created.' } }
        format.json { render json: @snippet, status: :created, location: @snippet }
      else
        format.html { render action: "new" }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /snippets/1
  # PUT /snippets/1.json
  def update
    @snippet = Snippet.find_by_slug(params[:id])

    respond_to do |format|
      if @snippet.update_attributes(params[:snippet])
        format.html { redirect_to @snippet, flash: { success: 'Snippet was successfully updated.' } }
        format.json { render json: nil, status: :ok }
      else
        format.html do
          flash.now[:error] = 'There was a problem updating the snippet.'
          render action: "edit"
        end
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.json
  def destroy
    @snippet = Snippet.find_by_slug(params[:id])
    @snippet.destroy

    respond_to do |format|
      format.html { redirect_to snippets_url, flash: { success: 'Snippet was successfully deleted.' } }
      format.json { render json: nil, status: :ok }
    end
  end

  private

  def authorize
    authorize! :manage, Snippet
  end

  def load_snippets
    @categories = Snippet.select(:category).uniq.order("category")
    @categories.map! { |s| s.category }
    @snippet_count = Snippet.count
  end
end

