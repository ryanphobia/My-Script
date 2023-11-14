# Panduan Menambah Boot Entry Pada Opencore

Tutorial kali ini ditujukan bagi kalian yang sebelumnya menginstal OS berbasis linux dan kesulitan untuk menambah boot entry pada di Opencore, cara ini juga bisa digunakan untuk melakukan perbaikan apabila bootloader pada OS linux anda hilang ketika sehabis menjalankan opsi reset/clear NVRAM di opencore.

1. Langkah awal, masuk ke bootloader Opencore kemudian ketika masuk ke pilihan boot picker, tekan tombol space pada dan pilih Shell.efi
2. Setelah masuk ke tampilan UEFI Shell, ketikkan perintah berikut untuk masuk ke direktori file EFI untuk booting:
    
        FS0:
3. Selanjutnya ketikkan perintah:

        dir

    Perintah diatas berfungsi untuk mengecek lokasi dimana direktori GRUB berada.
4. Ketika sudah memastikan dimana file dan direktori GRUB nya berada, cek alamat direktori GRUB nya dengan melakukan perintah sekaligus export ke dalam file teks (*.txt):
    
        map > map_table.txt

5. Apabila sudah sukses terekspor ke file teks, keluar dari Shell dengan perintah/command:

        exit
6. Setelah itu, kembali boot untuk masuk ke MacOS
7. Kemudian mount direktori/partisi EFI pada perangkat dengan aplikasi seperti ESP Mounter Pro ataupun Opencore Configurator, pada tutorial kali ini saya menggunakan Opencore Configurator untuk mounting partisi EFI
8. Lanjut buka file  'map_table.txt` 
10. Pada contoh kali