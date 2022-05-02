# frozen_string_literal: true

helpers do
  def create_memo(memo)
    @mymemo_db.exec("INSERT INTO memo (title, content) VALUES ('#{escape(memo['title'])}', '#{escape(memo['content'])}');")
  end

  def edit_memo(edited_memo)
    @mymemo_db.exec("UPDATE memo SET title = '#{edited_memo['title']}', content = '#{escape(edited_memo['content'])}' WHERE id = '#{escape(@memo['id'])}'")
  end

  def delete_memo
    @mymemo_db.exec("DELETE FROM memo WHERE id = '#{escape(@memo['id'])}'")
  end

  def escape(string)
    @mymemo_db.escape_string(string)
  end
end
