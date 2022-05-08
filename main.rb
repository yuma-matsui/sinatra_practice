# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require_relative 'helpers/crud_helper'
require_relative 'helpers/params_helper'
require_relative 'helpers/utility_helper'

DB_NAME = 'mymemo'

configure do
  set :db, PG::Connection.new(dbname: DB_NAME)
end

before '/*' do
  @mymemo_db = settings.db
  @memos = all_memos
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
    edit_memo(params)
    redirect to("/memo/#{@memo['id']}")
  end
end

delete '/memo/:id' do
  delete_memo
  redirect to('/')
end
