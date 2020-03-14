class minecraft(
  $url = 'https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar',
  $install_dir = '/opt/minecraft'
  )


  {
  file{'/opt/minecraft':
  ensure=>directory,
  
  }
  file{'/opt/minecraft/server.jar':
  ensure=>file,
  source=>$url,
  before => Service['minecraft'],
  }
  package{'java':
  ensure=>present,
  
  }
  file{"${install_dir}/eula.txt":
  ensure=>file,
  content=>'eula=true',
  
  
  }
  file{'/etc/systemd/system/minecraft.service':
  ensure=>file,
  content => epp('minecraft/minecraft.service.epp', {
      install_dir => $install_dir,
    }),
  
  }
    service { 'minecraft':
    ensure => running,
    enable => true,
    
  }


}
