# Recomandari pentru redactarea lucrarii de licenta

Acest document este refacut pe baza **transcrierii audio** din cele trei inregistrari video. Textul vizual de pe ecran a fost folosit ca sprijin pentru structura, dar explicatiile de mai jos vin in principal din audio.

Transcripturile brute, cu timestampuri, sunt salvate separat:

- `transcript-audio-complet.md`
- `transcripturi-audio/video-1-transcript-audio.md`
- `transcripturi-audio/video-2-transcript-audio.md`
- `transcripturi-audio/video-3-transcript-audio.md`

> Nota: transcriptul audio este automat, generat cu `faster-whisper small`, in romana. Unele cuvinte tehnice au fost corectate in sinteza de mai jos: de exemplu `age devices` inseamna `edge devices`, `flot` inseamna `float`, iar `posit` se refera la formatul numeric posit.

---

## Surse

| Video | Fisier | Subiect principal | Transcript |
| --- | --- | --- | --- |
| Video 1 | `1.abstract introducere.mkv` | Abstract si introducere | `transcripturi-audio/video-1-transcript-audio.md` |
| Video 2 | `2.cuprins.mkv` | Cuprins, capitole, evaluare | `transcripturi-audio/video-2-transcript-audio.md` |
| Video 3 | `3.concluzie.mkv` | Concluzie | `transcripturi-audio/video-3-transcript-audio.md` |

---

## Ideea centrala

Lucrarea trebuie sa spuna o poveste clara:

1. Care este domeniul?
2. Care este contextul mai ingust?
3. Care este problema?
4. De ce problema este importanta?
5. Ce solutii exista deja?
6. Ce solutie propui tu?
7. Cum o evaluezi?
8. Ce rezultate ai obtinut?
9. Ce impact au rezultatele?
10. Ce ramane de facut mai departe?

Profesorul revine de mai multe ori la ideea ca o lucrare buna nu este doar o lista de tehnologii sau rezultate. Ea trebuie sa arate o relatie logica intre problema, solutie, evaluare si concluzie.

---

## Structura recomandata

1. **Abstract**
2. **Introducere**
3. **Background / Literature Review / Context**
4. **Arhitectura / Structura experimentului**
5. **Implementare**
6. **Evaluare**
7. **Concluzie**

Numarul capitolelor poate varia. De exemplu, evaluarea poate fi impartita in mai multe capitole: setup experimental, rezultate si discutii. Important este ca ordinea logica sa ramana clara.

---

## 1. Abstract

Abstractul este prezentat ca una dintre cele mai importante parti ale lucrarii. Este un rezumat foarte concis al intregii licente, iar cine il citeste ar trebui sa inteleaga repede despre ce este lucrarea.

Profesorul recomanda sa fie gandit de la inceput, pentru ca da directia lucrarii, dar sa fie scris sau rafinat la final, cand intreaga lucrare este deja clara.

### Structura recomandata pentru abstract

Abstractul poate fi construit din propozitii scurte, fiecare cu rol clar:

1. **Domeniul** in care se afla lucrarea.
2. **Contextul** mai ingust al problemei.
3. **Problema** concreta.
4. **Solutia** propusa.
5. **Evaluarea / validarea**, adica cel mai important rezultat.
6. **Concluzia** asupra intregii lucrari.

### Explicatia din audio

Mai intai trebuie spus domeniul mare. Exemplul din inregistrare este zona de inteligenta artificiala, machine learning, retele neurale sau DNN. Pentru o alta lucrare, domeniul poate fi robotica, reprezentari numerice, aplicatii web, sisteme distribuite etc.

Dupa domeniu vine contextul. Contextul este subdomeniul concret in care apare problema. In exemplu, domeniul este retele neurale, iar contextul este rularea lor pe `edge devices`: telefoane mobile, sisteme IoT sau echipamente cu putere de procesare mai mica decat cloud-ul ori un workstation.

Apoi se formuleaza problema. In exemplu, retelele neurale moderne cresc in numar de parametri si in dimensiune. Din cauza aceasta, ele pot deveni greu de stocat, lente sau inutilizabile pe echipamente edge. Daca raspunsul vine prea tarziu, el poate sa nu mai fie util.

Solutia trebuie spusa imediat dupa problema. In exemplu, solutia este folosirea numerelor posit pentru a stoca valorile pe dimensiuni mai mici, pastrand acuratetea si crescand viteza de inferenta.

Dupa solutie trebuie spus cel mai important rezultat al evaluarii. Nu trebuie neaparat comparatie cu state of the art. Poate fi si o comparatie intre doua variante realizate in lucrare. Exemplul dat: reducerea dimensiunii la jumatate, pastrand acuratetea intr-o marja mica, aproximativ 1%.

Ultima propozitie trebuie sa fie concluzia lucrarii: ce schimba lucrarea, unde ar trebui folosita solutia si ce valoare aduce.

### Ce trebuie evitat

- Abstract vag, fara problema concreta.
- Abstract care spune doar ca "am implementat o aplicatie".
- Abstract fara rezultat masurabil sau validare.
- Abstract care nu spune ce concluzie se poate trage din rezultate.

---

## 2. Introducere

Introducerea este dezvoltarea abstractului. Daca abstractul spune povestea in cateva propozitii, introducerea o explica in paragrafe.

Profesorul spune ca introducerea este un rezumat al primelor capitole ale lucrarii. Ea trebuie sa explice cititorului domeniul, contextul, problema si drumul pana la solutia propusa.

### Structura recomandata pentru introducere

1. Un paragraf despre **domeniu**.
2. Un paragraf despre **context**.
3. Un paragraf despre **problema**.
4. Doua-trei paragrafe despre **importanta problemei** sau despre **solutiile deja existente**.
5. Un paragraf despre **solutia propusa**.
6. Un paragraf despre **metodologia de evaluare**.
7. Un paragraf despre **contributiile tezei**.
8. Un paragraf despre **structura tezei**.

Profesorul mentioneaza ca introducerea ar trebui sa fie de aproximativ 1-2 pagini, nu mult mai mult.

### Domeniu

In paragraful despre domeniu trebuie explicat cadrul general. De exemplu, daca lucrarea este despre retele neurale, poti spune ca domeniul a crescut mult, ca exista interes ridicat, competitie, aplicatii practice si rezultate importante.

Nu trebuie intrat in detalii de implementare. Rolul acestui paragraf este sa orienteze cititorul.

### Context

Contextul este partea mai ingusta a domeniului. In exemplul din audio, contextul este folosirea retelelor neurale pe dispozitive edge. Aici poti explica de ce aceste dispozitive sunt relevante: telefoane, IoT, lipsa unui GPU, constrangeri de energie, viteza si memorie.

### Problema

Dupa domeniu si context se prezinta problema gasita. Aici nu este suficient sa spui doar "exista o problema". Trebuie sa explici ce se intampla concret si de ce problema apare in contextul ales.

In exemplu: retelele neurale cresc in dimensiune si devin prea mari sau prea lente pentru dispozitive edge.

### Importanta problemei si solutii existente

Dupa prezentarea problemei, trebuie aratat ca ea merita rezolvata. Profesorul recomanda 2-3 paragrafe in care:

- explici impactul problemei;
- arati cum afecteaza domeniul, utilizatorii sau contextul;
- prezinti oameni / lucrari / solutii care au incercat deja sa o rezolve;
- arati limitele acelor solutii.

Daca exista deja solutii, ele dau credibilitate problemei: arata ca si altii au considerat-o importanta. Daca problema este foarte noua si nu exista solutii, trebuie explicat impactul potential.

### Solutia propusa

Solutia trebuie introdusa dupa ce cititorul intelege problema si importanta ei. Trebuie spus clar:

- ce ai incercat;
- de ce acea metoda are sens;
- cum rezolva problema;
- ce aduce fata de solutiile existente.

Exemplul din audio: daca problema este dimensiunea mare a parametrilor si alternativa este folosirea unor retele mai mici cu pierdere de acuratete, solutia propusa poate fi o unitate hardware de procesare posit care pastreaza acuratetea si reduce dimensiunea / costul.

### Metodologia de evaluare

Introducerea poate include un paragraf despre cum va fi evaluata solutia. Nu trebuie prezentate toate rezultatele aici, ci principiul:

- ce vei masura;
- de ce acele masuratori conteaza;
- cum vei demonstra ca solutia rezolva problema.

Profesorul spune ca orice solutie pentru problema respectiva ar trebui evaluata intr-un anumit fel, iar acest lucru trebuie anuntat.

### Contributiile tezei

Introducerea trebuie sa spuna ce aduce concret lucrarea. Contributiile pot fi rezultate mari sau mici, dar trebuie formulate explicit:

- ai redus dimensiunea parametrilor;
- ai crescut viteza;
- ai construit prima solutie de un anumit tip;
- ai testat o metoda pe un nou set de aplicatii;
- ai comparat doua variante si ai aflat care este mai buna.

### Structura tezei

Ultimul paragraf al introducerii explica structura lucrarii:

- in capitolul 2 se prezinta background-ul;
- in capitolul 3 se prezinta arhitectura;
- in capitolul 4 se prezinta implementarea;
- in capitolul 5 se prezinta evaluarea;
- in capitolul 6 se discuta rezultatele si se trage concluzia.

---

## 3. Background / Literature Review / Context

Capitolul 2 poate avea nume diferite: background, literature review, related work sau context. Denumirea depinde de lucrare, dar rolul este clar: sa aduca cititorul la nivelul la care poate intelege lucrarea.

Profesorul spune ca acest capitol trebuie sa porneasca de la presupunerea ca cititorul are cunostinte minime sau elementare in domeniu. Dupa acest capitol, cititorul trebuie sa poata intelege restul lucrarii.

### Ce intra aici

In background pot intra:

- contextul detaliat;
- teoria folosita mai tarziu;
- tehnologii relevante;
- formule sau metode de evaluare deja cunoscute;
- solutii alternative;
- articole relevante;
- comparatii generale intre tehnologii.

Un exemplu din audio: daca in evaluare folosesti o formula sau o metoda de masurare, nu este bine sa o definesti abia in evaluare. Daca este o metoda standard, locul ei este in background.

### Related work si solutii alternative

Profesorul face o distinctie importanta. Related work poate fi pus in capitolul 2, dar uneori este mai potrivit dupa evaluare.

Daca il pui in capitolul 2, il prezinti ca solutii alternative la problema ta, fara sa discuti inca rezultatele tale. Spui ce au incercat altii si ce limite au.

Daca il pui dupa evaluare, poti compara direct rezultatele tale cu rezultatele lor. Atunci discutia este mai puternica, pentru ca ai deja datele tale.

### Structura orientativa

Pentru background / literature review:

- aproximativ 5-7 pagini;
- aproximativ 2 pagini pentru context / domeniu;
- aproximativ 1 pagina pentru problema;
- aproximativ 2 pagini pentru solutii alternative;
- pana la 3 pagini pentru tehnologii folosite, daca este necesar.

Aceste valori nu sunt reguli fixe. Ele depind de lucrare.

---

## 4. Arhitectura / Structura experimentului

Acest capitol prezinta solutia la nivel abstract. Profesorul insista ca aici nu trebuie intrat in detalii de cod sau de implementare.

Trebuie sa privesti solutia ca o structura de componente, ca niste `black boxes` conectate intre ele. Explici ce face fiecare componenta, cum comunica si ce rol are in solutia completa.

### Ce trebuie explicat

- solutia la nivel conceptual;
- componentele principale;
- rolul fiecarei componente;
- comunicarea dintre componente;
- situatii speciale;
- metodologia abstracta de evaluare, daca este parte din contributie.

### Ce nu trebuie facut aici

- nu intri in detalii de limbaj de programare;
- nu explici cod;
- nu prezinti rezultate;
- nu spui "am folosit Python / Node.js" decat daca vorbesti la nivel abstract despre tipul de tehnologie.

### Exemplu din audio

Profesorul foloseste exemplul unei arhitecturi RISC-V existente. Solutia lui modifica o componenta de tip floating point unit si o inlocuieste cu o unitate aritmetica posit. La nivel de arhitectura se spune:

- componenta noua are aceleasi instructiuni;
- comunica la fel cu restul procesorului;
- are subcomponente pentru operatii precum decodificare sau radical;
- va fi evaluata prin viteza, numar de cicluri, numar de porti logice si consum de energie.

Acestea sunt explicatii arhitecturale, nu detalii de implementare.

### Dimensiune orientativa

Capitolul de arhitectura poate avea 5-8 pagini, dar si 3-4 pagini pot fi suficiente daca solutia este mai simpla.

---

## 5. Implementare

Capitolul de implementare raspunde la intrebarea: **cum ai implementat efectiv solutia abstracta propusa anterior?**

Aici intri in detalii tehnice. Folosesti conceptele din background si structura din arhitectura, dar explici concret cum ai construit solutia.

### Ce intra in implementare

- tehnologiile folosite;
- de ce ai ales acele tehnologii, daca nu ai explicat deja in background;
- componentele implementate;
- problemele de care te-ai lovit;
- solutiile gasite;
- algoritmi sau pseudocod specific;
- instructiuni de rulare;
- requirements si pasi de reproducere.

### Importanta problemelor intampinate

Profesorul spune ca problemele pe care le-ai intalnit si modul in care le-ai rezolvat pot fi contributii. Nu trebuie ascunse. Daca ai avut de implementat un `black box` din arhitectura si ai folosit un anumit algoritm, explica de ce si cum.

Exemplul din audio: pentru o componenta care calculeaza radical, poate fi prezentat algoritmul `non-restoring`, inclusiv pseudocod.

### Reproductibilitate

Este util sa explici cum poate altcineva sa ruleze implementarea:

- ce trebuie instalat;
- ce comenzi trebuie rulate;
- ce fisiere sunt necesare;
- cum se reproduce experimentul.

### Dimensiune orientativa

Implementarea poate varia mult. Poate avea putine pagini sau poate ajunge la 15-20 de pagini, in functie de cat de complexa este lucrarea si de cate probleme tehnice au aparut.

---

## 6. Evaluare

Evaluarea este descrisa ca una dintre cele mai importante parti ale lucrarii. Aici demonstrezi daca solutia propusa chiar rezolva problema.

Profesorul spune ca evaluarea trebuie lucrata cel mai atent.

### Structura evaluarii

Evaluarea poate fi impartita in trei zone:

1. **Metodologia / setup-ul experimental**: cum ai evaluat.
2. **Rezultatele**: ce valori ai obtinut.
3. **Discutiile**: ce inseamna rezultatele si ce impact au.

Acestea pot fi subcapitole sau capitole separate, in functie de dimensiunea lucrarii.

### Setup experimental

In partea de evaluare trebuie sa mergi pe rand prin metodele propuse anterior:

- ce experiment faci;
- unde / pe ce sistem il faci;
- ce parametri folosesti;
- ce valori compari;
- ce masori;
- de ce acele masuratori sunt relevante.

Fiecare experiment trebuie sa aiba parametri si comparatii. De exemplu, daca testezi mai multe dimensiuni, trebuie sa arati clar ce valori compari.

### Rezultate

Rezultatele trebuie prezentate prin grafice, tabele sau valori clare. Pentru fiecare experiment trebuie aratat:

- ce ai masurat;
- valoarea maxima / minima, daca este relevant;
- cum se compara variantele;
- ce tendinte apar.

Nu este suficient sa spui "merge mai bine". Trebuie sa arati numeric sau printr-o validare concreta.

### Discutii

Discutia este locul unde explici impactul rezultatelor. Aici tragi concluzii partiale:

- de ce un rezultat este bun sau slab;
- ce inseamna pentru domeniu;
- cand merita folosita solutia;
- cand nu merita folosita;
- ce trade-off-uri apar.

Exemplul din audio:

- posit pe 8 biti poate fi prea slab ca acuratete;
- posit pe 16 biti poate oferi o combinatie buna intre memorie, viteza si acuratete;
- posit pe 32 biti poate avea acuratete foarte buna, dar poate consuma mai multa energie sau arie;
- in context edge poate fi recomandata o varianta, iar in cloud alta varianta.

### Ce trebuie evitat

- evaluare fara parametri;
- grafice fara interpretare;
- rezultate fara comparatie;
- discutii care nu spun impactul asupra problemei initiale.

---

## 7. Concluzie

Concluzia este asemanatoare cu introducerea, dar are rolul invers. Introducerea rezuma primele capitole si deschide lucrarea. Concluzia rezuma ultimele capitole: evaluare, rezultate si discutii.

Profesorul spune ca multi cititori citesc mai intai abstractul, apoi introducerea si concluzia. De aceea concluzia trebuie sa poata convinge cititorul de valoarea lucrarii.

### Structura recomandata pentru concluzie

1. Un paragraf care readuce aminte **solutia** si **problema rezolvata**.
2. Doua-trei paragrafe despre de ce solutia ta este mai buna sau ce aduce in plus.
3. Doua-trei paragrafe cu rezultatele evaluarii / validarii.
4. Un paragraf despre ce ai vrea sa faci mai departe.
5. Un paragraf despre problemele gasite si nerezolvate.
6. Un paragraf despre impactul solutiei.

### Primul paragraf

Nu trebuie sa reiei problema ca in introducere. Trebuie sa spui: aceasta este solutia mea si ea rezolva aceasta problema. Cititorul trebuie sa isi aminteasca imediat ce ai facut si de ce conteaza.

### Comparatia cu alternativele

Daca exista solutii alternative, concluzia trebuie sa spuna unde solutia ta este mai buna:

- viteza;
- acuratete;
- memorie;
- energie;
- cost;
- usurinta de implementare;
- aplicabilitate.

Exemplul din audio: solutia poate folosi mai putini biti, mai putina memorie sau mai putina energie decat o solutie alternativa, pastrand acuratete apropiata.

### Rezultate si validare

Fiecare rezultat mentionat in concluzie trebuie sa arate de ce este important. Profesorul spune ca fiecare propozitie importanta din concluzie trebuie sa manifeste importanta rezultatului.

Validarea nu inseamna intotdeauna experiment numeric. Uneori inseamna ca solutia respecta cerinte sau standarde. Important este sa arati ca solutia este verificata.

### Future work

Partea de lucrari viitoare nu trebuie sa fie doar o lista de dorinte. Fiecare directie viitoare trebuie justificata:

- ce problema ar rezolva;
- ce beneficiu ar aduce;
- de ce este urmatorul pas natural.

Exemplu: nu spui doar "as imbunatati interfata", ci "as imbunatati interfata pentru a atrage mai multi utilizatori".

### Probleme ridicate

Este util sa mentionezi probleme pe care le-ai gasit, dar nu le-ai rezolvat. Acestea pot deveni directii pentru alte lucrari.

Exemplul din audio: daca o anumita varianta de posit nu are acuratete suficienta, concluzia poate ridica intrebarea daca merita folosita sub 16 biti si in ce contexte ar putea totusi fi utila.

---

## Checklist de redactare

- [ ] Abstractul contine domeniu, context, problema, solutie, evaluare si concluzie.
- [ ] Introducerea dezvolta fiecare propozitie din abstract in paragrafe.
- [ ] Problema este formulata clar si este demonstrata ca importanta.
- [ ] Solutiile existente sunt prezentate cu limitele lor.
- [ ] Solutia propusa este explicata ca raspuns la problema.
- [ ] Metodologia de evaluare este anuntata inainte de rezultate.
- [ ] Background-ul aduce cititorul la nivelul necesar.
- [ ] Arhitectura prezinta componentele abstract, ca black boxes.
- [ ] Implementarea explica detaliile tehnice si problemele intampinate.
- [ ] Evaluarea contine setup, parametri, comparatii, rezultate si discutii.
- [ ] Rezultatele sunt interpretate, nu doar listate.
- [ ] Concluzia revine la solutie, rezultate, impact, limitari si future work.

---

## Greseli frecvente de evitat

- Sa scrii abstractul ca o descriere generala, fara rezultat.
- Sa incepi introducerea direct cu implementarea.
- Sa nu explici de ce problema este importanta.
- Sa prezinti tehnologii fara legatura cu problema.
- Sa pui formule sau metode de evaluare abia in capitolul de evaluare, desi ele trebuiau introduse in background.
- Sa intri in cod in capitolul de arhitectura.
- Sa sari peste problemele intampinate in implementare.
- Sa ai evaluare fara parametri si comparatii.
- Sa pui grafice fara discutia impactului.
- Sa scrii concluzia ca o repetare mecanica a introducerii.

---

## Termeni corectati din transcriptul automat

| In transcript poate aparea | Sens corect |
| --- | --- |
| `age devices`, `esti devis`, `aici device` | edge devices |
| `flot`, `float 32`, `floating point` | float / floating point |
| `posit`, `post`, `posti` | format numeric posit |
| `nature tour review`, `literatul review` | literature review |
| `valoare`, `evaluare`, `evoluare` | evaluare / validare, dupa context |
| `RISC 5`, `RIS 5` | RISC-V |
| `CISL` | probabil Chisel |

---

## Unde este textul audio brut

Pentru citire sau verificare, transcriptul complet este aici:

- `transcript-audio-complet.md`

Transcripturi separate:

- `transcripturi-audio/video-1-transcript-audio.md`
- `transcripturi-audio/video-2-transcript-audio.md`
- `transcripturi-audio/video-3-transcript-audio.md`
