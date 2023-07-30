#include "grammar/symbols.fst"
#include "grammar/adjective.fst"
#include "grammar/verb.fst"
#include "grammar/noun.fst"
#include "grammar/verb_helpers.fst"
#include "grammar/special.fst"
#include "grammar/derivation.fst"

% Combine all of the different derivations together
% Full Ichidan and Godan list
$full_verb_ichidan$ = $verb_ichidan$ \
                    | $helper_verb_ichidan$ \
                    | $deriv_verb_ichidan$ \
                    | $verb_suru$

$full_verb_godan$ = $verb_godan$ \
                  | $helper_verb_godan$ \
                  | $verb_polite$

% Full noun list
$full_noun$ = $helper_noun$ \
            | $deriv_noun$ \
            | $noun_suru$ \
            | $ka_noun$ \
            | $noun$

% Full Keiyoushi adjective list
$full_adj_keiyoushi$ = $adj_keiyoushi$ \
                     | $deriv_adj_keiyoushi$ \
                     | いい <SpecialAdjective>

% Do inflections
$morph$ = $full_verb_ichidan$ $verb_ichidan_infl$ \
        | $full_verb_godan$ $verb_godan_infl$ \
        | $full_adj_keiyoushi$ $adj_keiyoushi_infl$ \
        | $full_noun$ $noun_infl$

$R$ = $special_rules$ \
   || $verb_stemmation$ \
   || $adj_stemmation$ \
   || $delete_MARKER$

$morph$ || $R$