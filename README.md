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