# frozen_string_literal: true

helpers do
  def create_memo(memo)
    memo = {
      title: escape(memo['title']),
      content: escape(memo['content'])
    }
    @mymemo_db.exec('INSERT INTO memo (title, content) VALUES (?, ?);', memo.values)
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
    @mymemo_db.exec('DELETE FROM memo WHERE id = $1;', [escape(@memo['id'])])
  end

  def escape(string)
    @mymemo_db.escape_string(string)
  end
end
