DOMAINS 
  nama,jender,pekerjaan,benda,alasan,zat = symbol 
  umur=integer 
 
PREDICATES 
  nondeterm orang(nama, umur, jender, pekerjaan) 
  nondeterm selingkuh(nama, nama) 
  terbunuh_dengan(nama, benda) 
  terbunuh(nama) 
  nondeterm pembunuh(nama) 
  motif(alasan) 
  ternodai(nama, zat) 
  milik(nama, benda) 
  nondeterm cara_kerja_mirip(benda, benda) 
  nondeterm kemungkinan_milik(nama, benda) 
  nondeterm dicurigai(nama) 
 
/* * * Fakta-fakta tentang pembunuhan * * */ 
CLAUSES 
orang(budi,55,m,tukang_kayu). 					
  orang(aldi,25,m,pemain_sepak_bola). 				
  orang(aldi,25,m,tukang_jagal). 				
  orang(joni,25,m,pencopet). 					
 								
  selingkuh(ina,joni). 
  selingkuh(ina,budi). 
  selingkuh(siti,joni). 
 
  terbunuh_dengan(siti,pentungan). 
  terbunuh(siti). 
 
  motif(uang). 
  motif(cemburu). 
  motif(dendam). 
 
  ternodai(budi, darah). 
  ternodai(siti, darah). 
  ternodai(aldi, lumpur). 
  ternodai(joni, coklat). 
  ternodai(ina, coklat). 
 
  milik(budi,kaki_palsu). 
  milik(joni,pistol). 
 
/* * * Basis Pengetahuan * * */ 
 cara_kerja_mirip(kaki_palsu, pentungan). 	
  cara_kerja_mirip(balok, pentungan). 		
  cara_kerja_mirip(gunting, pisau). 				
  cara_kerja_mirip(sepatu_bola, pentungan). 
 
  kemungkinan_milik(X,sepatu_bola):- 
  orang(X,_,_,pemain_sepak_bola). 
  kemungkinan_milik(X,gunting):- 
  orang(X,_,_,pekerja_salon). 
  kemungkinan_milik(X,Benda):- 
  milik(X,Benda). 
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * dicurigai semua orang yang memiliki senjata yang      * 
 * kerjanya mirip dengan senjata penyebab siti terbunuh. * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * */ 
 
  dicurigai(X):- 
  terbunuh_dengan(siti,Senjata) , 
  cara_kerja_mirip(Benda,Senjata) , 
  kemungkinan_milik(X,Benda). 
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * 
 * dicurigai laki-laki yang selingkuh dengan siti. * 
 * * * * * * * * * * * * * * * * * * * * * * * * * */ 
 
  dicurigai(X):- 
  motif(cemburu), 
  orang(X,_,m,_), 
  selingkuh(siti,X). 
 
/* * * * * * * * * * * * * * * * * * * * * * * 
 * dicurigai perempuan yang selingkuh dengan * 
 * laki-laki yang juga selingkuh dengan siti * 
 * * * * * * * * * * * * * * * * * * * * * * */ 
 
  dicurigai(X):- 
  motif(cemburu), 
  orang(X,_,f,_), 
  selingkuh(X,Lakilaki), 
  selingkuh(siti,Lakilaki). 
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * dicurigai pencopet yang mempunyai motif uang.     * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * */ 
 
 dicurigai(X):- 
  motif(uang), 
  orang(X,_,_,pencopet). 
 
  pembunuh(Pembunuh):- 
  orang(Pembunuh,_,_,_), 
  terbunuh(Terbunuh), 
  Terbunuh <> Pembunuh, /* Bukan bunuh diri */ 
  dicurigai(Pembunuh), 
  ternodai(Pembunuh,Zat), 
  ternodai(Terbunuh,Zat). 
 
GOAL 
  pembunuh(X).
  
/* dari run di atas kenapa yang muncul budi ?, pertama-tama fakta nya ada budi sebagai tukang kayu, aldi pemain sepak bola, aldi jg tukang jagal, dan joni tukang copet.
lalu di fakta selanjutnya ada ina selingkuh dengan joni dan budi, lalu siti selingkuh jg dengan joni.
fakta selanjutnya siti terbunuh dengan pentungan, siti terbunuh. motif nya kira-kira ada 3 macam, uang cemburu atau dendam
di fakta selanjutnya dsini fakta sudah mulai berlari kebudi, karena disini diketahui budi ternodai darah, sama seperti siti
budi memiliki kaki palsu, dan joni memiliki pistol, lalu cara kerja nya kaki palsu sebagai pentungan dan disini bukti-bukti sudah emngarah ke budi
balok dan sepatu bola jg bisa sebagai pentungan, tp fakta di atas tidak disebutkan sepatu bola, balok dan pisau tidak memiliki pemilik
lalu di bawah muncul aturan yaitu perkiraan siapa pemilik dari alat yg blm ada pemiliknya
lalu muncul lagi aturan yang memperkiraan siti terbunuh, perikiraan di aturan selanjutnya ini menjelaskan siti terbunuh dengan pentungan, tapi pentungan siapa?
kita langsung ambil saja bagian aturan terakhir karena, di aturan terakhir ini bukti-bukti dan aturan nya bisa sudah di temukan siapa pelaku pembunuh siti
pembunuh ini adalah orang yang membunuh, lalu yang terbunuh adalah siti lalu yang terbunuh oleh pembunuh yang dicurigai
pembunuh yang dicurigai ternodai zat yang sama dengan terbunuh, yaitu darah !!. lalu goal diatas memanggil siapa pembunuh itu. */