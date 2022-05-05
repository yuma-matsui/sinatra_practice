# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'cgi'
require_relative 'helpers/crud_helper'
require_relative 'helpers/params_helper'
require_relative 'helpers/utility_helper'

STORAGE_FILE = 'storage/memo.csv'

before '/*' do
  @memos = extract_memos
end

before %r{/memo/([1-9]+[0-9]*)[/edit]*} do |id|
  @memo = find_memo(id)
  not_found if @memo.nil?
end

not_found do
  erb :error_page
end

get '/' do
  erb :index
end

get '/memo' do
  erb :memo_new
end

post '/memo' do
  if params_blank?(params)
    @error_msg = '内容に不備があります'
    erb :memo_new
  else
    create_memo(params)
    redirect to('/')
  end
end

get '/memo/:id' do
  erb :memo
end

get '/memo/:id/edit' do
  erb :memo_edit
end

patch '/memo/:id' do
  if params_blank?(params)
    @error_msg = '内容に不備があります'
    erb :memo_edit
  else
    memo_params = remove_unnecessary_entries(params)
    edit_memo(memo_params)
    redirect to("/memo/#{@memo[0]}")
  end
end

delete '/memo/:id' do
  delete_memo
  redirect to('/')
end
