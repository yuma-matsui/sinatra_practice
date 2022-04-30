# frozen_string_literal: true

helpers do
  def create_memo(memo)
    @mymemo_db.exec("INSERT INTO memo (title, content) VALUES ('#{memo['title']}', '#{memo['content']}');")
  end

  def formated_memo(memo)
    memo.values.map(&:strip).join(',').insert(-1, "\n")
  end

  def edit_memo(edited_memo)
    @mymemo_db.exec("UPDATE memo SET title = '#{edited_memo['title']}', content = '#{edited_memo['content']}' WHERE id = '#{@memo['id']}'")
  end

  def delete_memo(deleted_memo)
    @memos.delete(deleted_memo)
    change_storage_file(@memos)
  end

  def change_storage_file(memos)
    renewed_memos = remove_id(memos)
    File.open(STORAGE_FILE, 'w+') { |f| renewed_memos.each { |memo| f.write(formated_memo(memo)) } }
  end

  def remove_id(memos)
    memos.map { |memo| memo.reject { |key| key == :id } }
  end
end
