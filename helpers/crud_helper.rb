# frozen_string_literal: true

require 'csv'

helpers do
  def extract_memos
    CSV.read(STORAGE_FILE)
  end

  def find_memo(id)
    @memos.find { |memo| memo[0] == id }
  end

  def create_memo(params)
    id = @memos.last.nil? ? 1 : @memos.last[0].to_i + 1
    memo = params.values
    CSV.open(STORAGE_FILE, 'a+') { |csv| csv << [id, *memo] }
  end

  def edit_memo(params)
    target_memo = @memos.find { |memo| memo == @memo }
    target_memo[1..2] = params.values
    rewrite_file
  end

  def delete_memo
    @memos.delete(@memo)
    rewrite_file
  end

  def rewrite_file
    CSV.open(STORAGE_FILE, 'w+') { |csv| @memos.each { |memo| csv << memo } }
  end
end
