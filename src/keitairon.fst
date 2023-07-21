#include "grammar/symbols.fst"
#include "grammar/adjective.fst"
#include "grammar/verb.fst"
#include "grammar/verb_helpers.fst"

% Do inflections
$morph$ = ($verb_ichidan$ | $helper_verb_ichidan$) $verb_ichidan_infl$ \
        | ($verb_godan$ | $helper_verb_godan$) $verb_godan_infl$ \
        | $adjective_keiyoushi$ $adj_keiyoushi_infl$ \
        | $helper_noun$

$R$ = $verb_stemmation$ \
   || $adj_stemmation$ \
   || $delete_MARKER$

$morph$ || $R$