esHombre(luis).
esHombre(jesus).
esHombre(julio).
esHombre(carlos).
esHombre(octavio).
esHombre(antonio).
esHombre(tavin).
esHombre(ignacio).
esHombre(carlitos).
esHombre(juan).
esHombre(oscar).
esHombre(irving).
esHombre(alexander).
esHombre(chuy).
esHombre(guillermo).
esHombre(santiago).
esHombre(franqui).
esHombre(joseph).
esHombre(goyo).
esHombre(juanito).
esHombre(ivan).
esHombre(adriand).
esHombre(adrianf).
esHombre(luisyo).

esMujer(victoria).
esMujer(maria).
esMujer(ma).
esMujer(magali).
esMujer(gloria).
esMujer(estefania).
esMujer(fatima).
esMujer(esmeralda).
esMujer(alejandra).
esMujer(lili).
esMujer(karen).
esMujer(christina).
esMujer(elva).
esMujer(rosa).
esMujer(marta).
esMujer(danae).
esMujer(fernanda).
esMujer(jaqueline).

padre(luis,julio).
padre(luis,carlos).
padre(luis,antonio).
padre(luis,magali).
padre(jesus,guillermo).
padre(jesus,juan).
padre(jesus,ma).
padre(jesus,marta).
padre(julio,luisyo).
padre(julio,esmeralda).
padre(julio,fatima).
padre(guillermo,franqui).
padre(guillermo,joseph).
padre(guillermo,goyo).
padre(guillermo,rosa).
padre(oscar,danae).
padre(oscar,fernanda).
padre(oscar,irving).
padre(juan,karen).
padre(juan,juanito).
padre(juan,lili).
padre(octavio,tavin).
padre(octavio,alejandra).
padre(octavio,estefania).
padre(antonio,ignasio).
padre(antonio,carlitos).
padre(gustavo,ivan).
padre(adriand,chuy).
padre(adriand,alexander).
padre(adrianf,santiago).
padre(adrianf,jaqueline).

madre(maria,julio).
madre(maria,antonio).
madre(maria,carlos).
madre(maria,magali).
madre(victoria,ma).
madre(victoria,marta).
madre(victoria,guillermo).
madre(victoria,juan).
madre(gloria,ignasio).
madre(gloria,carlitos).
madre(magali,tavin).
madre(magali,alejandra).
madre(magali,estefania).
madre(ma,luisyo).
madre(ma,esmeralda).
madre(ma,fatima).
madre(cristina,lili).
madre(cristina,juanito).
madre(cristina,karen).
madre(elva,rosa).
madre(elva,franqui).
madre(elva,joseph).
madre(elva,goyo).
madre(marta,danae).
madre(marta,fernanda).
madre(marta,irving).
madre(danae,chuy).
madre(danae,alexander).
madre(fernanda,jaqueline).
madre(fernanda,santiago).
madre(karen,ivan).




esposos(victoria,jesus).
esposos(marta,oscar).
esposos(elva,guillermo).
esposos(cristina,juan).
esposos(ma,julio).
esposos(magali,octavio).
esposos(gloria,antonio).
esposos(maria,luis).
esposos(gustavo,karen).
esposos(danae,adriand).
esposos(fernanda,adrianf).

esposos(jesus,victoria).
esposos(oscar,marta).
esposos(guillermo,elva).
esposos(juan,cristina).
esposos(julio,ma).
esposos(octavio,magali).
esposos(antonio,gloria).
esposos(luis,maria).
esposos(karen,gustavo).
esposos(adriand,danae).
esposos(adrianf,fernanda).

papa(X,Y):-padre(X,Y).
mama(X,Y):-madre(X,Y).


hijos(Y,X):-papa(X,Y);mama(X,Y).
hijo(Y,X):-esHombre(Y),hijos(Y,X).
hija(Y,X):-esMujer(Y),hijos(Y,X).
hermanos(X,Y):- ((papa(Z,X),papa(Z,Y));(mama(Z,X),mama(Z,Y))),X\=Y.
hermano(X,Y):- esHombre(X),hermanos(X,Y).
hermana(X,Y):- esMujer(X),hermanos(X,Y).
abuelo(X,Y):-(papa(Z,Y);mama(Z,Y)),papa(X,Z).
abuela(X,Y):-(papa(Z,Y);mama(Z,Y)),mama(X,Z).
abuelos(X,Y):-abuelo(X,Y);abuela(X,Y).
abuelosPaterno(X,Y):-papa(Z,Y),(papa(X,Z);mama(X,Z)).
abuelosMaterno(X,Y):-mama(Z,Y),(papa(X,Z);mama(X,Z)).
abueloP(X,Y):-papa(Z,Y),papa(X,Z).
abueloM(X,Y):-mama(Z,Y),papa(X,Z).
abuelaP(X,Y):-papa(Z,Y),mama(X,Z).
abuelaM(X,Y):-mama(Z,Y),mama(X,Z).
nietos(X,Y):-abuelos(Y,X).
nieto(X,Y):-esHombre(X),nietos(X,Y).
nieta(X,Y):-esMujer(X),nietos(X,Y).
tios(X,Y):-hijos(Y,Z),hermanos(Z,X).
tio(X,Y):-esHombre(X),tios(X,Y).
tia(X,Y):-esMujer(X),tios(X,Y).
sobrinos(X,Y):-hijos(X,Z),hermanos(Z,Y).
sobrino(X,Y):-esHombre(X),sobrinos(X,Y).
sobrina(X,Y):-esMujer(X),sobrinos(X,Y).
primos(X,Y):-(papa(Z,X);mama(Z,X)),(papa(W,Y);mama(W,Y)),hermanos(Z,W).
primo(X,Y):-esHombre(X),primos(X,Y).
prima(X,Y):-esMujer(X),primos(X,Y).

padree(X,Y):-papa(X,Y);mama(X,Y).
ascend(Asc,Desc):-padree(Asc,Desc).
ascend(Asc,Desc):-padree(Asc,Hijo),ascend(Hijo,Desc).

primosP(X,Y):- esposos(X,Z),primos(Z,Y).
suegro(X,Y):- esposos(Y,Z),papa(X,Z).
suegra(X,Y):- esposos(Y,Z),mama(X,Z).
cu�ados(X,Y):-esposos(X,Z),hermanos(Z,Y).
yerna(X,Y):-esMujer(X),esposos(X,Z),(papa(Y,Z);mama(Y,Z)).
nuera(X,Y):-esposos(X,Z),(papa(Y,Z);mama(Y,Z)),esMujer(X).




