# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
describe 'Simpletest' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'simpletest' do
    @driver.get('http://localhost:3000/')
    @driver.find_element(:name, 'max_n').click
    @driver.find_element(:name, 'max_n').send_keys('10000')
    @driver.find_element(:name, 'commit').click
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:id, 'result').displayed? }
    expect(@driver.find_element(:css, 'tr:nth-child(5) > td:nth-child(1)').text).to eq('720')
  end
end
