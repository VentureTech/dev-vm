include apt

node default {
  
  $davfs_conf_path = "/etc/davfs2/davfs2.conf"
  $path = "/usr/local/bin/:/bin/:/usr/bin/:/usr/local/sbin/:/usr/sbin/:/sbin/"
  $cmd_timeout = 0
  $postgres_loc = "/etc/postgresql/9.3/main/"
  
  apt::ppa { 'ppa:kubuntu-ppa/backports': }
  
  exec {
    "apt-get update":
    path => $path,
    timeout => $cmd_timeout
  }
  
  exec {
    "apt-get -qy install kubuntu-desktop":
    path => $path,
    timeout => $cmd_timeout
  }
  
  exec {
    "apt-get -qy remove --purge ubuntu-desktop":
    path => $path,
    timeout => $cmd_timeout
  }
  
  exec {
    "dist-upgrade":
    command => "apt-get -qy dist-upgrade",
    path => $path,
    timeout => $cmd_timeout
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
    timeout => $cmd_timeout
  }
    
  exec {
    "echo 'buf_size        512                 # KiByte' >> $davfs_conf_path":
    path => $path,
    timeout => $cmd_timeout
  }
  exec {
    "echo 'use_locks       0' >> $davfs_conf_path":
    path => $path,
    timeout => $cmd_timeout
  }
  exec {
    "echo 'allow_cookie    1' >> $davfs_conf_path":
    path => $path,
    timeout => $cmd_timeout
  }
  exec {
    "echo 'cache_size      200             # MiB' >> $davfs_conf_path":
    path => $path,
    timeout => $cmd_timeout
  }
  exec {
    "echo 'table_size      4096' >> $davfs_conf_path":
    path => $path,
    timeout => $cmd_timeout
  }
  exec {
    "echo 'dir_refresh     10' >> $davfs_conf_path":
    path => $path,
    timeout => $cmd_timeout
  }
  exec {
    "echo 'file_refresh    1' >> $davfs_conf_path":
    path => $path,
    timeout => $cmd_timeout
  }
  exec {
    "echo 'delay_upload    0' >> $davfs_conf_path":
    path => $path,
    timeout => $cmd_timeout
  }
  exec {
    "echo 'gui_optimize    1' >> $davfs_conf_path":
    path => $path,
    timeout => $cmd_timeout
  }
  
  exec {
    "apt-get -qy install okteta optipng jpegoptim":
    path => $path,
    timeout => $cmd_timeout
  }
  
  exec {
    "apt-get install libxss1 libappindicator1 libindicator7":
    path => $path,
    timeout => $cmd_timeout
  }
  
  exec {
    "wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb":
    path => $path,
    timeout => $cmd_timeout
  }
  
  exec {
    "dpkg -i google-chrome*.deb":
    path => $path,
    timeout => $cmd_timeout
  }
  
  exec {
    "apt-get -f install":
    path => $path,
    timeout => $cmd_timeout
  }
  
  class { 'postgresql::globals':
    version => '9.3'
  }
    
  class { 'postgresql::server':
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
