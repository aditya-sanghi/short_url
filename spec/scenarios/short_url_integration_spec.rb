# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Short URL integration tests', type: :feature do
  scenario 'create short link' do
    visit root_path
    expect(page).to_not have_content 'Result URL:'

    fill_in 'Url', with: 'http://facebook.com'
    click_button 'Generate short url'

    expect(page).to have_content 'Result URL:'
  end

  scenario 'use short link' do
    visit root_path

    fill_in 'Url', with: 'http://facebook.com'
    click_button 'Generate short url'
    result_url = find(:css, '.result-url .result-value').text

    visit result_url
    expect(page.current_url).to eq('https://facebook.com/')
  end

  scenario 'use short link for incorrect path' do
    visit root_path

    fill_in 'Url', with: 'http://aaa12313aaa.com'
    click_button 'Generate short url'
    result_url = find(:css, '.result-url .result-value').text

    visit URI(result_url).path
    expect(page.current_url).to eq(result_url)
  end
end
