include apt

node default {
  
  $davfs_conf_path = "/etc/davfs2/davfs2.conf"
  $path = "/usr/local/bin/:/bin/:/usr/bin/:/usr/local/sbin/:/usr/sbin/:/sbin/"
  $postgres_loc = "/etc/postgresql/9.3/main/"
  
  apt::ppa { 'ppa:kubuntu-ppa/backports': }
  
  exec {
    "apt-get update":
    path => $path
  }
  
  exec {
    "apt-get -qy install kubuntu-desktop":
    path => $path
  }
  
  exec {
    "apt-get -qy remove --purge ubuntu-desktop":
    path => $path
  }
  
  exec {
    "dist-upgrade":
    command => "apt-get -qy dist-upgrade",
    path => $path,
  }
  
  # Install text editors
  package { 'vim': ensure => installed }
  
  class { 'jdk_oracle': 
    version => '7',
    install_dir => '/opt',
    os_distro => 'ubuntu'
  }
    
  class { "archive::prerequisites": } -> class { 'idea::community':
    version => '14.1.3'
  }
    
  exec {
    "apt-get -qy install ttf-mscorefonts-installer firefox curl kwrite kdiff3 kruler kcolorchooser kcharselect davfs2":
    path => $path,
  }
    
  exec {
    "/bin/echo 'buf_size        512                 # KiByte' >> $davfs_conf_path":
    path => $path,
  }
  exec {
    "/bin/echo 'use_locks       0' >> $davfs_conf_path":
    path => $path,
  }
  exec {
    "/bin/echo 'allow_cookie    1' >> $davfs_conf_path":
    path => $path,
  }
  exec {
    "/bin/echo 'cache_size      200             # MiB' >> $davfs_conf_path":
    path => $path,
  }
  exec {
    "/bin/echo 'table_size      4096' >> $davfs_conf_path":
    path => $path,
  }
  exec {
    "/bin/echo 'dir_refresh     10' >> $davfs_conf_path":
    path => $path,
  }
  exec {
    "/bin/echo 'file_refresh    1' >> $davfs_conf_path":
    path => $path,
  }
  exec {
    "/bin/echo 'delay_upload    0' >> $davfs_conf_path":
    path => $path,
  }
  exec {
    "/bin/echo 'gui_optimize    1' >> $davfs_conf_path":
    path => $path,
  }
  
  exec {
    "/usr/bin/apt-get -qy install okteta optipng jpegoptim":
    path => $path,
  }
    
  class { 'postgresql::server': 
    version => '9.2',
    ipv4acls => [
      'local all all trust',
      'host all all 127.0.0.* trust'],
  }

  # Install and run Apache with its default configuration
  class { 'apache':
    default_vhost => true,
    keepalive     => 'On',
  }
}
