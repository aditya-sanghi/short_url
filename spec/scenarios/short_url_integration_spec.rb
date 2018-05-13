require 'rails_helper'

feature 'Short URL integration tests' do
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
end
