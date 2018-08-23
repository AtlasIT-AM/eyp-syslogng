class syslogng::config inherits syslogng {

  concat { $syslogng::params::syslogngconf:
    ensure => $syslogng::ensure_syslogconf,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat::fragment{ "${syslogng::params::syslogngconf} baseconf":
    target  => $syslogng::params::syslogngconf,
    order   => '01',
    content => template("syslogng/syslogngconf.erb"),
  }
}
