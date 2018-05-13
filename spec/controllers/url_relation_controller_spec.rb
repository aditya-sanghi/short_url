# frozen_string_literal: true

require 'rails_helper'

describe UrlRelationsController do
  context '#index' do
    it 'renders successfully' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context '#create' do
    it 'returns success' do
      post :create, params: { url_relation: { full_version: 'http://aaaa.com' } }
      expect(response).to have_http_status(:redirect)
    end

    it 'creates url_relation' do
      expect do
        post :create, params: { url_relation: { full_version: 'http://aaaa.com' } }
      end.to change { UrlRelation.count }.by(1)
    end

    it 'not redirects in case of empty params' do
      post :create, params: { url_relation: { full_version: '' } }
      expect(response).to have_http_status(:success)
    end

    it 'renders new in case of empty params' do
      expect(
        post(:create, params: { url_relation: { full_version: '' } })
      ).to render_template('url_relations/index')
    end
  end
end
