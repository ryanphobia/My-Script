Cara mengaktifkan DNS-over-HTTPS di mikrotik (routerOS)

buka terminal dan tambahkan command berikut:

# /tool fetch url=https://curl.se/ca/cacert.pem

perintah tersebut berfungsi untuk mengunduh sertifikat untuk verifikasi ketika mengaktifkan DoH
