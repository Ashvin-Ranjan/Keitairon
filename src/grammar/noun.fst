$noun_suru$ = "lexicon/noun/noun_suru.lex" <Noun>
$noun$ = "lexicon/noun/noun.lex" <Noun>

$full_noun$ = $noun_suru$ \
            | $noun$

$ka_noun$ = $full_noun$ か <Noun>

$verb_suru$ = ($noun_suru$ | $ka_noun$) する <SpecialVerb> <IchidanVerb>

% Noun conjugations
% Key:
% <dict>: Dictionary form
% <nashi>: 無し conjugation
$noun_infl$ = (\
    {<dict>}:{} \
  | {<nashi>}:{なし} \
)