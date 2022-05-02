# frozen_string_literal: true

helpers do
  def params_blank?(params)
    params['title'].empty? || params['content'].empty?
  end

  def formated_params(params)
    if params.each_value { |val| val.include?("\n") }
      params.each do |key, val|
        params[key] = val.chars.reject { |chr| (chr == "\r") || (chr == "\n") }.join
      end
    end
    params
  end

  def remove_unnecessary_entries(params)
    params.select { |key| (key == 'title') || (key == 'content') }
  end
end
