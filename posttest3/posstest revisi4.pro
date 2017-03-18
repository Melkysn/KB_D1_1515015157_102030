domains
 nilai = integer
 
 
predicates
 nama(symbol,symbol) - nondeterm (i,i) nondeterm (o,o) nondeterm (i,o) nondeterm (o,i)
 matkulintel(symbol) - nondeterm (o)
 
 
clauses
nama(intelejensi_buatan,a).
nama(pde,a).
nama(sistem_operasi,a).


/*A, D, C, 
B, C, E, A, D, B, C, D, E, B, A, dan A. Mahasiwa yang tidak  lulus adalah mahasiswa yang 
nilainya di bawah C (D dan E tidak lulus). */

 matkulintel(Y):-
 	nama(Y,a).	


goal
  matkulintel(Matkul),
  
  write("Matakuliah : ",Matkul,"\n").


/*Intelejensi Buatan (Irfan, Komeng, Dati, Fatima, dan Maspion); 5 mahasiswa mengambil
mata  kuliah  PDE  (Ricky,  Embang,  Salmin,  Vina,  dan  Sondang)  dan  5  mahasiswa  lagi
mengambil mata  kuliah  Sistem Operasi  (Pamuji,  Luki,  Sadek,  Yusida  dan  Eka).  Setelah*/