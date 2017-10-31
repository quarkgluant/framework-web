require 'rspec'
require 'spec_helper'
require 'capybara/rspec'
require 'capybara'
require 'capybara/dsl'

Capybara.run_server = false
Capybara.current_driver = :selenium_chrome
Capybara.app_host = 'http://localhost:9292'


feature 'posts home page' do
  scenario 'Blog message' do
    visit('/posts')
    expect(page).to have_content('Blog de Pat')
  end
end

feature 'show one post' do
  scenario 'Blog message' do
    visit('/posts')
    expect(page).to have_content('Blog de Pat')
  end
end
