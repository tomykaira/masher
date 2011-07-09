# coding: utf-8

configure :development do
  config = YAML::load_file('config.yml')
end

configure :production do
  SOME_VALUE = ENV['SOME_VAUE']
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
  def get_tweets(hash)
    {:test => 'aaa'}
  end
  def transform(tweets)
    {:test2 => 'bbb'}
  end
end

get '/styles.css' do
  scss :styles
end

get '/script.js' do
  coffee :script
end

get '/' do
  haml :index
end

get '/tweets/:hash' do
  pass if hash.blank?
  tweets = get_tweets(hash)
  data = transform(tweets)
  data.to_json
end
