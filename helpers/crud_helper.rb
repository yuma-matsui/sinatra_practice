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
    memo = {
      title: memo['title'],
      content: memo['content']
    }
    @mymemo_db.exec('INSERT INTO memo (title, content) VALUES ($1, $2);', memo.values)
  end

  def edit_memo(edited_memo)
    memo = {
      title: edited_memo['title'],
      content: edited_memo['content'],
      id: @memo['id']
    }
    @mymemo_db.exec_params('UPDATE memo SET title = $1, content = $2 WHERE id = $3;', memo.values)
  end

  def delete_memo
    @mymemo_db.exec('DELETE FROM memo WHERE id = $1;', [@memo['id']])
  end
end
