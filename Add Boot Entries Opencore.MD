# Panduan Menambah Boot Entry Pada Opencore

Tutorial kali ini ditujukan bagi kalian yang sebelumnya menginstal OS berbasis linux dan kesulitan untuk menambah boot entry pada di Opencore, cara ini juga bisa digunakan untuk melakukan perbaikan apabila bootloader pada OS linux anda hilang ketika sehabis menjalankan opsi reset/clear NVRAM di opencore.

Sebelum melakukan configurasi pada file `config.plist`, lakukan backup terlebih dahulu atau bisa melakukan ujicoba booting dengan flash drive (FD) ketika selesai konfigurasi

1. Langkah awal, masuk ke bootloader Opencore kemudian ketika masuk ke pilihan boot picker, tekan tombol space pada dan pilih Shell.efi
2. Setelah masuk ke tampilan UEFI Shell, ketikkan perintah berikut untuk masuk ke direktori file EFI untuk booting:
    
        FS0:
3. Selanjutnya ketikkan perintah:

        dir

    Perintah diatas berfungsi untuk mengecek lokasi dimana direktori GRUB berada.
4. Ketika sudah memastikan dimana file dan direktori GRUB nya berada, cek alamat direktori GRUB nya dengan melakukan perintah sekaligus export ke dalam file teks (*.txt):
    
        map > map_table.txt

5. Apabila sudah sukses terekspor ke file teks, keluar dari Shell dengan perintah/command `exit`
6. Setelah itu, kembali boot untuk masuk ke MacOS
7. Kemudian mount direktori/partisi EFI pada perangkat dengan aplikasi seperti ESP Mounter Pro ataupun Opencore Configurator, pada tutorial kali ini saya menggunakan Opencore Configurator untuk mounting partisi EFI
8. Lanjut buka file ```map_table.txt```
9. Isi file `map_table.txt` akan muncul seperti berikut:
    
        Mapping table
        FS0: Alias(s):HD1b:;BLK3:
          PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(1,GPT,0001E177-0840-7E55-CEAC-D501EEC20300,0x800,0x1BC800)
        FS4: Alias(s):HD1e:;BLK9:
          PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(4,GPT,1C336CF6-32EB-4AEC-815D-16439F2392DD,0x4F869800,0x27B13800)/VenMedia(BE74FCF7-0B7C-49F3-9147-01F4042E6842,C4D1AF7E40F195459234A93E0D355501)
        FS1: Alias(s):HD1e:;BLK6:
          PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(4,GPT,1C336CF6-32EB-4AEC-815D-16439F2392DD,0x4F869800,0x27B13800)/VenMedia(BE74FCF7-0B7C-49F3-9147-01F4042E6842,1B9246EFF802504D821BE09C0FB0F758)
        FS3: Alias(s):HD1e:;BLK8:
          PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(4,GPT,1C336CF6-32EB-4AEC-815D-16439F2392DD,0x4F869800,0x27B13800)/VenMedia(BE74FCF7-0B7C-49F3-9147-01F4042E6842,7025D41F5FDD1A4183A0F6498471C8AA)
        FS5: Alias(s):HD1e:;BLK10:
          PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(4,GPT,1C336CF6-32EB-4AEC-815D-16439F2392DD,0x4F869800,0x27B13800)/VenMedia(BE74FCF7-0B7C-49F3-9147-01F4042E6842,D007FA0926D16F4FA38A1A03558E4C90)
        FS6: Alias(s):HD1e:;BLK11:
          PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(4,GPT,1C336CF6-32EB-4AEC-815D-16439F2392DD,0x4F869800,0x27B13800)/VenMedia(BE74FCF7-0B7C-49F3-9147-01F4042E6842,D27466E7AB3CB643A9A61ED44D91E83C)
        FS2: Alias(s):HD1e:;BLK7:
          PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(4,GPT,1C336CF6-32EB-4AEC-815D-16439F2392DD,0x4F869800,0x27B13800)/VenMedia(BE74FCF7-0B7C-49F3-9147-01F4042E6842,5B6BF045CA66AD42BF09149EB677A89D)
        BLK2: Alias(s):
          PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)
        BLK4: Alias(s):
          PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(2,GPT,FF4E74BE-C591-4049-A5BF-7FFE43C3D642,0x1BD000,0x3A383800)
        BLK5: Alias(s):
          PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(4,GPT,1C336CF6-32EB-4AEC-815D-16439F2392DD,0x4F869800,0x27B13800)
        BLK0: Alias(s):
          PciRoot(0x0)/Pci(0x17,0x0)/Sata(0x1,0x8000,0x0)
        BLK1: Alias(s):
          PciRoot(0x0)/Pci(0x17,0x0)/Sata(0x1,0x8000,0x0)/HD(1,GPT,4B130DBC-2B82-4E9B-A75F-E74D71FEE31C,0x800,0x74706000)

10. Sesuaikan letak `path` dengan yang ada pada `map table` perangkat kalian karena bisa saja berbeda karena perbedaan pada instalasi bootloader serta model jenis storage yang digunakan agar nantinya Opencore bisa mendeteksi bootloader lain yang telah dimasukkan
11. Setelah `path` sudah ditemukan, lanjut buka file `config.plist` pada yang terletak di folder `OC` dengan menggunakan Plist editor seperti `ProperTree` atau `Xplist`, bisa juga dengan menggunakan aplikasi `Opencore Auxiliary Tool (OCAT)` maupun `Opencore Configurator` seperti yang ada di tutorial ini.
12. Ketika `config.plist` sudah terbuka, langsung masuk ke `Misc` -> `Entries`
13. Pada contoh di perangkat saya, letak direktori index identifier berada di `fs0`, selanjutnya copy `path` yang berada dibawah `fs0` seperti berikut:

         PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(1,GPT,0001E177-0840-7E55-CEAC-D501EEC20300,0x800,0x1BC800)
14. Paste `path` ke `Entries`, kemudian tambahkan alamat letak file GRUB berada, pada contoh kali ini letak file nya adalah `grub\x86_64-efi\grub.efi`
15. Sehingga hasilnya akan seperti ini:
    
        PciRoot(0x0)/Pci(0x1D,0x4)/Pci(0x0,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(1,GPT,0001E177-0840-7E55-CEAC-D501EEC20300,0x800,0x1BC800)/\grub\x86_64-efi\grub.efi

16. Setelah alamat `path` sudah dimasukkan, kemudian bagian key `Name` rubah sesuai keinginan agar ketika booting di Opencore muncul nama OS yang barusan ditambahkan, pada contoh kali ini saya kasih nama `Arch Linux`, karena sebelum menginstal MacOS, perangkat saya menggunakan OS dari Arch Linux, dan jangan lupa centang untuk key `Enabled` pada Opencore Configurator maupun `True` atau `0` apabila menggunakan ProperTree
17. Apabila sudah selesai, silakan `Save` config.plist nya dan coba lakukan restart, nanti akan muncul 2 pilihan OS pada menu boot picker, kemudian pilih OS yang baru ditambahkan, pada contoh kali ini namanya `Arch Linux`
18. Bila ketika OS yang baru ditambahkan di boot picker Opencore hanya muncul blank hitam, cek kembali `path` yang sebelumnya ditambahkan, kemudian ganti lagi dengan `path` yang terdapat pada list `map_table.txt`
19. Apabila bisa masuk ke OS kedua, berarti konfigurasinya sudah sesuai, dan tentu dengan memasukkan grub di Opencore akan jauh lebih aman apabila kita melakukan reset nvram ketika ada perubahan konfigurasi pada Opencore yg mengharuskan melakukan reset nvram.