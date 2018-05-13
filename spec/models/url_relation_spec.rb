# frozen_string_literal: true

require 'rails_helper'

describe UrlRelation do
  it 'creates successfully' do
    expect do
      UrlRelation.create!(full_version: 'http://aaaa.com')
    end.to_not raise_error
  end

  it 'automatically generates short version' do
    expect do
      UrlRelation.create!(full_version: 'http://aaaa.com')
    end.to_not raise_error
  end

  it 'raise error if full_version is not unique' do
    UrlRelation.create!(full_version: 'http://aaaa.com/')
    expect do
      UrlRelation.create!(full_version: 'http://aaaa.com/')
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'raise validation error in case of empty full version field' do
    expect do
      UrlRelation.create!(full_version: nil)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'raise validation error in case of not valid url in version field' do
    expect do
      UrlRelation.create!(full_version: 'aaa')
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
