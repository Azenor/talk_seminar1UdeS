---
title: Effets de la température sur la régulation trophique
subtitle: Séminaire 1
author: |
  | \textbf{Azenor Bideault}
  | Superviseurs: Dominique Gravel & Michel Loreau \newline
institute: Université de Sherbooke
date: \today
language: francais
---

## Température: gradient environnemental majeur
\centering
Température annuelle moyenne
\includegraphics[width=1\linewidth]{figuresAz/AnmeanTempST.pdf}
\smallcitation{Données de Worldclim}

## Effets de la température
\begincols
  \column{0.48\textwidth}
  \centering
    Taux métabolique \par
    \includegraphics[width=0.4\linewidth]{figuresAz/cell.png}\par
    \vspace{1cm}
    \pause
    Taux biologiques (taux de croissance) \par
    \includegraphics[width=0.5\linewidth]{figuresAz/fish_pop.pdf}
    \pause
  \hfill\column{0.48\textwidth}
    \centering
    Taille corporelle \par
      \includegraphics[width=0.6\linewidth]{figuresAz/size.pdf}\par
      \vspace{1cm}
      \pause
      Distribution des espèces \par
      \includegraphics[width=0.8\linewidth]{figuresAz/world.pdf} \par

\stopcols


## Effets des interactions trophiques à l'échelle du paysage

\centering
  \includegraphics[width=0.7\linewidth]{figuresAz/estes2011.png}\par
\smallcitation{Estes \textit{et al} 2011}


## Effets de la température sur la régulation trophique
\centering
  \input{figuresAz/schema2.tex}\par


## Effets de la température sur la régulation trophique

\centering
\input{figuresAz/schemaFlGrasse.tex}\par
\smallcitation{Beveridge et al 2010, Kratina et al 2012, Shurin et al 2012}

## Effets de la température sur la régulation trophique

\input{figuresAz/schemaSC.tex}\par
\smallcitation{Vasseur \& McCann 2005, Brose et al 2012, Fussman et al 2014}

## Force nette d'interaction

\centering
\input{figuresAz/schema_FNI1.tex}\par

## Stabilité: taux de retour à l'équilibre

\begincols
\column{0.48\textwidth}

\centering
\includegraphics[width=1\linewidth]{figuresAz/stab.pdf}

\hfill\column{0.48\textwidth}

  - Perturbations ponctuelles: épidémies, feux, inondations...
  - Taux de retour $\tau$

\stopcols

## Objectif
\centering
\Large{\textcolor{plST}{Comprendre de façon méchanistique les effets de la température sur la régulation trophique et la structure des réseaux afin de formaliser la théorie}} \par

\large{En combinant des approches théoriques et expérimentales}

## Relation régulation trophique - température
\input{figuresAz/schemaChap.tex}

# Tester expérimentalement la \mbox{théorie:} relation température - régulation trophique

## Approche quantitative

\centering
\input{figuresAz/schema_phd1.tex}\par

## Approche quantitative

\centering
\input{figuresAz/schema_phdColor.tex}\par

## La température impacte les taux biologiques des organismes

\centering
\input{figuresAz/schema_ITbis.tex}


## Effet de la température sur les taux biologiques

\begincols
\column{0.48\textwidth}

\centering
\includegraphics[width=1\linewidth]{figuresAz/MTE.pdf}

\hfill\column{0.48\textwidth}

$$
	r(T)= r_0 \textbf{m}^{\beta} exp^{\biggl(-\dfrac{\textbf{E}}{k\textbf{T}}\biggr)}\mathlarger{L}(T)
$$

&nbsp;

$r(T)$
: taux biologique

$m$
: masse corporelle

$E$
: énergie d'activation

$T$
: température

$L(T)$
: phase décroissante

$\beta$, $r_0$, $k$
: constantes

\stopcols
\smallcitation{Gillooly et al 2001, Brown et al 2004, Savage et al 2004, Pawar et al 2015}


## La force nette d'interaction suit la même relation unimodale

\begincols
  \column{.48\textwidth}
\centering
\input{figuresAz/schema_ITbisSansTextBracket.tex}
\column{.48\textwidth}
\centering  \includegraphics[width=1\linewidth]{figuresAz/NetIS.pdf}

\stopcols

## Tester expérimentalement la théorie

\centering
\input{figuresAz/schema_phd1.tex}\par


## Modèle d'étude: Interactions bactéries-protistes

\begincols
\column{0.48\textwidth}

\centering  \includegraphics[width=0.7\linewidth]{figuresAz/pitcher.jpg}

\hfill\column{0.48\textwidth}

- Sarracénies pourpres (\textit{Sarracenia purpurea})
- Protistes-Bactéries
- Expériences en microcosmes
- 5 souches de bactéries, 3 espèces de protistes
- Gradient de températures (10-40$^\circ$C )

\stopcols


## Méthode: Cinétique des bactéries et réponse fonctionnelle des protistes

\begincols
  \column{.5\textwidth}
    \centering
    \input{figuresAz/schema_phdParam.tex}\par

  \hfill\column{.5\textwidth}

  Bactéries:

  - taux de croissance
  - capacité de support

  &nbsp;

  Protistes:

  - taux d'attaque
  - temps de manipulation

  &nbsp;

  Le long d'un gradient de température
\stopcols

## Cinétique des bactéries: croissance logistique
\begincols
  \column{.48\textwidth}
  \centering
  \includegraphics[width=1\linewidth]{figuresAz/logistic.pdf}

  \hfill\column{.48\textwidth}
  $$ B(t) = \dfrac{KB_0 e^{rt}}{K+B_0( e^{rt}-1)}$$

  &nbsp;

  $B(t)$
  : densité de bactéries

  $B_0$
  : densité de bactéries initiale

  &nbsp;

  r
  : taux de croissance

  K
  : capacité de support

\stopcols


## Réponse fonctionnelle des protistes: Holling type II
\begincols
  \column{.48\textwidth}
    \centering
  \includegraphics[width=1\linewidth]{figuresAz/repfonc.pdf}

  \hfill\column{.48\textwidth}
  $$ f(B) = \dfrac{aB}{1+ahB}$$

  &nbsp;

  $f(B)$
  : nombre de bactéries consommées

  $B$
  : densité de bactéries

  &nbsp;

  a
  : taux d'attaque

  h
  : temps de manipulation

\stopcols


## Régulation trophique

\centering
\input{figuresAz/schema_phdFNISTAB.tex}\par


## Force nette d'interaction

\begincols
  \column{.5\textwidth}
    \centering
    \input{figuresAz/schema_FNI.tex}\par

  \hfill\column{.5\textwidth}

  \centering
Force nette d'interaction
$$
\mathlarger{\dfrac{B^*_0}{B^*_P}}
$$
\stopcols

## Stabilité du système
\begincols
\column{0.48\textwidth}

\centering
\includegraphics[width=1\linewidth]{figuresAz/disequ.pdf}

\hfill\column{0.48\textwidth}

  - Perturbation ponctuelle: mortalité densité indépendante
  - Taux de retour: pente
  - Extinction

\stopcols

## Résultats attendus

\begincols
  \column{.48\textwidth}
\centering
Taux biologiques
\includegraphics[width=1.1\linewidth]{figuresAz/MTE.pdf}
\pause
\column{.48\textwidth}
\centering
Force nette d'interaction
\includegraphics[width=1.1\linewidth]{figuresAz/NetIS.pdf}
\stopcols

## Résultats attendus
\centering
Stabilité du système \par
\includegraphics[width=0.7\linewidth]{figuresAz/stabFinal.pdf}

## Approche quantitative: modélisation et expérimentations

\begincols
  \column{.40\textwidth}
\centering
  \input{figuresAz/schema_phd1.tex}\par
\column{.50\textwidth}
\includegraphics[width=1.2\linewidth]{figuresAz/yx.pdf}
\stopcols

## Perspectives: Modèle multi-trophique
\centering
\input{figuresAz/schemaChapFinal.tex}\par


## Merci de votre attention
\centering
"An ecologist is often balancing the search for simplifying theories with the recognition of the complexity of nature"

\hfill \textit{Charles Elton}
