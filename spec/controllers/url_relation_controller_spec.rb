# frozen_string_literal: true

require 'rails_helper'

describe UrlRelationsController do

  context '#new' do
    it 'renders successfully' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  context '#create' do
    it 'returns success' do
      post :create, params: { url_relation: { full_version: 'aaaa' } }
      expect(response).to have_http_status(:redirect)
    end

    it 'creates url_relation' do
      expect do
        post :create, params: { url_relation: { full_version: 'aaaa' } }
      end.to change { UrlRelation.count }.by(1)
    end
  end

end
