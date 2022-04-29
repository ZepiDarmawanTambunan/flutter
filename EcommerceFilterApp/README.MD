A. SCREENS
1. MAIN SCREEN MENAMPILKAN HALAMAN UTAMA PENCARIAN MACBOOK
2. FILTER SCREEM MENAMPILKAN showModalBottomSheet mirip popup

B.PROVIDERS
1. shop result menyimpan dummy data
2. customer review didalam nya menyimpan customer review yg saat ini diklik
3. sort filter didalamnya menyimpan sort by yg saat ini diklik

C. MODELS
1. shop result berupa class utama dengan freezed_annotation
2. shop result freezed ini hasil dari perintah "pub run build_runner build" setelah mendefinisikan models/shop result dan /providers/shop result

D. ENUMS
berisi enum untuk RadioListTile pada sort by dan customer review

E. CONTROLLERS
berisi kode logic untuk handle string to rupiah 5000 -> rp. 5.000


HALAMAN UTAMA
![Screenshot (4795)](https://user-images.githubusercontent.com/58543758/165887574-f4754c97-0190-4da7-8b46-68d5b0fc9b3e.png)


HALAMAN SORT BY
![Screenshot (4796)](https://user-images.githubusercontent.com/58543758/165887587-1c5a9400-c7b2-470c-91db-e8ec3918ba4d.png)


HALAMAN FILTER
![Screenshot (4797)](https://user-images.githubusercontent.com/58543758/165887624-dd2fbe47-6a04-49fa-8000-febe152a1888.png)
