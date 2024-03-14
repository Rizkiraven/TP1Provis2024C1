# Tugas Praktikum 1 Provis 2024

# Implementasi OOP dan Asynchronous
Memiliki 5 class yaitu Karakter, Player, Item, NPC, dan Enemy.
- method di class Karakter : hanya getter dan setter.
- method di class Player : getter dan setter, menyelesaikanMisi(), tambahItemInventory(), interaksiDenganNPC(), melakukanMisi(), menyerangMusuh(), useItem(), tampilkanItem(), tampilkanPlayer().
- method di class Item : hanya getter dan setter.
- method di class NPC : getter dan setter, berjualan(), tampilkanNPC().
- method di class Enemy : getter dan setter, attackPlayer(), cekKematianEnemy(), interaksiDenganPlayer(), tampilkanEnemy().

Player bisa berinteraksi dengan NPC, menerima misi, dan menyelesaikannya. Player juga bisa mendapatkan item setelah menyelesaikan misi yang sudah beres dilakukan.
Player menyerang musuhnya sesuai dengan ATK yang dimiliki.
Player bisa melakukan jual beli dengan NPC.
Enemy bisa menyerang dan berinteraksi kepada Player.
Player memerlukan item persyaratan untuk menjalankan misi yang diberikan oleh NPC, jika tidak memiliki item syarat maka tidak bisa melakukan misi nya.

Pada program ini pun mengimplementasikan async dan await pada method - method yang ada. Seperti menggunakan delay untuk menampilkan outputnya.

# Alur Program
1. Program dimulai dan langsung inisialisasi Player, NPC, Enemy, dan Item.
2. Menampilkan list Player, NPC, Enemy, dan Item yang ada.
3. Menampilkan petualangan Player dengan menerima dan menjalankan misi dari NPC.
4. Menampilkan status dan item yang dimiliki oleh Player setelah menyelesaikan misi.
5. Akan ada delay beberapa detik saat menampilkan output agar bisa melihat proses nya lebih detail.

# Dokumentasi
https://github.com/Rizkiraven/TP1Provis2024C1/assets/107761120/95ee713b-ef7c-4e08-8710-50769b4df959
