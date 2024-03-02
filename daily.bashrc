#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias matio="sudo poweroff"
alias uripmaneh="sudo reboot"

#Paru

alias wayahe="rate-mirrors --allow-root arch | sudo tee /etc/pacman.d/mirrorlist && rate-mirrors --allow-root rebornos | sudo tee /etc/pacman.d/reborn-mirrorlist && rate-mirrors --allow-root endeavouros | sudo tee /etc/pacman.d/endeavouros-mirrorlist && rate-mirrors --allow-root chaotic-aur | sudo tee /etc/pacman.d/chaotic-mirrorlist && paru"

#NgresikiPaket
alias ngresiki-paket="yes | paru -Sc"

#Hide.me
alias konek-hide="sudo hide.me connect free-unlimited.hideservers.net"

#Dockstation
alias nganudockstation="sudo setfacl -m user:liriz:rw /var/run/docker.sock"

#IPerf
alias cepet-ra="iperf3 -c speedtest.sin1.sg.leaseweb.net -p 5201-5210 -P 32"

#Pacman
alias mbusek-paket-ora-kanggo="sudo pacman -Qtdq | sudo pacman -Rns -"

#MbusekCacheMemory
alias resik-ram="sync && sudo sysctl -w vm.drop_caches=3"

#NgeditNetworkManagerWifi
alias ngeditwifilaptop="sudo nano /etc/NetworkManager/NetworkManager.conf"

#NguripiAP
alias nguripi-access-point="sudo systemctl start create_ap"

#GitSubversion
git-svn(){
  if [[ ! -z "$1" && ! -z "$2" ]]; then
          echo "Starting clone/copy ..."
          repo=$(echo $1 | sed 's/\/$\|.git$//')
          svn export "$repo/trunk/$2"
  else
          echo "Use: git-svn <repository> <subdirectory>"
  fi
}

#PacmanNyantol
alias mateni-pacman="sudo rm /var/lib/pacman/db.lck"

#PeksoUpgrade
alias pekso="sudo pacman -Syyu --overwrite "*""

#DNS
alias dns="sudo systemd-resolve --flush-caches"

#CekTTL
alias cekttl="sysctl net.ipv4.ip_default_ttl"

#AxisWarnet
alias warnet="sudo sysctl -w net.ipv4.ip_default_ttl=65"