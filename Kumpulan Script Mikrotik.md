# Kumpulan Script Mikrotik
Berikut adalah beberapa script yang biasa saya gunakan di perangkat mikrotik.



## Script Generate simple queue pada mikrotik

    :for x from 10 to 150 do={/queue simple add name="Nama_Antrian-$x" parent="Nama_Parent" max-limit=8M/8M target="192.168.4.$x"}


### Penjelasan Generate Batch Simple Queue
Pada contoh kali ini kita akan membuat list simple queue dengan masing-masing IP dapat jatah bandwidth sebesar 8mbps untuk download dan upload untuk IP 192.168.4.10 sampai 192.168.4.150

1. Dibagian `Nama_Antrian`, bisa diganti sesuai kebutuhan untuk identifikasi alamat IP yang mendapat limitasi.
2. Kemudian pada bagian `parent="Nama_Parent` adalah opsional, apabila limitasi yang dipasang tidak menggunakan Parent Limit, silakan untuk dihapus
</br>
</br>

## Script Port Forwarding Untuk Akses Server Lokal di Luar Jaringan

    /ip firewall nat
    add action=dst-nat chain=dstnat comment=Nama_Service/Server dst-address=IP-Public \
    dst-port=port-untuk-public protocol=tcp to-addresses=IP-Lokal-server to-ports=port-lokal

### Penjelasan 
Pada script port forwarding, ada beberapa bagian yang harus disesuaikan, diantaranya adalah:

    dst-address=IP-Public
    dst-port=port-untuk-public
    to-addressess=IP-Lokal-Server
    to-ports=port-lokal

 1. Misal kalian punya server database lokal dengan IP address `192.168.1.65` dan port untuk mengakses nya adalah `3306` dan IP publik statik yaitu `107.67.125.39`, maka ganti menjadi seperti berikut:

    `dst-address=107.67.125.39`

    Kemudian untuk port yang dibuka agar bisa diakses diluar jaringan, ganti seperti berikut:

    `dst-port=3306`




2. Setelah IP Publik beserta port nya sudah diisi, lakukan pointing ke lokal server agar ketika user dan aplikasi yang mau mengakses database melalui IP publik `107.67.125.39` dengan port `3306` bisa terkoneksi dengan baik dengan mengganti bagian `to-addressess=IP-Lokal-Server` dan `to-ports=port-lokal` menjadi seperti berikut:

    `to-addressess=192.168.1.65
to-ports=3306`

3. Pada bagian `comment=Nama_Service/Server`, silakan ganti sesuai keinginan/kebutuhan, karena fungsi dari `comment` adalah sebagai penanda terhadap config yang kita buat, misalnya begini:
   
    `comment=Server-Database`

4. Apabila semua alamat IP baik lokal dan publik beserta port nya sudah ditentukan, maka output hasilnya akan seperti ini:

        /ip firewall nat
        add action=dst-nat chain=dstnat comment=Server-Database dst-address=107.67.125.39 dst-port=3306 protocol=tcp to-addresses=192.168.1.65 to-ports=3306

    #### Notes: Apabila di jaringan kalian sudah ada yang menggunakan port `3306` atau port yang sama namun beda service sehingga menyebabkan tidak bisa diakses dari luar, silakan ganti nomor port pada `dst-port` dengan port lain yang tidak digunakan.
</br>

## Blokir Akses Port Suatu Service atau Aplikasi
Di script ini berfungsi untuk mencegah beberapa alamat IP dengan interface ethernet yang berbeda agar tidak bisa mengakses ke perangkat lain, misalnya server, berikut contoh script nya:

    /ip firewall filter
    add action=drop chain=forward comment="Tujuan Blokir" dst-port=port-yang-diblokir in-interface=interface-yang-diblokir protocol=tcp

Pada script diatas adalah contoh untuk memblokir akses suatu service atau aplikasi yang memerlukan akses ke suatu jaringan menggunakan port tertentu, pada contoh kali ini adalah melakukan blokir untuk akses folder share windows yang menggunakan protokol `SMB` dengan port `135,137,138,139,445` pada jaringan yang tersambung melalui `ether5`. </br>
Maka dari itu variabel yang perlu dirubah diantaranya `dst-port` menjadi seperti berikut:

    dst-port=135,137,138,139,445

Kemudian, pada bagian `in-interface` diisi dengan nomor interface `ether` yang mau diblokir, hasilnya jadi seperti berikut:

    in-interface=ether5

Dan untuk hasil akhirnya akan menjadi seperti dibawah ini:

    /ip firewall filter
    add action=drop chain=forward comment="Blokir Folder Share Windows" dst-port=135,137,138,139,445 in-interface=ether5 protocol=tcp

Setelah selesai, coba lakukan mengakses IP folder share pada koneksi yang melalui `ether5`, apabila terjadi error tidak bisa diakses, berarti konfigurasi sudah berjalan.        

