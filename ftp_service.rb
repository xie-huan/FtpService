$LOAD_PATH.unshift File.expand_path('..', __FILE__)
require_relative 'OS'

class FtpService
  def self.create_service(home_dir,port = 21,user = 'user',pwd = 'password')
    if OS.windows?
      require_relative "FtpWindows"
      p "This is Windows..."
      FtpWindows.new(home_dir,port,user,pwd)
    elsif OS.linux?
      require_relative "FtpLinux"
      p "This is Linux..."
      FtpLinux.new(home_dir,port,user,pwd)
    else
      puts "We're running under an unknown operating system."
    end
  end
end