Mengatasi RClone tidak bisa melakukan authentikasi karena konfigurasi langsung di VPS yang  kebanyakan hanya menggunakan tampilan berbasis teks atau CLI (Command Line Interface)

1. Lakukan tunneling SSH antara VPS dengan perangkat yang sedang kita gunakan untuk melakukan konfigurasi, untuk perintahnya sebagai berikut:
    
    ssh -L localhost:53682:localhost:53682 nama_user@alamat_ip_vps -p nomor_port

2. Setelah sudah tersambung via tunneling, ikuti langkah-langkahnya seperti biasa pada program rclone


Catatan pada perintah tunneling SSH:
1. "nama_user" silakan ganti sesuai username yang dipakai untuk remote VPS

2. "@alamat_ip_vps" silakan ganti juga dengan IP publik yang diberikan penyedia hosting

3. contoh apabila sudah disesuaikan, maka perintahnya adalah sebagai berikut:

    ssh -L localhost:53682:localhost:53682 root@170.21.1.97

4. Apabila port default SSH nya sudah diganti dan tidak menggunakan default 22, maka tambahkan command -p nomor_port yang dimana "nomor_port" sesuaikan dengan nomor port yang biasa dipakai remote ssh.

5. Berikut contoh bila menggunakan port SSH selain 22

    ssh -L localhost:53682:localhost:53682 root@170.21.1.97 -p 2211

6. Kemudian ketikkan "yes" apabila pertama kali login, kemudian masukkan password dan tunggu beberapa saat akan masuk ke server VPS yang akan dikonfigurasi.