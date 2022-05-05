# frozen_string_literal: true

helpers do
  def extract_memos
    File.read(STORAGE_FILE).split("\n").map.with_index do |memo, idx|
      title, content = memo.split(',')
      { id: idx + 1, title: title, content: content }
    end
  end

  def find_memo(id)
    @memos.find { |memo| memo[:id] == id }
  end
end
