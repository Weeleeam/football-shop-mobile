Tugas 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree merupakan struktur hierarki widget yang membentuk UI pada flutter. Hampir semua yang ada dalam flutter merupakan widget seperti teks, tata letak. tombol, dll. Hubungannya adalah parent berfungsi untuk mendefinisikan tata letak, posisi, dan konfigurasi widget-widget yang ada di dalamnya dan child adalah widget yang ada di dalam parentnya yang harus menciptakan dirinya sendiri yang sudah dibatasi oleh parentnya.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
a. MyApp sebagai widget root app
b. MaterialApp menyediakan fungsi tema, material desain, navigasi (merupakan widget root juga)
c. MyHomePage sebagai halaman utama app
d. Scaffold menyediakan struktur dasar tampilan
e. AppBar menampilkan toolbar di bagian atas
f. Padding, Row, Column, SizedBox, Center, Container, GridView.count untuk mengatur posisi, ukuran, dan hubungan parent-child dari widget lain
g. Text, Icon, ThemeData, ColorScheme, Card, Material, InkWell, ScaffoldMessenger, SnackBar untuk mengatur tampilan elemen visual
h. InfoCard untuk membuat kartu kecil yang menampilkan nama, npm, kelas
i. ItemCard untuk membuat kartu interaktif (menampilkan snackbar) yang menampilkan ikon dan nama item

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Fungsinya untuk mengimplementasikan Material Design pada aplikasi Flutter. Sering digunakan sebagai widget root karena menyediakan semua widget esensial bagian atas widget tree, yang diperlukan oleh sebagian besar widget Material Design lainnya di bawahnya (seperti Scaffold) agar bisa berfungsi dengan benar.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Statelesswidget memiliki tampilan yang tidak berubah setelah dibuat sedangkan StatefulWidget dapat berubah tampilan sebagai respons terhadap perubahan data atau lainnya. Jika kita tidak memerlukan perubahan UI seperti teks ataupun logo maka pilih StatelessWigdet (statis), namun jika memerlukan perubahan UI saat terjadi interaksi maka pilih StatefulWidget.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalaha pegangan atau handle ke lokasi widget tertentu dalam widget tree (setiap widget memiliki BuildContext sendiri), hal ini penting karena memungkinkan widget untuk menemukan dan mengakses widget lain. Pada metode build, digunakan untuk mencari dan mengakses layanan dari widget-widget yang berada lebih tinggi dalam Widget Tree.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload memungkinkan Anda memasukkan perubahan kode sumber ke dalam aplikasi yang sedang berjalan tanpa perlu merestart aplikasi atau kehilangan state aplikasi saat ini. Bedanya dengan hot restart adalah hot restart berfokus pada pemuatan ulang aplikasi secara menyeluruh dan mengatur ulang state, sedangkan hot reload berfokus pada kecepatan dan mempertahankan state saat ini.

Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
push() menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna. Sedangkan pushReplacement() menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola Navigator, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya.
Saat pengguna sedang mencari-cari barang yang dibutuhkan, untuk pindah page misalnya dari page all product ke my product atau detail product sebaiknya menggunakan push karena pengguna dapat kembali ke halaman sebelumnya (tidak direplace).
Saat pengguna ingin membeli suatu barang, sebaiknya menggunakkan pushReplacement saat mengalihkannya ke page pembayaran berhasil, karena jika menggunakan push memungkinakn terjadinya pembayaran yang mengganda.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Saya sendiri memanfaatkannya seperti sebuah template dimana Scaffold sebagai template utama, AppBar sebagai properti Scaffold dan Drawer sebagai menu navigasi utama yang diatur oleh Scaffold.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Padding memberi jarak visual antar elemen, dimana tanpa padding form akan terlihat tidak teratur. Contohnya pada form saya, saya menggunakan padding di setiap field agar tampilan setiap field tidak saling menempel satu sama lain.
SingleChildScrollView membungkus field-field yang ada sehingga tidak memunculkan error overflow saat mengisinya. Contohnya saya membungkus field dari form add product dengan SingleChildScrollView sehingga dapat di scroll.
ListView memiliki keunggulan melalui constructor ListView.builder yang digunakan saat kita memiliki list konten yang jumlahnya tidak pasti atau sangat banyak. ListView.builder jauh lebih efisien karena ia hanya me-render item yang terlihat di layar. Contoh penggunaannya ada pada drawer app saya.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Saya sendiri menyesuaikannya di file main.dart yang mana pada materialapp nya saya membuat ColorSchemenya orange yang membuat widget-widget di halaman lain secara otomatis menampilkan warna utama yaitu warna orange. 

Tugas 9
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Karena dengan membuat model Dart, data yang kita dapat menjadi objek yang memiliki struktur dan tipe data yang jelas. Jika kita langsung memetakannya pada Map<String, dynamic>, tidak akan ada jaminan dari tipe data yang kita dapat dan bisa menyebabkan crash pada aplikasi jika ada tipe data yang hilang atau beda tipe. Kita juga harus menggunakkan operator ! dan ? untuk menangani null yang dapat membuat struktur kode menjadi berantakan. Dalam hal maintainability perubahan yang terjadi pada sisi django juga bisa berdampak besar pada sisi flutter.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
http Bertanggung jawab untuk melakukan permintaan HTTP dasar (GET, POST, PUT, DELETE) ke Django dan CookieRequest sebagai wrapper di atas package http untuk secara otomatis mengelola session cookie.
Jadi http memiliki peran untuk mengirim permintaan dan menerima respons dan CookieRequest akan menyimpan cookie pada setiap request http.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Karena CookieRequest bertindak sebagai state sesi tunggal dari aplikasi flutter. Semua widget perlu mengakses data pengguna secara langsung (real time) oleh karena itu CookieRequest perlu dibagikan ke semua komponen agar dapat melihat perubahan pada satu instance yang sama. Selain itu, CookieRequest juga mempertahankan sesi pengguna agar pengguna tidak dianggap logout saat berpindah-pindah halaman.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Ketika menjalankan server Django di localhost, emulator android tidak dapat mengakses servernya menggunakan ip tersebut sehingga emulator android menggunakan ip 10.0.2.2 sebagai alias atau pengganti untuk mengakses localhost.
Alasan perlu mengaktifkan CORS adalah untuk mengizinkan flutter membuat request karena pada dasarnya django dan flutter berada di domain yang berbeda sehingga permintaan dari flutter tidak diblokir.
Karena flutter dan django dianggap sebagai dua hal yang berbeda, diperlukan sesuatu untuk memberi tahu browser bahwa cookie ini boleh dikirim pada permintaan lintas situs (cross-site) yang diperlukan karena Flutter dan Django berada pada "situs" yang berbeda.
Sedangkan untuk izin akses android dibutuhkan karena aplikasi android defaultnya tidak memiliki akses internet.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Ketika memasukan data pada form, data tersebut diubah dari model Dart ke JSON. Kemudian CookieRequest mengirim permintaan POST/GET ke endpoint django yang akan diterima dan mengindentifikasi pengguna dengan session cookie. Django kemudian memproses data dan menyiapkan respon dalam bentuk JSON yang akan diterima oleh CookieRequest. Terakhir flutter akan menerima data json tersebut dan mengubahkan menjadi model Dart untuk ditampilkan di layar.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Login: Pengguna memasukan username dan password. Flutter akan mengirim request POST dan akan diverifikasi oleh autentikasi django. Jika sukses, django akan membuat session cookie baru dan mengambilkan JSON sukses yang kemudian akan diterima flutter> Setelah diverifikasi, flutter akan mengalihkannya ke main page.

Register: Pengguna memasukan username dan password. Flutter akan mengirim request POST ke endpoint /auth/register/ dan django akan menerima datanya. Kemudian django akan membuat objek user baru dan mengembalikannya dalam bentuk JSON sukses yang akan diterima flutter.

Logout: Setelah pengguna menekan tombol logout, flutter akan menggunakan request.logout(url) yang membuat django menghapus session cookie. flutter juga akan menghapus session cookienya dan mengalihkannya ke halaman login.


7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
a. Membuat app authentication dan menginstall django-cors-headers kemudian menambahkannya ke settings.py bagian installed_apps, middleware
b. Menambahkan beberapa variabel cookie, cors, ip android pada settings.py
c. Membuat metode login, register, dan logout pada views.py authentication dan menaruh pathnya pada urls.py
d. Membuat cookieRequest pada main di flutter, membuat halaman login dan register (juga mengatur navigasinya)
e. Membuat model productEntry mengizinkan akses internet pada flutter
f. Membuat halaman detail produk dan ProductEntryCard
g. Membuat halaman list produk dan menavigasikan setiap produk (ketika di tap/klik) menuju halaman detail
h. Menambahkan halaman list ke drawer
i. Membuat fungsi create untuk flutter di views.py dan menaruh pathnya pada urls.py
j. Mengubah halaman form pada flutter agar dapat menyimpan produk
k. Menerapkan filter pada halaman list produk dan menambahkan tombol logout pada menu