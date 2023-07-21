% Derivations for verbs to verbs (ichidan)
% Key:
% <potential>: Potential Form
% <causative>: Causative form
% <passive>: Passive Form
% TODO: allow causative-passive form but not passive-causative
$verb_verb_ichidan_deriv$ = (\
    {<potential>}:{<negstem>れる<IchidanVerb>} \
  | {<causative>}:{<negstem>れる<IchidanVerb>} \
  | {<passive>}:{<negstem>せる<IchidanVerb>} \
)

$verb_verb_godan_deriv$ = (\
    {<potential>}:{<estem>る<IchidanVerb>} \
  | {<causative>}:{<negstem>れる<IchidanVerb>} \
  | {<passive>}:{<negstem>せる<IchidanVerb>} \
)

% Derivations for verbs to adjectives (keiyoushi)
% Key:
% <neg>: Plain negative
% <tai>: たい form
$verb_adj_ichidan_deriv$ = (\
    {<neg>}:{<ichidanstem>ない<KeiyoushiAdjective>} \
  | {<tai>}:{<ichidanstem>たい<KeiyoushiAdjective>} \
)

$verb_adj_godan_deriv$ = (\
    {<neg>}:{<negstem>ない<KeiyoushiAdjective>} \
  | {<tai>}:{<godanstem>たい<KeiyoushiAdjective>} \
)

% Derivation for adjectives to adjectives
% Key:
% <neg>: Negative form
$adj_adj_keiyoushi_deriv$ = (\
    {<neg>}:{<keiyoushistem>くない<KeiyoushiAdjective>} \
)

% Derivation for adjectives to nouns
% Key:
% <sanoun>: さ noun form
% <minoun>: み noun form
$adj_noun_keiyoushi_deriv$ = (\
    {<sanoun>}:{<keiyoushistem>さ<Noun>} \
  | {<minoun>}:{<keiyoushistem>み<Noun>} \
)

$deriv_verb_ichidan$ = $verb_ichidan$ $verb_verb_ichidan_deriv$+ \
                     | $verb_godan$ $verb_verb_godan_deriv$+

$deriv_adj_keiyoushi$ = $verb_ichidan$ $verb_adj_ichidan_deriv$ \
                      | $verb_godan$ $verb_adj_godan_deriv$

$deriv_adj_keiyoushi$ = ($deriv_adj_keiyoushi$ | $adj_keiyoushi$) $adj_adj_keiyoushi_deriv$+

$deriv_noun$ = ($deriv_adj_keiyoushi$ | $adj_keiyoushi$) $adj_noun_keiyoushi_deriv$