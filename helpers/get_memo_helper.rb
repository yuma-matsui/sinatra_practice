# frozen_string_literal: true

require 'pg'

helpers do
  def all_memos
    @mymemo_db.exec('SELECT * FROM memo ORDER BY created_at;')
  end

  def find_memo(id)
    @memos.find { |memo| memo['id'] == id }
  end
end
