require 'msf/core'
require 'byebug'  # 加载调试工具
class MetasploitModule < Msf::Auxiliary
  include Msf::Exploit::Remote::Tcp
  include Msf::Auxiliary::Scanner

  def initialize
    super(
      'Name' => 'My custom TCP scan',
      'Version'        => '$Revision: 1 $',
      'Description'    => 'My quick scanner',
      'Author'         => 'Your name here',
      'License'        => MSF_LICENSE
    )
    register_options(
      [
        Opt::RPORT(12345)
      ], self.class)
  end

  def run_host(ip)
    connect()
    greeting = "HELLO SERVER"
    sock.puts(greeting)
    data = sock.recv(1024)

    byebug # 在此处开始调试
    print_status("Received: #{data} from #{ip}")
    disconnect()
  end
end