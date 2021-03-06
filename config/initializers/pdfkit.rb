# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

if Rails.env.production?

  # As instructed by http://blog.mattgornick.com/using-pdfkit-on-heroku

  PDFKit.configure do |config|       
    config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
  end

  # Use file URLs to avoid deadlock
  # http://jguimont.com/post/2627758108/pdfkit-and-its-middleware-on-heroku

  ActionController::Base.asset_host = Proc.new { |source, request|
    if request.env["REQUEST_PATH"].include? ".pdf"
      "file://#{Rails.root.join('public')}"
    else
      "#{request.protocol}#{request.host_with_port}"
    end
  }

end

 ActionController::Base.asset_host = Proc.new { |source, request|
    if request.env["REQUEST_PATH"].include? ".pdf"
      "file://#{Rails.root.join('public')}"
    else
      "#{request.protocol}#{request.host_with_port}"
    end
  }