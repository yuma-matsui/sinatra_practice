# frozen_string_literal: true

helpers do
  def create_memo(memo)
    @mymemo_db.exec("INSERT INTO memo (title, content) VALUES ('#{memo['title']}', '#{memo['content']}');")
  end

  def edit_memo(edited_memo)
    @mymemo_db.exec("UPDATE memo SET title = '#{edited_memo['title']}', content = '#{edited_memo['content']}' WHERE id = '#{@memo['id']}'")
  end

  def delete_memo
    @mymemo_db.exec("DELETE FROM memo WHERE id = '#{@memo['id']}'")
  end
end
