class profile::prwinenv::prwinenv{
  notify {'Running in prwinenv':}

  file { 'c:/test':
    ensure => directory,
  }

  windows_env {'PRCUSTOM':
    ensure    => present,
    variable  => 'prvariable',
    value     => 'pr-value',
    mergemode => clobber,
  }
  notify {'PRCUSTOM windows_env has been set!':}

  windows_env { 'CBI_ENV':
    ensure    => present,
    variable  => 'CBI_ENV',
    value     => 'CBI value is here',
    mergemode => insert,
  }
  notify {'CBI_ENV windows_env has been set!':}

  windows_env {'PATH=C:\test':}
  $prpath = $facts['windows_env']['HOMEPATH']
  notify {"PATH for windows_env has been appended!: ${prpath}":}
}
