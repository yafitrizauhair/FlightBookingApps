

---

# Flight Booking App

**Flight Booking App** adalah aplikasi pemesanan tiket pesawat sederhana yang dibangun menggunakan **Flutter**. Aplikasi ini memungkinkan pengguna untuk mendaftar, login, mencari penerbangan, dan melihat tiket yang sudah dibooking. Data pengguna dan penerbangan disimpan menggunakan **SQLite**.

## Fitur Utama

- **Halaman Login**: Pengguna yang sudah terdaftar dapat login menggunakan username dan password.
- **Halaman Pendaftaran**: Pengguna baru dapat mendaftar untuk membuat akun baru.
- **Halaman Beranda**: Pengguna dapat mencari penerbangan berdasarkan kota asal, kota tujuan, kelas penerbangan, jumlah penumpang, dan tanggal perjalanan.
- **Halaman Tiket Saya**: Pengguna dapat melihat tiket yang sudah dibooking sebelumnya.
- **Halaman Notifikasi**: Halaman yang menampilkan notifikasi terkait penerbangan atau tiket yang dibooking.
- **Halaman Profil**: Pengguna dapat melihat dan mengedit profil mereka.

## Struktur Direktori

```
/lib
  /pages
    - home_page.dart          # Halaman utama aplikasi
    - my_ticket_page.dart     # Halaman untuk melihat tiket yang sudah dibooking
    - notification_page.dart  # Halaman untuk menampilkan notifikasi
    - profile_page.dart       # Halaman profil pengguna
    - login_page.dart         # Halaman login
    - register_page.dart      # Halaman pendaftaran pengguna baru
    - search_result_page.dart # Halaman hasil pencarian penerbangan
    - welcome_page.dart       # Halaman sambutan awal aplikasi
  /services
    - db_helper.dart          # Kode untuk mengelola database SQLite
  /widgets
    - bottom_navigation.dart  # Navigasi bawah untuk berpindah antar halaman
  main.dart                    # Titik masuk aplikasi
```

## Penjelasan Kode

### 1. **`main.dart`**
File utama yang menginisialisasi aplikasi. Di sini, aplikasi menggunakan `MaterialApp` untuk mengonfigurasi tema, rute, dan halaman awal (login).

- **`MaterialApp`**: Mengonfigurasi aplikasi dengan tema dan navigasi.
- **`initialRoute`**: Menentukan halaman pertama yang muncul saat aplikasi dijalankan.
- **`routes`**: Menentukan pemetaan halaman yang dapat diakses di aplikasi.

### 2. **Halaman Login dan Register**

- **`LoginPage`**: Halaman untuk pengguna yang sudah memiliki akun, mereka bisa memasukkan username dan password untuk login.
- **`RegisterPage`**: Halaman untuk pengguna baru agar mereka bisa membuat akun dengan memasukkan informasi seperti username dan password.

### 3. **Halaman Beranda (Home)**

Halaman utama di mana pengguna dapat mencari penerbangan dengan memilih kota asal, kota tujuan, tanggal, kelas penerbangan, dan jumlah penumpang.

### 4. **Halaman Tiket Saya (MyTicketPage)**

Halaman yang menampilkan daftar tiket yang sudah dibooking oleh pengguna. Halaman ini mengambil data penerbangan dari database SQLite dan menampilkannya dalam bentuk daftar.

### 5. **Halaman Notifikasi dan Profil**

- **`NotificationPage`**: Halaman yang menampilkan notifikasi atau informasi penting terkait penerbangan.
- **`ProfilePage`**: Halaman untuk melihat dan mengedit profil pengguna.

### 6. **DBHelper (SQLite)**

**`db_helper.dart`** mengelola semua interaksi dengan database SQLite. Ini termasuk penyimpanan dan pengambilan data pengguna dan penerbangan. 

- **Tabel `users`**: Menyimpan data pengguna (username dan password).
- **Tabel `flights`**: Menyimpan informasi penerbangan yang dibooking pengguna (kota asal, kota tujuan, tanggal, jumlah penumpang, kelas penerbangan, harga, dan maskapai).

### 7. **Navigasi dan Bottom Navigation**

Aplikasi menggunakan **`BottomNavigationBar`** untuk navigasi antar halaman utama, seperti **Home**, **My Ticket**, **Notification**, dan **Profile**.

- **`BottomNavigationBar`** memungkinkan pengguna untuk berpindah antar halaman dengan mudah.

### 8. **Fungsi Database dan CRUD**

- **`getUser()`**: Mengambil data pengguna berdasarkan username dan password.
- **`insertUser()`**: Menyimpan data pengguna baru ke dalam tabel `users`.
- **`insertFlight()`**: Menyimpan data penerbangan ke dalam tabel `flights`.
- **`getFlights()`**: Mengambil semua data penerbangan yang ada di database.

### 9. **Halaman Pencarian Hasil Penerbangan (SearchResultPage)**

Setelah pengguna melakukan pencarian penerbangan di halaman beranda, hasilnya akan ditampilkan di halaman **SearchResultPage**. Di halaman ini, pengguna bisa memilih penerbangan dan melakukan pemesanan, yang kemudian akan disimpan dalam database.

## Instalasi

Untuk menjalankan aplikasi ini secara lokal, pastikan Anda telah menginstal **Flutter** dan **Dart** di sistem Anda. Kemudian, ikuti langkah-langkah berikut:

1. Clone repository ini:
   ```
   git clone https://github.com/username/repository-name.git
   ```

2. Masuk ke direktori aplikasi:
   ```
   cd repository-name
   ```

3. Install dependensi Flutter:
   ```
   flutter pub get
   ```

4. Jalankan aplikasi:
   ```
   flutter run
   ```

## Teknologi yang Digunakan

- **Flutter**: Framework untuk membangun aplikasi mobile dan web.
- **SQLite**: Database lokal yang digunakan untuk menyimpan data pengguna dan penerbangan.
- **Dart**: Bahasa pemrograman yang digunakan untuk menulis aplikasi Flutter.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
