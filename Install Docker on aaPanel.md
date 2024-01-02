# Panduan Instalasi Docker di aaPanel

Berikut panduan instalasi docker pada `aaPanel` apabila terjadi error yang mengatakan docker belum terinstal meski sudah melakukan instalasi melalui web panel.

**Persyaratan**
* Akses ke terminal (console) di VPS, bisa melalui SSH maupun telnet dengan hak akses root.
___   
<br/>

### 1. Uninstall Docker
____
>Hapus atau uninstall terlebih dahulu docker yang sebelumnya diinstall melalui web panel dengan melakukan mengetikkan baris perintah berikut di terminal console:


    /bin/bash /www/server/panel/install/docker_install.sh uninstall

___
<br/>

### 2. Hapus Script Instalasi Docker
___
>Hapus script instalasi docker yang sebelumnya terunduh ketika melakukan instalasi docker melalui web panel dengan mengetikkan baris perintah berikut di terminal console:

    rm -rf /www/server/panel/install/docker_install.sh
___
<br/>


### 3. Unduh Script Docker
___
> Setelah script instalasi docker untuk `aaPanel` sudah dihapus, lakukan unduh (download) manual melalui terminal dengan perintah berikut di terminal console:

    cd /www/server/panel/install/
    wget http://download.bt.cn/install/0/docker_install.sh
___
<br/>


### 4. Install Docker
___
> Setelah script instalasi docker untuk `aaPanel` sudah terunduh, login ke `aaPanel` dan masuk ke menu `Docker`, kalau masih muncul pop-up yang mengatakan docker belum terpasang, lakukan instalasi seperti biasa di web panel tersebut.
___
<br/>

### 5. Install Docker Compose
___
> Ketika docker sudah berhasil terinstal di `aaPanel`, langkah terakhir adalah instalasi docker compose secara manual melalui terminal console dengan mengetikkan perintah sebagai berikut:

    apt install docker-compose-plugin
___
<br/>
  
### 6. Cek Hasil Instalasi
___
> Setelah instalasi docker compose terpasang tanpa ada error, masuk kembali ke web panel `aaPanel` kemudian masuk ke menu docker, apabila tidak notif pop-up yang mengharuskan menginstal docker service, berarti instalasi docker pada `aaPanel` sudah berhasil dan tinggal memasang service maupun aplikasi yang hendak dipasang seperti biasa.