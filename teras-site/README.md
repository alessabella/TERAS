# Teras — Teman Air, Asal Sehat

Website kampanye digital (single page, statis) tentang air bersih, pencemaran Kali Jaletreng hingga Sungai Cisadane.
Satu file `index.html` tanpa build step, tanpa backend, **tanpa API key / password**.

## Struktur
```
index.html          # seluruh website (edit teks di objek D pada <script>)
images/             # foto-1.jpg, foto-2.jpg, foto-3.jpg (+ foto kegiatan)
vercel.json         # konfigurasi Vercel (header keamanan)
.gitignore          # mencegah .env / kunci ikut ter-commit
scripts/check-secrets.sh
```

## 0) Siapkan foto & umpan balik
- 3 foto sudah ada di `images/` (`foto-1`, `foto-2`, `foto-3`). Ganti file dengan nama sama untuk mengubahnya; format .jpg/.jpeg/.png/.webp dikenali.
- Umpan balik memakai Google Form yang di-embed (`<iframe id="gform">` di footer). Untuk mengganti form: ubah URL `viewform?embedded=true` di `index.html` dan di baris `frame-src` pada `vercel.json` bila domainnya berubah.
- Tanggapan masuk ke tab **Responses** pada Google Form Anda, tidak ada kunci atau password di kode.

## 1) Upload ke GitHub
```bash
cd teras-site
bash scripts/check-secrets.sh        # pastikan bersih
git init
git add .
git commit -m "Website kampanye Teras"
git branch -M main
git remote add origin https://github.com/<USERNAME>/teras.git   # buat repo kosong dulu di github.com/new
git push -u origin main
```
Tanpa terminal: buka repo baru di GitHub → **Add file → Upload files** → seret semua isi folder ini.

## 2) Hosting di Vercel
1. Masuk ke vercel.com dengan akun GitHub → **Add New… → Project** → pilih repo `teras` → **Import**.
2. **Framework Preset: Other**. Build Command & Output Directory **dikosongkan** (situs statis). Klik **Deploy**.
3. Setiap `git push` ke `main` akan otomatis ter-deploy ulang.
4. Domain sendiri (mis. teras.com): Project → **Settings → Domains**.

## Keamanan
- Jangan menaruh API key, password, atau token di `index.html` (semua yang ada di sana publik).
- Jika suatu saat perlu layanan berkunci (mis. kirim feedback), simpan kunci di **Vercel → Settings → Environment Variables** dan pakai lewat Serverless Function di folder `api/`, bukan di kode halaman.
- URL Google Form bersifat publik dan bukan rahasia. Jangan memasukkan tautan *edit* form (yang berisi `/edit`) ke kode, cukup tautan `viewform`.
- Umpan balik tersimpan di Google Form. Form pendaftaran kegiatan masih contoh (belum tersimpan ke server); hubungkan ke Google Form/Formspree bila ingin dipakai sungguhan.

## Sumber konten
Daftar berita rujukan ada di gelembung "Data Pencemaran" pada bagian Pengenalan.
