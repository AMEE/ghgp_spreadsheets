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