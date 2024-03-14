class Karakter
{
  late String nama;
  late String jenisKelamin;
  late int hp;
  late int atk;
  late int level;

  Karakter(this.nama, this.jenisKelamin, this.hp, this.atk, this.level);

  String getNama()
  {
    return nama;
  }

  void setNama(String nama)
  {
    this.nama = nama;
  }

  String getJenisKelamin()
  {
    return jenisKelamin;
  }

  void setJenisKelamin(String jenisKelamin)
  {
    this.jenisKelamin = jenisKelamin;
  }

  int getHp()
  {
    return hp;
  }

  void setHp(int hp) 
  {
    this.hp = hp;
  }

  int getAtk()
  {
    return atk;
  }

  void setAtk(int atk)
  {
    this.atk = atk;
  }

  int getLevel()
  {
    return level;
  }

  void setLevel(int level) 
  {
    this.level = level;
  }
}

class Player extends Karakter
{
  late String senjata;
  late String role;
  late int exp;
  late int koin;
  late List<Item> listInventory;

  Player({
      required String nama,
      required String jenisKelamin,
      required int hp,
      required int atk,
      required int level,
      required this.senjata,
      required this.role,
      required this.exp,
      required this.koin})
      : super(nama, jenisKelamin, hp, atk, level)
      {
    listInventory = [];
  }

  String getSenjata()
  {
    return senjata;
  }

  void setSenjata(String senjata)
  {
    this.senjata = senjata;
  }

  String getRole()
  {
    return role;
  }

  void setRole(String role)
  {
    this.role = role;
  }

  int getExp()
  {
    return exp;
  }

  void setExp(int exp) 
  {
    this.exp = exp;
  }

  int getKoin()
  {
    return koin;
  }

  void setKoin(int koin) 
  {
    this.koin = koin;
  }

  void addInventory(Item item)
  {
    listInventory.add(item);
  }

  Future<void> menyelesaikanMisi(NPC npc) async
  {
    print('$nama menyelesaikan misi ${npc.misi} dan mendapatkan item ${npc.item}!');
    print('$nama mendapatkan 10 ATK tambahan dari item yang diperoleh!');
    final item = Item(namaItem: npc.item, deskripsi: 'Dapet dari ngemisi', value: 1);
    tambahItemInventory(item);
    level += 1;
    koin += 500;
    atk += 10;
  }

  void tambahItemInventory(Item item)
  {
    listInventory.add(item);
  }

  Future<void> interaksiDenganNPC(NPC npc) async
  {
    print('$nama melakukan interaksi dengan ${npc.nama}.');
  }

  Future<void> melakukanMisi(NPC npc) async
  {
    bool memilikiItemLangka = listInventory.any((item) => item.namaItem == npc.syaratItem);

    if (!memilikiItemLangka)
    {
      print('Tidak dapat menyelesaikan misi karena tidak memiliki item langka yang dibutuhkan.');
    }
    else
    {
      print('$nama menerima dan melakukan misi bernama ${npc.misi}.');
    }
  }

  Future<void> menyerangMusuh(Enemy enemy) async
  {
    final damage = atk;
    print(
        '$nama menyerang ${enemy.nama} menggunakan $senjata dan mengurangi $damage HP!');
    enemy.setHp(enemy.getHp() - damage);
    enemy.cekKematianEnemy();
  }

  Future<void> useItem(Item item) async
  {
    print('$nama menggunakan item ${item.namaItem}!');
  }

  Future<void> tampilkanItem() async
  {
    print('Item yang dimiliki oleh $nama:');
    for (final item in listInventory)
    {
      print(item.namaItem);
    }
  }

  Future<void> tampilkanPlayer(var nomor) async
  {
    print('$nomor. Nama   : ${this.getNama()}');
    print('   Gender : ${this.getJenisKelamin()}');
    print('  Senjata : ${this.getSenjata()}');
    print('   Role   : ${this.getRole()}');
    print('   Level  : ${this.getLevel()}');
    print('   Koin   : ${this.getKoin()}');
    print('            Status | Value ');
    print('             ATK       ${this.getAtk()}');
    print('             HP        ${this.getHp()}');
    print('');
  }
}

class NPC extends Karakter
{
  late String item;
  late String misi;
  late String deskripsiMisi;
  late String syaratItem;

  NPC(
      {required String nama,
      required String jenisKelamin,
      required int hp,
      required int atk,
      required int level,
      required this.item,
      required this.misi,
      required this.deskripsiMisi,
      required this.syaratItem})
      : super(nama, jenisKelamin, hp, atk, level);

  String getItem()
  {
    return item;
  }

  void setItem(String item)
  {
    this.item = item;
  }

  String getMisi()
  {
    return misi;
  }

  void setMisi(String misi)
  {
    this.misi = misi;
  }

  String getDeskripsiMisi()
  {
    return deskripsiMisi;
  }

  void setDeskripsiMisi(String deskripsiMisi)
  {
    this.deskripsiMisi = deskripsiMisi;
  }

  String getSyaratItem()
  {
    return syaratItem;
  }

  void setSyaratItem(String syaratItem)
  {
    this.syaratItem = syaratItem;
  }

  Future<void> berjualan(Player player, Item item, int harga) async
  {
    if (player.koin >= harga)
    {
      print('$nama menjual ${item.namaItem} kepada ${player.nama} seharga $harga koin.');
      player.addInventory(item);
      player.koin -= harga;
    } 
    else
    {
      print('${player.nama} tidak memiliki koin yang cukup untuk membeli ${item.namaItem}.');
    }
  }

  Future<void> tampilkanNPC(NPC npc, var nomor) async
  {
    print('$nomor. Nama   : ${npc.getNama()}');
    print('   Gender : ${npc.getJenisKelamin()}');
    print('   Misi   : ${npc.getMisi()}');
    print('');
  }
}

class Enemy extends Karakter
{
  late String dropItem;

  Enemy(
      {required String nama,
      required String jenisKelamin,
      required int hp,
      required int atk,
      required int level,
      required this.dropItem})
      : super(nama, jenisKelamin, hp, atk, level);

  String getDropItem()
  {
    return dropItem;
  }

  void setDropItem(String dropItem)
  {
    this.dropItem = dropItem;
  }

  Future<void> attackPlayer(Player player) async
  {
    final damage = atk;
    print('$nama menyerang ${player.nama} dan mengurangi $damage HP!');
    player.setHp(player.getHp() - damage);
  }

  Future<void> cekKematianEnemy() async
  {
    if (hp <= 0) {
      print('$nama dikalahkan!');
    }
  }

  Future<void> interaksiDenganPlayer(Player player) async
  {
    print('Aku akan mengalahkan ${player.nama} dengan cepat dan mudah!');
  }

  Future<void> tampilkanEnemy(Enemy enemy, var nomor) async
  {
    print('$nomor. Nama    : ${enemy.getNama()}');
    print('   Gender  : ${enemy.getJenisKelamin()}');
    print(' Drop Item : ${enemy.getDropItem()}');
    print('');
  }
}

class Item
{
  late String namaItem;
  late String deskripsi;
  late int value;

  Item({required this.namaItem, required this.deskripsi, required this.value});

  String getNamaItem()
  {
    return namaItem;
  }

  void setNamaItem(String namaItem)
  {
    this.namaItem = namaItem;
  }

  String getDeskripsi()
  {
    return deskripsi;
  }

  void setDeskripsi(String deskripsi)
  {
    this.deskripsi = deskripsi;
  }

  int getValue()
  {
    return value;
  }

  void setValue(int value)
  {
    this.value = value;
  }
}

void main() async
{
  final players = <Player>[];
  final npcs = <NPC>[];
  final enemies = <Enemy>[];
  final items = <Item>[];

  final map = Item(namaItem: 'Map', deskripsi: 'Peta yang digunakan untuk pemula', value: 4);
  final besi = Item(namaItem: 'Besi', deskripsi: 'Bahan untuk upgrade', value: 10);
  final kayu = Item(namaItem: 'Kayu', deskripsi: 'Bahan untuk upgrade', value: 20);
  items.add(map);
  items.add(besi);
  items.add(kayu);

  final nova = Player(nama: 'Nova', jenisKelamin: 'Laki-laki', hp: 100, atk: 8, level: 10, senjata: 'Panah', role: 'DPS', exp: 5000, koin: 1000);

  final jane = Player(nama: 'Jane', jenisKelamin: 'Perempuan', hp: 100, atk: 3, level: 5, senjata: 'Tongkat Sihir', role: 'Healer', exp: 2500, koin: 500);

  final sora = Player(nama: 'Sora', jenisKelamin: 'Laki-laki', hp: 100, atk: 6, level: 7, senjata: 'Pedang', role: 'DPS', exp: 3200, koin: 700);

  final aloy = Player(nama: 'Aloy', jenisKelamin: 'Perempuan', hp: 100, atk: 6, level: 8, senjata: 'Pedang', role: 'DPS', exp: 3500, koin: 800);

  nova.tambahItemInventory(map);
  jane.tambahItemInventory(map);
  sora.tambahItemInventory(map);
  aloy.tambahItemInventory(map);

  final adrian = NPC(nama: 'Adrian', jenisKelamin: 'Laki-laki', hp: 100, atk: 0, level: 0, item: 'Sacred Relic', misi: 'Membunuh Monster', deskripsiMisi: 'Membunuh monster yang berkeliaran di desa', syaratItem: 'Map');

  final lyra = NPC(nama: 'Lyra', jenisKelamin: 'Perempuan', hp: 100, atk: 0, level: 0, item: 'Desolator', misi: 'Membunuh Thor', deskripsiMisi: 'Membunuh Thor yang berada di Dragon Lair', syaratItem: 'Sacred Relic');

  final sven = NPC(nama: 'Sven', jenisKelamin: 'Laki-laki', hp: 100, atk: 0, level: 0, item: 'Enchiridion', misi: 'Membuat Kota Damai', deskripsiMisi: 'Kota menjadi damai jika tidak ada kejahatan', syaratItem: 'Divine Rapier');

  final naix = Enemy(nama: "Nai'x", jenisKelamin: "Tidak Diketahui", hp: 10, atk: 4, level: 1, dropItem: "Ghoul's Frenzy");

  final thor = Enemy(nama: 'Thor', jenisKelamin: 'Laki-laki', hp: 60, atk: 10, level: 1, dropItem: 'Divine Rapier');

  players.addAll([nova, jane, sora, aloy]);
  npcs.addAll([adrian, lyra, sven]);
  enemies.addAll([naix, thor]);

  await Future.delayed(Duration(seconds: 3));
  var nomor = 1;
  print('------------ Daftar Player yang Aktif ------------');
  await Future.delayed(Duration(seconds: 1));
  for (final player in players)
  {
    await player.tampilkanPlayer(nomor);
    await Future.delayed(Duration(seconds: 1));
    nomor++;
  }

  await Future.delayed(Duration(seconds: 3));
  nomor = 1;
  print('\n------------ Daftar NPC ------------');
  await Future.delayed(Duration(seconds: 1));
  for (final npc in npcs)
  {
    await npc.tampilkanNPC(npc, nomor);
    await Future.delayed(Duration(seconds: 1));
    nomor++;
  }

  await Future.delayed(Duration(seconds: 3));
  nomor = 1;
  print('\n------------ Daftar Musuh yang Ada ------------');
  await Future.delayed(Duration(seconds: 1));
  for (final enemy in enemies) 
  {
    await enemy.tampilkanEnemy(enemy, nomor);
    await Future.delayed(Duration(seconds: 1));
    nomor++;
  }

  await Future.delayed(Duration(seconds: 3));
  nomor = 1;
  print('\n------------ Daftar Item yang Ada di Dunia ini ------------');
  await Future.delayed(Duration(seconds: 1));
  for (final item in items)
  {
    print('$nomor. ${item.namaItem}');
    await Future.delayed(Duration(seconds: 1));
    nomor++;
  }

  await Future.delayed(Duration(seconds: 4));
  print('');
  print('\n------------ Petualangan Nova Melawan Monster ------------');
  await nova.interaksiDenganNPC(adrian);
  await Future.delayed(Duration(seconds: 3));
  await nova.melakukanMisi(adrian);
  await Future.delayed(Duration(seconds: 4));
  await nova.menyerangMusuh(naix);
  await Future.delayed(Duration(seconds: 1));
  await thor.attackPlayer(nova);
  await Future.delayed(Duration(seconds: 1));
  await nova.menyerangMusuh(naix);
  await Future.delayed(Duration(seconds: 1));
  await nova.menyelesaikanMisi(adrian);
  await Future.delayed(Duration(seconds: 1));
  print('');
  print('Status terbaru untuk Nova:');
  await nova.tampilkanPlayer(1);
  await Future.delayed(Duration(seconds: 1));
  print('List item terbaru yang dimiliki Nova:');
  await nova.tampilkanItem();

  await Future.delayed(Duration(seconds: 4));

  print('\n------------ Petualangan Nova Membunuh Thor ------------');
  await nova.interaksiDenganNPC(lyra);
  await Future.delayed(Duration(seconds: 3));
  await nova.melakukanMisi(lyra);
  await Future.delayed(Duration(seconds: 4));
  await nova.menyerangMusuh(thor);
  await Future.delayed(Duration(seconds: 1));
  await thor.attackPlayer(nova);
  await Future.delayed(Duration(seconds: 1));
  await nova.menyerangMusuh(thor);
  await Future.delayed(Duration(seconds: 1));
  await thor.attackPlayer(nova);
  await Future.delayed(Duration(seconds: 1));
  await nova.menyerangMusuh(thor);
  await Future.delayed(Duration(seconds: 1));
  await thor.attackPlayer(nova);
  await Future.delayed(Duration(seconds: 1));
  await nova.menyerangMusuh(thor);
  await Future.delayed(Duration(seconds: 1));
  await nova.menyelesaikanMisi(lyra);
  await Future.delayed(Duration(seconds: 1));
  print('');
  print('Status terbaru untuk Nova:');
  await nova.tampilkanPlayer(1);
  await Future.delayed(Duration(seconds: 1));
  print('List item terbaru yang dimiliki Nova:');
  await nova.tampilkanItem();
}