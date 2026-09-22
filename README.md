# 244107020176-mobile-course
1. Kapan Pengembangan Native Lebih Tepat Dibandingkan Cross-Platform

Akses Hardware & API Spesifik: Aplikasi membutuhkan akses intensif ke fitur perangkat keras seperti Bluetooth Low Energy tingkat lanjut, pemrosesan sensor kustom, atau fitur kamera tingkat rendah.

Performa Grafis & Komputasi Tinggi: Aplikasi memproses grafis 3D kompleks, manipulasi video secara langsung (real-time), atau algoritma pembelajaran mesin di perangkat (on-device ML).

Dukungan Fitur Baru OS Hari Pertama: Aplikasi harus langsung menerapkan API atau sistem antarmuka terbaru yang baru saja dirilis oleh Apple atau Google tanpa menunggu pembaruan pustaka dari komunitas.

Integrasi SDK Khusus: Terdapat ketergantungan pada SDK pihak ketiga yang hanya menyediakan pustaka native dalam bahasa Swift, Objective-C, Kotlin, atau Java.

2. Prinsip UI Deklaratif: Antarmuka dibangun berdasarkan kondisi data saat ini ($UI = f(State)$). Kamu cukup mendeskripsikan bentuk tampilan untuk setiap status data tanpa mengedit komponen antarmuka secara manual.Pemicu Perubahan State: Ketika terjadi perubahan data (seperti pemanggilan fungsi pembaruan state), kerangka kerja menandai widget yang bersangkutan perlu diperbarui.Proses Rebuild pada Widget Tree: Perubahan state memicu pembangunan ulang (rebuild) pada widget tree di bagian yang terdampak. Kerangka kerja membandingkan struktur baru dengan struktur lama, lalu hanya memperbarui elemen layar yang benar-benar mengalami perubahan sehingga proses render tetap efisien.

3. Manfaat Commit Kecil dan Pesan Jelas

Untuk Pekerjaan Tim:

Ulasan Kode Lebih Efektif: Rekan tim dapat meninjau (code review) logika perubahan dengan cepat karena fokus pada satu tugas spesifik (atomic commit).

Pelacakan Bug dan Rollback: Jika terjadi kesalahan pada production, kamu dapat membatalkan (revert) commit tertentu tanpa merusak fitur lain yang sudah berjalan dengan baik.

Dokumentasi Riwayat: Pesan commit yang jelas berfungsi sebagai dokumentasi yang menjelaskan alasan teknis di balik suatu perubahan kode.