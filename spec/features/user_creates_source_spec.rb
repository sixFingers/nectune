require 'rails_helper'
require 'spec_helper'
require 'features_helper'

feature 'User imports a new source' do
  scenario 'from a valid site url' do
    sign_up('ignazio.setti@gmail.com', 'abrogato')
    # sign_in('ignazio.setti@gmail.com', 'abrogato')
    visit new_source_path
    fill_in 'lookup_url', with: 'http://thenextweb.com/'
    click_button 'Search'
    expect(page).to have_css '.checkbox', count: 2
  end

  scenario 'from a valid feed url' do
    sign_up('ignazio.setti@gmail.com', 'abrogato')
    # sign_in('ignazio.setti@gmail.com', 'abrogato')
    visit new_source_path
    fill_in 'lookup_url', with: 'http://www.wired.com/feed/'
    click_button 'Search'
    expect(page).to have_css '.checkbox', count: 1
  end

  scenario 'from a url without http' do
    sign_up('ignazio.setti@gmail.com', 'abrogato')
    # sign_in('ignazio.setti@gmail.com', 'abrogato')
    visit new_source_path
    fill_in 'lookup_url', with: 'www.wired.com/feed/'
    click_button 'Search'
    expect(page).to have_css '.checkbox'
  end

end
