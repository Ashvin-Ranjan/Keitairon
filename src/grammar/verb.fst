% Inflection rules (Verbs)
% Key:
% <dict>: Dictionary form
% <nuneg>: Classical negative form (ぬ)
% <pdict>: Polite form
% <ppast>: Polite past form
% <pneg>: Polite negative form
% <pnegpast>: Polite negative past form
% <past>: plain past form
% <zuneg>: Classical negative form (ず) 
% <pvol>: Polite volitional form
% <vol>: Plain volitional form
% <imp>: Imperative form
% <polimp>: Polite imperative form
% <negimp>: Negative imperative form
% <condba>: ば conditional form
% <condtara>: たら conditional form
% <te>: て form
% <stem>: verb stem
$verb_ichidan_infl$ = (\
    {<dict>}:{} \
  | {<nuneg>}:{<ichidanstem>ぬ} \
  | {<pdict>}:{<ichidanstem>ます} \
  | {<ppast>}:{<ichidanstem>ました} \
  | {<pneg>}:{<ichidanstem>ません} \
  | {<pnegpast>}:{<ichidanstem>ませんでした} \
  | {<past>}:{<ichidanstem>た} \
  | {<zuneg>}:{<ichidanstem>ず} \
  | {<pvol>}:{<ichidanstem>ましょう} \
  | {<vol>}:{<ichidanstem>よう} \
  | {<imp>}:{<ichidanstem>ろ} \
  | {<polimp>}:{<ichidanstem>なさい} \
  | {<negimp>}:{な} \
  | {<condba>}:{<estem>ば} \
  | {<condtara>}:{<ichidanstem>たら} \
  | {<stem>}:{<ichidanstem>} \
)

$verb_godan_infl$ = (\
    {<dict>}:{} \
  | {<nuneg>}:{<negstem>ぬ} \
  | {<pdict>}:{<godanstem>ます} \
  | {<ppast>}:{<godanstem>ました} \
  | {<pneg>}:{<godanstem>ません} \
  | {<pnegpast>}:{<godanstem>ませんでした} \
  | {<past>}:{<godantestem><godantaconversion>} \
  | {<zuneg>}:{<negstem>ず} \
  | {<pvol>}:{<godanstem>ましょう} \
  | {<vol>}:{<godanvolstem>う} \
  | {<imp>}:{<estem>} \
  | {<polimp>}:{<godanstem>なさい} \
  | {<negimp>}:{な} \
  | {<condba>}:{<estem>ば} \
  | {<condtara>}:{<godantestem><godantaconversion>ら} \
  | {<te>}:{<godantestem>} \
  | {<stem>}:{<godanstem>} \
)

$verb_ichidan$ = "lexicon/verb/verb_ichidan.lex" <IchidanVerb>
$verb_godan$ = "lexicon/verb/verb_godan.lex" <GodanVerb>
$verb_polite$ = "lexicon/verb/verb_polite.lex" <PoliteVerb>

% Ichidan verb changes
% Remove る to make stem | 語幹を作るために「る」を消します
ALPHABET = [#sym#] る:<>
$verb_ichidan_stemmation$ = る <=> <> (<SpecialVerb>? <IchidanVerb> <ichidanstem>)


% Godan verb changes
% Change the last sound to an い to make stem | 語幹を作るために最後の文字の「う」が「い」に変えます
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[いきぎしちみにびり]
$verb_godan_stemmation$ = [うくぐすつむぬぶる] <=> [いきぎしちみにびり] (<SpecialVerb>? <GodanVerb> <godanstem>)

% Change the last sound to an あ to make stem | 語幹を作るために最後の文字の「う」が「い」に変えます
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[わかがさたまなばら]
$verb_godan_negative_stemmation$ = [うくぐすつむぬぶる] <=> [わかがさたまなばら] (<SpecialVerb>? [<GodanVerb><IchidanVerb><PoliteVerb>] <negstem>)

% Change the last sound to an お to make stem | 語幹を作るために最後の文字の「お」が「い」に変えます
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[おこごそとものぼろ]
$verb_godan_volitional_stemmation$ = [うくぐすつむぬぶる] <=> [おこごそとものぼろ] (<SpecialVerb>? [<GodanVerb><PoliteVerb>] <godanvolstem>)

% Te form conjugation is a bit strange but is regular
ALPHABET = [#sym#]
$verb_godan_te_stemmation$ = [うつる]:{って} \
                           | {す}:{して} \
                           | {く}:{いて} \
                           | {ぐ}:{いで} \
                           | [ぬむぶ]:{んで} ^-> (__ <SpecialVerb>? [<GodanVerb><PoliteVerb>]<godantestem>)

% Change the last sound to an あ to make it past tense
ALPHABET = [#sym#] [てで]:[ただ]
$verb_godan_ta_conversion$ = [てで] <=> [ただ] (<SpecialVerb>? [<GodanVerb><PoliteVerb>] <godantestem> <godantaconversion>)

% Change the last sound to an え to make stem | 語幹を作るために最後の文字の「え」が「い」に変えます
% Used by Ichidan verbs for ば conditional
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[えけげせてめねべれ]
$verb_e_stemmation$ = [うくぐすつむぬぶる] <=> [えけげせてめねべれ] (<SpecialVerb>? [<IchidanVerb><GodanVerb>] <estem>)

% Polite verb changes
% Change る to い to make the stem
ALPHABET = [#sym#] る:い
$verb_polite_stemmation$ = る <=> い (<PoliteVerb> <godanstem>)

% Verb stem rules
$verb_stemmation$ = $verb_ichidan_stemmation$ \
                 || $verb_godan_stemmation$ \
                 || $verb_godan_negative_stemmation$ \
                 || $verb_godan_volitional_stemmation$ \
                 || $verb_godan_te_stemmation$ \
                 || $verb_godan_ta_conversion$ \
                 || $verb_e_stemmation$ \
                 || $verb_polite_stemmation$