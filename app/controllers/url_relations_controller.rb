# frozen_string_literal: true

class UrlRelationsController < ApplicationController
  def index
    @url_relation = UrlRelation.find_or_initialize_by(input_url: params[:full_url])
  end

  def create
    @url_relation = UrlRelation.find_or_initialize_by(url_relation_params)

    if @url_relation.save
      redirect_to root_path(full_url: @url_relation.input_url)
    else
      render :index
    end
  end

  private

  def url_relation_params
    ulr_params = params.require(:url_relation).permit(:input_url)
    { input_url: Utils::UrlUtils.with_trailing_slash(ulr_params[:input_url]) }
  end
end
