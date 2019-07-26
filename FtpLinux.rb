
$LOAD_PATH.unshift File.expand_path('..', __FILE__)

require_relative "./ftpd-linux/ftpd"

class FtpLinux
  #驱动类
  class Driver
    def initialize(ftp_root,user,pwd)
      @ftp_root = ftp_root
      @user = user
      @pwd = pwd
    end

    def authenticate(user, pwd)
      user == @user && pwd == @pwd
    end

    def file_system(user)
      Ftpd::DiskFileSystem.new(@ftp_root)
    end
  end

  #server对象
  attr_accessor :ftp_server

  def initialize(home_dir,port = 21,user = 'user',pwd = 'password')
    home_dir.gsub!(/\\/,"\/") if home_dir.include?"\\"
    driver = Driver.new(home_dir,user,pwd)
    @ftp_server = Ftpd::FtpServer.new(driver)
    # 获取本机ip地址
    my_ip = UDPSocket.open {|s| s.connect("64.233.187.99", 1); s.addr.last}
    @ftp_server.interface = my_ip
    @ftp_server.port = port
  end

  #启动服务器
  def start
    p "Start FTP Server on Linux..."
    @ftp_server &&= @ftp_server.start
    p "Start Successfully."
  rescue => ex
    puts ["#{ex.backtrace.first}: #{ex.message} (#{ex.class.name})", ex.backtrace[1..-1]].flatten.join("\n\tfrom ")
  end

  #关闭服务器
  def stop
    p "Stop FTP Server on Linux..."
    @ftp_server &&= @ftp_server.stop?
    p "Stop Successfully."
  rescue => ex
    puts ["#{ex.backtrace.first}: #{ex.message} (#{ex.class.name})", ex.backtrace[1..-1]].flatten.join("\n\tfrom ")
  end

end