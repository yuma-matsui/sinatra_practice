# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require_relative 'helpers/crud_helper'
require_relative 'helpers/get_memo_helper'
require_relative 'helpers/params_helper'

STORAGE_FILE = 'storage/memo.txt'

before '/*' do
  @memos = extract_memos
end

before %r{/memo/([1-9]+[0-9]*)[/edit]*} do |id|
  id = id.to_i
  @memo = find_memo(id)
end

get '/' do
  erb :index
end

get '/memo' do
  erb :memo_new
end

post '/memo' do
  if params_blank?(params)
    redirect to('/memo')
  else
    memo = formated_params(params)
    create_memo(memo)
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
    redirect to("/memo/#{@memo[:id]}/edit")
  else
    memo_params = remove_unnecessary_entries(params)
    edited_memo = formated_params(memo_params)
    edit_memo(edited_memo)
    redirect to("/memo/#{@memo[:id]}")
  end
end

delete '/memo/:id' do
  delete_memo(@memo)
  redirect to('/')
end
