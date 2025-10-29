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