class UrlRelationsController < ApplicationController
  def new
    @url_relation = UrlRelation.new
  end

  def create
    @url_relation = UrlRelation.new(url_relation_params)

    if @url_relation.save
      redirect_to new_url_relation_path
    else
      render :new
    end
  end

  private

  def url_relation_params
    params.require(:url_relation).permit(:full_version)
  end
end
