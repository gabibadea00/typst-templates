# typst-templates

Template-uri [Typst](https://typst.app/) pentru lucrări academice la **Facultatea
de Automatică și Calculatoare**, UNSTPB (Politehnica București): lucrare de
licență, disertație/master, teză de doctorat și prezentarea de susținere.

Documentul de lucrare suportă două limbi (`ro` / `en`) și trei departamente
(`cti`, `acse`, `aii`), toate configurate dintr-un singur fișier:
`thesis/config.typ`.

## Quick start

```bash
git clone https://github.com/cs-pub-ro/typst-templates
cd typst-templates
make install      # instalează Typst + fonturile (apt/brew)
make thesis       # -> build/thesis.pdf
make presentation # -> build/presentation.pdf
```

## Comenzi (Makefile)

`make` orchestrează totul; rulează `make help` pentru lista completă.

| Comandă               | Efect                                                        |
| --------------------- | ------------------------------------------------------------ |
| `make install`        | Instalează Typst + fonturile Liberation (detectează OS-ul)   |
| `make thesis`         | Compilează lucrarea → `build/thesis.pdf`                     |
| `make presentation`   | Compilează prezentarea → `build/presentation.pdf`           |
| `make pdf`            | Compilează ambele PDF-uri                                    |
| `make matrix`         | Compilează toate cele 18 combinații de configurare           |
| `make check`          | Suita completă: thesis + matrix + presentation               |
| `make clean`          | Șterge `build/`                                              |

Poți suprascrie configurarea direct din comandă, fără a edita `config.typ`:

```bash
make thesis THESIS_LANG=ro TYPE=master DEPT=acse
```

## Cerințe

- **Typst** `>= 0.13` (`make install` îl instalează; altfel vezi
  [instalare](https://github.com/typst/typst#installation)).
- **Fonturi**: template-ul cere `Times New Roman` și `Courier New`. Fiind
  proprietare, recomandăm familia liberă **Liberation** (metric-compatibilă),
  instalată tot de `make install`. Vezi [Probleme frecvente](#probleme-frecvente).
- **VS Code** + extensia **Tinymist** (`myriad-dreamin.tinymist`) — recomandat
  pentru previzualizare live.
- **Docker / Dev Containers** — opțional, pentru un mediu reproductibil.

## Configurare — `thesis/config.typ`

| Variabilă       | Valori / exemplu                       |
| --------------- | -------------------------------------- |
| `thesis_type`   | `"bachelor"` \| `"master"` \| `"phd"`  |
| `department`    | `"cti"` \| `"acse"` \| `"aii"`         |
| `language`      | `"ro"` \| `"en"`                       |
| `thesis_title`  | titlul lucrării                        |
| `supervisor`    | coordonatorul științific               |
| `student`       | autorul                                |
| `year`          | anul susținerii                        |

Fiecare variabilă poate fi suprascrisă și la compilare cu `--input cheie=valoare`
(mecanism folosit de `make ... THESIS_LANG=...` și de `make matrix`).

## Structura folderelor

```text
typst-templates/
├── Makefile                # comenzi: install / build / check / clean
├── .devcontainer/          # mediu Docker + Nix reproductibil
├── logos/                  # logo-uri universitate / facultate / departamente
├── scripts/                # scripturile apelate de Makefile
├── docs/                   # documentație (ex.: recomandări redactare)
└── thesis/
    ├── config.typ          # configurare + localizare (i18n)
    ├── prelude.typ         # punct central de import
    ├── main.typ            # documentul lucrării
    ├── presentation.typ    # prezentarea (Touying)
    ├── refs.bib            # bibliografie (BibTeX)
    └── chapters/           # capitolele lucrării (+ appendices/)
```

## Cum scrii capitolele

Fiecare capitol e un fișier în `thesis/chapters/`, inclus din `main.typ`. În
partea de sus are un **ghid de redactare comentat** (între `/*` și `*/`) care
**nu apare** în PDF. Citește-l, apoi înlocuiește placeholder-ul
`_[#t("placeholder_fill_chapter")]_` cu textul tău.

Capitolele și secțiunile se **numerotează automat** — nu adăuga manual „1.”,
„1.1”. Folosește `==` pentru subcapitole (→ 1.1) și `===` pentru sub-subcapitole
(→ 1.1.1).

## Figuri, tabele, cod și referințe

```typ
// Figură (caption sub imagine)
#figure(image("../logos/nustpb/PB_logo_ro.svg", width: 6cm), caption: [Descriere])

// Tabel (caption deasupra)
#figure(table(columns: 2, table.header([*A*], [*B*]), [1], [2]), caption: [Descriere])
```

Pentru cod folosește blocuri ` ```limbaj `. Pentru referințe, adaugă intrarea în
`thesis/refs.bib` și citează în text cu `@cheie`; bibliografia (stil IEEE) se
generează automat la final.

## Devcontainer

Repository-ul include un Dev Container care instalează Typst (via Nix) și
fonturile, pentru un build reproductibil. În VS Code: *Reopen in Container*, apoi
`make check`. Din CLI: `devcontainer up --workspace-folder .`.

> Pentru build complet determinist, generează și comite `flake.lock`:
> `cd .devcontainer && nix flake lock`.

## Recomandări de redactare (video)

Recomandările coordonatorului din înregistrările din `videos/` se transcriu cu
`make transcribe`, iar sinteza profesională se află în
[`docs/thesis-writing-guidance/recomandari-redactare-lucrare.md`](docs/thesis-writing-guidance/recomandari-redactare-lucrare.md).

## Probleme frecvente

- **`unknown font family: times new roman / courier new`** — rulează
  `make install`, sau instalează manual `fonts-liberation`, sau folosește
  `typst compile --font-path /cale/fonturi ...`.
- **`failed to load file (access denied)`** — lipsește `--root .` (Makefile-ul îl
  adaugă automat).
- **`failed to download package (...touying...)`** — prima compilare a
  prezentării necesită rețea; pachetele rămân apoi în cache
  (`~/.cache/typst/packages/`).
- **`image contains foreign object`** — avertisment inofensiv de la logo-urile SVG.

## Cum contribui

Creează un branch (`git checkout -b fix/...`), rulează `make check` înainte de
commit, deschide un Pull Request descriind *ce* și *de ce*. Pentru bug-uri,
deschide un *issue* cu pași de reproducere, versiunea Typst și OS-ul.

## License

Vezi [`LICENSE`](LICENSE).
