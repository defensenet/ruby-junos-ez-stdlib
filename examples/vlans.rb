require 'net/netconf/jnpr'
require 'junos-ez/stdlib'

# login information for NETCONF session 

login = { :target => 'ex4', :username => 'jeremy',  :password => 'jeremy1',  }

## create a NETCONF object to manage the device and open the connection ...

ndev = Netconf::SSH.new( login )
$stdout.print "Connecting to device #{login[:target]} ... "
ndev.open
$stdout.puts "OK!"

Junos::Ez::Provider( ndev )
Junos::Ez::Config::Utils( ndev, :cu )
Junos::Ez::Vlans::Provider( ndev, :vlans )
Junos::Ez::L2ports::Provider( ndev, :l2_ports )

p = ndev.l2_ports['ge-0/0/4']
binding.pry

pp ndev.vlans.list
pp ndev.vlans.catalog

ndev.close
