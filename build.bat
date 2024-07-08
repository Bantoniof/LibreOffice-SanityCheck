Rem comprime con 7zip (tiene que estar en el path)
Rem -tzip = usar compresión zip 
Rem  si no se indica, usa la nativa 7zip, que es incompatible 
cd SanityCheck
7z a -tzip SanityCheck.oxt .
move SanityCheck.oxt ..
