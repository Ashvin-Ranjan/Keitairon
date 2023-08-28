ALPHABET = [#sym#] 

$iru_stem_filter$ = !([い居]る<SpecialVerb><IchidanVerb><ichidanstem>)

$aru_neg_filter$ = !([あ有]る<SpecialVerb><GodanVerb><negstem>[ぬず])

$filter$ = $iru_stem_filter$ \
        || $aru_neg_filter$