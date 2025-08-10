module Admin
  class Admin::ArticlesController < ApplicationController
    before_action :set_article, only: %i[ show edit update destroy ]

    # GET /admin/articles or /admin/articles.json
    def index
      @articles = Article.all
    end

    # GET /admin/articles/1 or /admin/articles/1.json
    def show
    end

    # GET /admin/articles/new
    def new
      @article = Article.new
    end

    # GET /admin/articles/1/edit
    def edit
    end

    # POST /admin/articles or /admin/articles.json
    def create
      @article = Article.new(article_params)

      if params[:commit_submit_review]
        @article.status = :waiting_for_review
      else
        @article.status = :draft
      end

      respond_to do |format|
        if @article.save
          format.html { redirect_to [ :admin, @article ], notice: "Article was successfully created." }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/articles/1 or /admin/articles/1.json
    def update
      # อัปเดตสถานะก่อน เพราะจะใช้กับ update
      if params[:commit_submit_review]
        @article.status = :waiting_for_review
      elsif params[:commit_save_draft]
        @article.status = :draft
      end

      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to [ :admin, @article ], notice: "Article was successfully updated.", status: :see_other }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end


    # DELETE /admin/articles/1 or /admin/articles/1.json
    def destroy
      @article.destroy!

      respond_to do |format|
        format.html { redirect_to admin_articles_path, notice: "Article was successfully destroyed.", status: :see_other }
        format.json { head :no_content }
      end
    end

    # def submit
    # if @article.update(article_params.merge(status: : waiting_for))
    #   redirect_to [:admin, @article], notice: "Article was sucessful"
    # else
    #   ???
    # end
    # end

    def approve
    end

    def reject
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def article_params
        params.expect(article: [ :title, :description, :cover_image ])
      end
  end
end
