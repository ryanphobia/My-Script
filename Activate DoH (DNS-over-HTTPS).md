# Cara mengaktifkan DNS-over-HTTPS di mikrotik (routerOS)

Buka terminal dan tambahkan command berikut:

**/tool fetch url=https://curl.se/ca/cacert.pem**

Perintah tersebut berfungsi untuk mengunduh sertifikat untuk verifikasi ketika mengaktifkan DoH

Setelah sertifikat sudah terunduh, lakukan perintah impor sertifikat seperti berikut:

**/certificate import file-name=cacert.pem passphrase=””**