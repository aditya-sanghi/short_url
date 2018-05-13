# frozen_string_literal: true

class UrlRelationsController < ApplicationController
  def new
    @url_relation = UrlRelation.find_or_initialize_by(full_version: params[:full_url])
  end

  def create
    @url_relation = UrlRelation.find_or_initialize_by(url_relation_params)
    @url_relation.domain_url = root_url

    if @url_relation.save
      redirect_to new_url_relation_path(full_url: @url_relation.full_version)
    else
      render :new
    end
  end

  private

  def url_relation_params
    params.require(:url_relation).permit(:full_version)
  end
end
