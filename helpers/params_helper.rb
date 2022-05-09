# frozen_string_literal: true

helpers do
  def params_blank?(params)
    params[:title].empty? || params[:content].empty?
  end
end
