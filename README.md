PantrySync
Deskripsi Aplikasi
PantrySync adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu pengguna mengelola stok bahan makanan agar tidak terbuang karena kedaluwarsa. Aplikasi ini memungkinkan pengguna untuk mencatat bahan makanan, memantau masa berlaku, memperoleh rekomendasi resep berdasarkan bahan yang tersedia, serta membuat daftar belanja dengan lebih praktis. Dengan tampilan yang sederhana dan mudah digunakan, aplikasi ini juga didesain agar siap dikembangkan dengan fitur AI di masa mendatang.

- Arsitektur Database (Supabase / PostgreSQL)
Aplikasi menggunakan Supabase (PostgreSQL) sebagai database untuk menyimpan data secara online sehingga data pengguna dapat tersinkronisasi antar perangkat.

1. Tabel pantry_items (Menyimpan data bahan makanan pengguna ):
id (UUID / Primary Key) 
user_id (UUID / Foreign Key terhubung ke sistem autentikasi) 
name (String) 
category (String) 
quantity (Integer/Double) 
unit (String/Varchar, misal: "kg", "pcs", "liter") 
expiration_date (Date) 
is_notified (Boolean, default: false) 
created_at (Timestamp) 

2. Tabel shopping_list (Menyimpan daftar belanja pengguna ):
id (UUID / Primary Key) 
user_id (UUID / Foreign Key) 
item_name (String) 
quantity (Integer/Double) 
unit (String/Varchar) 
is_purchased (Boolean) 
created_at (Timestamp) 

- Referensi UI & Konsep Desain

gaya Clean & Minimalist UI.
Struktur layout mengandalkan Card-based Layout dan Bottom Navigation Bar.
Tampilan bersifat responsif (Responsive Layout).
Pewarnaan menggunakan Soft color palette (putih, hijau, dan oranye/merah sebagai indikator status kedaluwarsa). Keputusan ini memungkinkan pengguna memproses informasi kedaluwarsa hanya dengan sekilas scanning.
Referensi visual diambil dari Dribbble, Behance, dan Pinterest untuk kategori Pantry, Recipe, dan Grocery App UI dll.

- Fitur Utama (Fase MVP)

-- Pantry Inventory: Fitur untuk menambahkan, mengedit, dan menghapus bahan makanan, serta menyimpan informasi kategori, jumlah, dan tanggal kedaluwarsanya.
-- Expiry Reminder: Fitur yang menampilkan status bahan makanan (seperti Fresh, Expiring Soon, Expired) dan memberikan peringatan melalui Local Notification saat mendekati tanggal kedaluwarsa.
-- Search & Filter: Menyediakan kemampuan pencarian bahan berdasarkan nama, serta penyaringan (filter) berdasarkan kategori maupun status kedaluwarsa.
-- Recipe Suggestion: Fitur yang mengambil rekomendasi resep dari Recipe API berdasarkan bahan yang tersedia di pantry pengguna. Fitur ini menampilkan detail gambar, daftar bahan, langkah memasak, dan estimasi waktunya.
-- Shopping List: Fitur pencatatan daftar belanja yang memungkinkan pengguna menambahkan barang, menandai yang sudah dibeli, dan menghapus daftar.

