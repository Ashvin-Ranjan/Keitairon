#include "grammar/symbols.fst"
#include "grammar/adjective.fst"
#include "grammar/verb.fst"

% Do inflections
$morph$ = $verb_ichidan$ $verb_ichidan_infl$ \
        | $verb_godan$ $verb_godan_infl$ \
        | $adjective_keiyoushi$ $adj_keiyoushi_infl$

$R$ = $verb_ichidan_stemmation$ \
   || $verb_godan_stemmation$ \
   || $verb_godan_negative_stemmation$ \
   || $verb_godan_volitional_stemmation$ \
   || $verb_godan_te_stemmation$ \
   || $verb_godan_ta_conversion$ \
   || $verb_e_stemmation$ \
   || $adj_keiyoushi_stemmation$ \
   || $delete_MARKER$

$morph$ || $R$