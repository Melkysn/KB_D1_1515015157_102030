domains
 nilai = integer
 
 
predicates
 nama(symbol,symbol) - nondeterm (i,i) nondeterm (o,o) nondeterm (i,o) nondeterm (o,i)
 matkulintel(symbol) - nondeterm (o)
 
 
clauses
nama(a, irfan).
nama(d,omeng).
nama(c, dati).
nama(b, fatima).
nama(c, maspion).
nama(e, ricky).
nama(a, embang).
nama(d, salmin).
nama(b, vina).
nama(c, sondang).
nama(d, pamuji).
nama(e, luki).
nama(b, sadek).
nama(a, yusida).
nama(a, eka).

/*A, D, C, 
B, C, E, A, D, B, C, D, E, B, A, dan A. Mahasiwa yang tidak  lulus adalah mahasiswa yang 
nilainya di bawah C (D dan E tidak lulus). */

 matkulintel(Y):-
 	nama(d,Y);
 	nama(e,Y).
 	


goal
  matkulintel(Gklulus),
  
  write("Mahasiswa yang yang tidak lulus: ",Gklulus,"\n").


/*Intelejensi Buatan (Irfan, Komeng, Dati, Fatima, dan Maspion); 5 mahasiswa mengambil
mata  kuliah  PDE  (Ricky,  Embang,  Salmin,  Vina,  dan  Sondang)  dan  5  mahasiswa  lagi
mengambil mata  kuliah  Sistem Operasi  (Pamuji,  Luki,  Sadek,  Yusida  dan  Eka).  Setelah*/