# host { 'puppet':
#  ensure       => 'present',
#  host_aliases => ['puppet'],
#  ip           => '192.168.33.10',
#  target       => '/etc/hosts',
#}

package { 'puppetmaster': ensure => latest, }

# Configure puppetdb and its underlying database
class { 'puppetdb':
  listen_address   => '0.0.0.0',
  require          => Package['puppetmaster'],
  puppetdb_version => latest,
}

# Configure the puppet master to use puppetdb
class { 'puppetdb::master::config':
}

package { 'rubygems': ensure => installed }
class { 'dashboard':
  dashboard_site => $fqdn,
  dashboard_port => '3000',
  require        => [Package["puppetmaster"], Package["rubygems"]],
}
