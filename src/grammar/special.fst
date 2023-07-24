% いい gets changed to よい when conjugated in any way
ALPHABET = [#sym#] <SpecialAdjective>:<KeiyoushiAdjective>
$adj_ii_conversion$ = {いい}:{よい} ^-> (__ <SpecialAdjective><keiyoushistem>)

% The て form of とう is とうて
ALPHABET = [#sym#] 
$verb_tou_te$ = {う}:{うて} ^-> (と __ <SpecialVerb><GodanVerb><godantestem>)

% The imperative form of くれる is くれ
ALPHABET = [#sym#] ろ:<>
$verb_kureru_imp$ = (くれる<SpecialVerb><IchidanVerb><ichidanstem>) ろ <=> <> 

$special_rules$ = $adj_ii_conversion$ \
               || $verb_tou_te$ \
               || $verb_kureru_imp$ 