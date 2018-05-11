# frozen_string_literal: true

require 'rails_helper'

describe UrlRelation do

  it 'creates successfully' do
    expect { UrlRelation.create!(short_version: 'aaa', full_version: 'ddddd') }.to_not raise_error
  end

  it 'automatically generates short version' do
    expect { UrlRelation.create!(short_version: nil, full_version: 'ddddd') }.to_not raise_error(ActiveRecord::RecordInvalid)
  end

  it 'raise validation error in case of empty full version field' do
    expect { UrlRelation.create!(short_version: 'aaa', full_version: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
