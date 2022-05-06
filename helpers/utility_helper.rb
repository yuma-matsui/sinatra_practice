# frozen_string_literal: true

helpers do
  def escape(string)
    CGI.escapeHTML(string)
  end
end
