% いい gets changed to よい when conjugated in any way
ALPHABET = [#sym#] <SpecialAdjective>:<KeiyoushiAdjective>
$adj_ii_conversion$ = {いい}:{よい} | {いい}:{良い} ^-> (__ <SpecialAdjective><keiyoushistem>)

% The て form of とう is とうて
ALPHABET = [#sym#] 
$verb_tou_te_kana$ = {う}:{うて} ^-> (と __ <SpecialVerb><GodanVerb><godantestem>)
$verb_tou_te_kanji$ = {う}:{うて} ^-> (問 __ <SpecialVerb><GodanVerb><godantestem>)
$verb_tou_te$ = $verb_tou_te_kana$ \
             || $verb_tou_te_kanji$

% The imperative form of くれる is くれ
ALPHABET = [#sym#] ろ:<>
$verb_kureru_imp_kana$ = (くれる<SpecialVerb><IchidanVerb><ichidanstem>) ろ <=> <> 
$verb_kureru_imp_kanji$ = (呉れる<SpecialVerb><IchidanVerb><ichidanstem>) ろ <=> <> 
$verb_kureru_imp$ = $verb_kureru_imp_kana$ \
                 || $verb_kureru_imp_kanji$

% The て form of いく is いって
ALPHABET = [#sym#] 
$verb_iku_te_kana$ = {く}:{って} ^-> (い __ <SpecialVerb><GodanVerb><godantestem>)
$verb_iku_te_kanji$ = {く}:{って} ^-> (行 __ <SpecialVerb><GodanVerb><godantestem>)
$verb_iku_te$ = $verb_iku_te_kana$ \
              || $verb_iku_te_kanji$

% The いる gets changed to おる under many circumstances
ALPHABET = [#sym#]
$verb_iru_oru_1$ = {い}:{お} ^-> (__ る<SpecialVerb><IchidanVerb><ichidanstem>[ずぬ])
$verb_iru_oru_2$ = {<SpecialVerb><IchidanVerb><ichidanstem>}:{<GodanVerb><negstem>} ^-> ((お|居)る __ [ずぬ])
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

% The plain negative form of ある is ない
ALPHABET = [#sym#]
$verb_aru_neg_stem$ = {ある}:{<>} | {有る}:{<>} ^-> (__ <SpecialVerb><GodanVerb><negstem>ない)

% くる has many strange conjugations
ALPHABET = [#sym#]
$verb_kuru_reg_stem$ = {くる}:{き} ^-> (__ <SpecialVerb><GodanVerb><godanstem>)
$verb_kuru_te_stem$ = {くる}:{きて} ^-> (__ <SpecialVerb><GodanVerb><godantestem>)
$verb_kuru_neg_stem$ = {くる}:{こ} ^-> (__ <SpecialVerb><GodanVerb><negstem>)
$verb_kuru_potential_stem$ = {くる}:{こられ} ^-> (__ <SpecialVerb><GodanVerb><estem>る<IchidanVerb>)
$verb_kuru_causative_stem$ = {くる}:{こら} ^-> (__ <SpecialVerb><GodanVerb><negstem>れる<IchidanVerb>)
$verb_kuru_passive_stem$ = {くる}:{こさ} ^-> (__ <SpecialVerb><GodanVerb><negstem>せる<IchidanVerb>)
$verb_kuru_imp$ = {くる}:{こい} ^-> (__ <SpecialVerb><GodanVerb><estem>)
$verb_kuru_ba$ = {くる}:{くれ} ^-> (__ <SpecialVerb><GodanVerb><estem>ば)
$verb_kuru_vol_stem$ = {くる}:{こよ} ^-> (__ <SpecialVerb><GodanVerb><godanvolstem>う)
$verb_kuru_imp_kanji$ = {ろ}:{い} ^-> (__ <SpecialVerb><IchidanVerb>来る<ichidanstem>)
$verb_kuru_stem$ = $verb_kuru_passive_stem$ \
                || $verb_kuru_causative_stem$ \
                || $verb_kuru_potential_stem$ \
                || $verb_kuru_neg_stem$ \
                || $verb_kuru_te_stem$ \
                || $verb_kuru_reg_stem$ \
                || $verb_kuru_vol_stem$ \
                || $verb_kuru_ba$ \
                || $verb_kuru_imp$ \
                || $verb_kuru_imp_kanji$

$special_rules$ = $adj_ii_conversion$ \
               || $verb_tou_te$ \
               || $verb_kureru_imp$ \
               || $verb_iru_oru$ \
               || $verb_iku_te$ \
               || $verb_suru_stem$ \
               || $verb_aru_neg_stem$ \
               || $verb_kuru_stem$