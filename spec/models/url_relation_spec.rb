# frozen_string_literal: true

require 'rails_helper'

describe UrlRelation do
  it 'creates successfully' do
    expect do
      UrlRelation.create!(input_url: 'http://aaaa.com')
    end.to_not raise_error
  end

  it 'automatically generates url' do
    expect do
      UrlRelation.create!(input_url: 'http://aaaa.com')
    end.to_not raise_error
  end

  it 'raise error if input_url is not unique' do
    UrlRelation.create!(input_url: 'http://aaaa.com/')
    expect do
      UrlRelation.create!(input_url: 'http://aaaa.com/')
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'raise validation error in case of empty input_url field' do
    expect do
      UrlRelation.create!(input_url: nil)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'raise validation error in case of not valid url in input_url field' do
    expect do
      UrlRelation.create!(input_url: 'aaa')
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
