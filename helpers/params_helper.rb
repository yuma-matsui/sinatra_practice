# frozen_string_literal: true

helpers do
  def params_blank?(params)
    params['title'].empty? || params['content'].empty?
  end

  # def remove_unnecessary_entries(params)
  #   params.select { |key| (key == 'title') || (key == 'content') }
  # end
end
