domains
nama,ce = symbol
nim = unsigned

predicates
nondeterm data(nama,nim)
nondeterm kelas_unggul(nama,ce)
nondeterm kelas_biasa(nama,ce)

clauses
data("Abri",1515015001).
data("Ariel",1515015052).
data("Hendri",1515015103).
data("Melky",1515015157).

kelas_unggul(Nama,"A"):-
data(Nama,Nim),
fail,
not(data(Nama,Nim)),
Nim < 1515015050.

kelas_biasa(Nama,"B"):-
data(Nama,Nim),!,
Nim > 1515015050.


goal
kelas_unggul(X,"A"),
kelas_Biasa(V,"B"),
write("yang masuk kelas unggul adalah ",X,V," dari kelas A","\n").