# Cara mengaktifkan DNS-over-HTTPS di mikrotik (RouterOS)

   Buka terminal dan tambahkan command berikut:

    /tool fetch url=https://curl.se/ca/cacert.pem

Perintah tersebut berfungsi untuk mengunduh sertifikat untuk verifikasi ketika mengaktifkan DoH

   Setelah sertifikat sudah terunduh, lakukan perintah impor sertifikat seperti berikut:

    /certificate import file-name=cacert.pem passphrase=””

Kemudian, hapus semua alamat DNS yang sebelumnya tercantum di DNS mikrotik, apabila IP untuk akses internet nya menggunakan DHCP client, non-aktifkan atau un-check opsi use Peer DNS

Setelah langkah diatas selesai, kemudian kembali ke menu DNS, tambahkan statik DNS untuk domain dari penyedia layanan DNS-over-HTTPS nya, pada kali ini saya menggunakan DoH pada cloudflare

    cloudflare-dns.com

Dan untuk alamat IP DNS yang perlu dimasukkan pada statik DNS adalah sebagai berikut:

    104.16.248.249
    104.16.249.249

Untuk google, alamat domain nya adalah:
    
    dns.google

Kemudian tambahkan alamat DNS google berikut setelah menambahkan domainnya:

    8.8.8.8
    8.8.4.4

Setelah statik DNS sudah diseting, tinggal tambahkan alamat DNS-over-HTTPS nya, pada contoh praktek kali, saya pakai dari layanan Cloudflare di bagian "Use DOH Server" :

    https://cloudflare-dns.com/dns-query

Setelah diisi, jangan lupa centang opsi "Verify DoH Certificate" dan "Allow Remote Request"
