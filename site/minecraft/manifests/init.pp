class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar',
  $install_dir = '/opt/minecraft',
) {
  file {'/opt/minecraft':
    ensure => directory,
  }

  file {"${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }

  package {'java' :
    ensure => present,
  }

  file {"${$install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }

  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }

  service {'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'], File["${$install_dir}/eula.txt"], File['/etc/systemd/system/minecraft.service']]
  }
}
