% Derivations for verbs to verbs (ichidan)
% Key:
% <potential>: Potential Form
% <causative>: Causative form
% <passive>: Passive Form
% <causpass>: Causative-Passive Form
$verb_verb_ichidan_deriv$ = (\
    {<potential>}:{<negstem>れる<IchidanVerb>} \
  | {<causative>}:{<ichidanstem>させる<IchidanVerb>} \
  | {<passive>}:{<negstem>れる<IchidanVerb>} \
  | {<causpass>}:{<ichidanstem>させれる<IchidanVerb>} \
)

$verb_verb_godan_deriv$ = (\
    {<potential>}:{<estem>る<IchidanVerb>} \
  | {<causative>}:{<negstem>せる<IchidanVerb>} \
  | {<passive>}:{<negstem>れる<IchidanVerb>} \
  | {<causpass>}:{<negstem>せれる<IchidanVerb>} \
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
$adj_aru_keiyoushi_deriv$ = (\
    {<neg>}:{<keiyoushistem>くある<SpecialVerb><GodanVerb>} \
)
$aru_adj_keiyoushi_deriv$ = (\
    {<dict>}:{<negstem>ない<KeiyoushiAdjective>} \
)
$aru_keiyoushi_infl$ = (\
    {<pdict>}:{<godanstem>ません} \
  | {<ppast>}:{<godanstem>ませんでした} \
)
$adj_adj_keiyoushi_deriv$ = $adj_aru_keiyoushi_deriv$ $aru_adj_keiyoushi_deriv$

% Derivation for adjectives to nouns
% Key:
% <sanoun>: さ noun form
% <minoun>: み noun form
$adj_noun_keiyoushi_deriv$ = (\
    {<sanoun>}:{<keiyoushistem>さ<Noun>} \
  | {<minoun>}:{<keiyoushistem>み<Noun>} \
  | {<minoun>}:{<keiyoushistem>味<Noun>} \
)

$full_verb_ichidan$ = $verb_ichidan$ \
                    | $verb_suru$ \
                    | $helper_verb_ichidan$

$verb_godan_collection$ = $verb_godan$ \
                        | $helper_verb_godan$

$deriv_verb_ichidan$ = $full_verb_ichidan$ $verb_verb_ichidan_deriv$ \
                     | $verb_godan_collection$ $verb_verb_godan_deriv$

$full_verb_ichidan$ = $full_verb_ichidan$ \
                    | $deriv_verb_ichidan$

$deriv_adj_keiyoushi$ = $full_verb_ichidan$ $verb_adj_ichidan_deriv$ \
                      | $verb_godan_collection$ $verb_adj_godan_deriv$

$deriv_adj_keiyoushi$ = $deriv_adj_keiyoushi$ ($adj_aru_keiyoushi_deriv$ $aru_adj_keiyoushi_deriv$)* \
                      | $adj_keiyoushi$ ($adj_aru_keiyoushi_deriv$ $aru_adj_keiyoushi_deriv$)+

$deriv_aru_keiyoushi$ = $deriv_adj_keiyoushi$ $aru_adj_keiyoushi_deriv$ $aru_keiyoushi_infl$ \
                      | $adj_keiyoushi$ $aru_adj_keiyoushi_deriv$ $aru_keiyoushi_infl$ \

$deriv_noun$ = ($deriv_adj_keiyoushi$ | $adj_keiyoushi$) $adj_noun_keiyoushi_deriv$