# frozen_string_literal: true

require 'pg'

helpers do
  def all_memos
    @mymemo_db.exec('SELECT * FROM memo ORDER BY created_at;')
  end

  def find_memo(id)
    @memos.find { |memo| memo['id'] == id }
  end

  def create_memo(memo)
    @mymemo_db.exec("INSERT INTO memo (title, content) VALUES ('#{memo['title']}', '#{memo['content']}');")
  end

  def edit_memo(params)
    @mymemo_db.exec("UPDATE memo SET title = '#{params['title']}', content = '#{params['content']}' WHERE id = '#{@memo['id']}'")
  end

  def delete_memo
    @mymemo_db.exec("DELETE FROM memo WHERE id = '#{@memo['id']}'")
  end
end
