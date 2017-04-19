DOMAINS 
     nama_mk, nama_mhs = symbol   
     nilai = string 
     list = nilai*  

PREDICATES
        nondeterm mata_kuliah(nama_mk, nama_mhs, nilai)
        nondeterm lulus(nama_mk, nama_mhs)
        nondeterm tidak_lulus(nama_mk, nama_mhs)

CLAUSES
     mata_kuliah("Intelegensi Buatan", "Supardi", "A").  
     mata_kuliah("Intelegensi Buatan", "Surdi", "B").    
     mata_kuliah("Intelegensi Buatan", "Suyatmi", "C"). 
     mata_kuliah("Intelegensi Buatan", "Suparni", "D"). 
     mata_kuliah("Intelegensi Buatan", "Sujiman", "C"). 

     mata_kuliah("PDE", "Suharto","B").   
     mata_kuliah("PDE", "Sudirman","C"). 
     mata_kuliah("PDE", "Supardi","C").  
     mata_kuliah("PDE", "Suyatmi","B").   
     mata_kuliah("PDE", "Sutini","D").    

     mata_kuliah("Sistem Operasi", "Suharto", "B").  
     mata_kuliah("Sistem Operasi", "Sutini", "A").  
     mata_kuliah("Sistem Operasi", "Supardi", "A"). 
     mata_kuliah("Sistem Operasi", "Suparni", "B").  
     mata_kuliah("Sistem Operasi", "Suripah", "C"). 

lulus(X,Y):-
     mata_kuliah(X,Y,"A"); 
     mata_kuliah(X,Y,"B");  
     mata_kuliah(X,Y,"C"). 

tidak_lulus(X,Y):-
           mata_kuliah(X,Y,"D"); 
           mata_kuliah(X,Y,"E"). 

GOAL
     mata_kuliah(Nama_MK, "Supardi" ,Nilai).
     %mata_kuliah(_, "Suripah" ,_).         
     %jumlah_elemen([1,2,3],L,0).           
     
     /*dari run diatas kenapa hasil yang keluar nama mk= intelejensi buatan bernilai a, nama mk pde bernilai e, dan nama mk sistem operasi bernilai c. 
     ya hasil berikut terpanggil karena dari goalnya sudah menyebutkan si supardi, dan dari fakta-faktanya sudah terlihat supardi memiliki nilai matkul dengan nilai-nilai diatas
     , dan aturannya tidak mempengaruhi apa yang outputnya tampilkan, dan yang tertampil tetap data dari fakta-faktanya*/