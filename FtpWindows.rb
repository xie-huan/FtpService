$LOAD_PATH.unshift File.expand_path('..', __FILE__)
require 'win32ole'
require 'socket'
class FtpWindows

  attr_accessor :ipop

  def initialize(home_dir,port = 21,user = 'user',pwd = 'password')

    #在通过COM调用前，本机必须至少运行过一次IPOP程序，以便于IPOP向本机注册COM类。这里需要进行容错
    begin
      @ipop = WIN32OLE.new("IPOP.app")
    rescue
      command = "start "+File.dirname(__FILE__ )+"/IPOP.EXE"
      system(command)
      # 等待程序执行完毕
      sleep(5)
      @ipop = WIN32OLE.new("IPOP.app")
    end

    #配置ftp服务器参数
    @ipop.config("ftp",port, home_dir)
  end

  #0隐藏，other显示
  def show(flag)
    @ipop.show(flag)
  end

  def quit
    @ipop.quit
  end

  #启动Ftp服务器
  def start
    p "Start FTP Server on Windows..."
    @ipop.server("ftp",1)
    p "Start Successfully."
  end

  #停止Ftp服务器
  def stop
    p "Stop FTP Server on Windows..."
    @ipop.server("ftp",0)
    p "Stop Successfully."
  end
end