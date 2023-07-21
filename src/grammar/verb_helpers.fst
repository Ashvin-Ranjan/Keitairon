% Generate all stems
$helper_stems$ = $verb_ichidan$ <ichidanstem> \
               | $verb_godan$ <godanstem>

$helper_verb_ichidan$ = $helper_stems$ "lexicon/verb/helpers/verb_ichidan.lex" <IchidanVerb>
$helper_verb_godan$ = $helper_stems$ "lexicon/verb/helpers/verb_godan.lex" <GodanVerb>
$helper_noun$ = $helper_stems$ "lexicon/verb/helpers/noun.lex" <Noun>