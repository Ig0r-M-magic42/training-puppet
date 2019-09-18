class profile::base {
  user {'admin':
    ensure => 'present',
  }

  # package { 'lsb-release':
  #   ensure => installed,
  # }
}
