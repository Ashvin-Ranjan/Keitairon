% いい gets changed to よい when conjugated in any way
ALPHABET = [#sym#] <SpecialAdjective>:<KeiyoushiAdjective>
$adj_ii_conversion$ = {いい}:{よい} ^-> (__ <SpecialAdjective><keiyoushistem>)

% The て form of とう is とうて
ALPHABET = [#sym#] 
$verb_tou_te$ = {う}:{うて} ^-> (と __ <SpecialVerb><GodanVerb><godantestem>)

% The imperative form of くれる is くれ
ALPHABET = [#sym#] ろ:<>
$verb_kureru_imp$ = (くれる<SpecialVerb><IchidanVerb><ichidanstem>) ろ <=> <> 

% The て form of いく is いって
ALPHABET = [#sym#] 
$verb_iku_te$ = {く}:{って} ^-> (い __ <SpecialVerb><GodanVerb><godantestem>)

% The いる gets changed to おる under many circumstances
ALPHABET = [#sym#]
$verb_iru_oru_1$ = {い}:{お} ^-> (__ る<SpecialVerb><IchidanVerb><ichidanstem>[ずぬ])
$verb_iru_oru_2$ = {<SpecialVerb><IchidanVerb><ichidanstem>}:{<GodanVerb><negstem>} ^-> (おる __ [ずぬ])
$verb_iru_oru$ = $verb_iru_oru_1$ || $verb_iru_oru_2$

% The stem of する is し
ALPHABET = [#sym#]
$verb_suru_reg_stem$ = {する}:{し} ^-> (__ <SpecialVerb><IchidanVerb><ichidanstem>)
$verb_suru_passive_stem$ = {する}:{<>} ^-> (__ <SpecialVerb><IchidanVerb><ichidanstem>させる)
$verb_suru_causative_stem$ = {する}:{さ} ^-> (__ <SpecialVerb><IchidanVerb><negstem>れる)
$verb_classical_neg_stem$ = {する}:{せ} ^-> (__ <SpecialVerb><IchidanVerb><ichidanstem>[ずぬ])
$verb_suru_stem$ = $verb_suru_passive_stem$ \
                || $verb_suru_causative_stem$ \
                || $verb_classical_neg_stem$ \
                || $verb_suru_reg_stem$

$special_rules$ = $adj_ii_conversion$ \
               || $verb_tou_te$ \
               || $verb_kureru_imp$ \
               || $verb_iru_oru$ \
               || $verb_iku_te$ \
               || $verb_suru_stem$