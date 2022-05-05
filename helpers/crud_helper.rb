# frozen_string_literal: true

helpers do
  def create_memo(memo)
    File.open(STORAGE_FILE, 'a+') { |f| f.write(formated_memo(memo)) }
  end

  def formated_memo(memo)
    memo.values.map(&:strip).join(',').insert(-1, "\n")
  end

  def edit_memo(edited_memo)
    id = @memos.find_index(@memo)
    @memos[id] = edited_memo
    change_storage_file(@memos)
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
