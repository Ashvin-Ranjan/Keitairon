% Inflection rules (Verbs)
% Key:
% <dict>: Dictionary form
% <neg>: Plain negative form
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
% <negimp>: Negative Imperative form
% <condba>: ば conditional form
% <condtara>: たら conditional form
% <potential>: Potential form
% <tai>: たい form
% <te>: て form
$verb_ichidan_infl$ = (\
    {<dict>}:{} \ % TODO: Verb adjective?
  | {<neg>}:{<ichidanstem>ない<KeiyoushiAdjective>} \
  | {<nuneg>}:{<ichidanstem>ぬ} \ % TODO: Verb adjective?
  | {<pdict>}:{<ichidanstem>ます} \
  | {<ppast>}:{<ichidanstem>ました} \
  | {<pneg>}:{<ichidanstem>ません} \
  | {<pnegpast>}:{<ichidanstem>ませんでした} \
  | {<past>}:{<ichidanstem>た} \ % TODO: Verb adjective?
  | {<zuneg>}:{<ichidanstem>ず} \
  | {<pvol>}:{<ichidanstem>ましょう} \
  | {<vol>}:{<ichidanstem>よう} \
  | {<imp>}:{<ichidanstem>ろ} \
  | {<negimp>}:{な} \
  | {<condba>}:{<estem>ば} \
  | {<condtara>}:{<ichidanstem>たら} \
  | {<potential>}:{<ichidanstem>られる<IchidanVerb>} \
  | {<tai>}:{<ichidanstem>たい<KeiyoushiAdjective>} \
  | {<te>}:{<ichidanstem>て} \
)

$verb_godan_infl$ = (\
    {<dict>}:{} \ % TODO: Verb adjective?
  | {<neg>}:{<godannegstem>ない<KeiyoushiAdjective>} \
  | {<nuneg>}:{<godannegstem>ぬ} \ % TODO: Verb adjective?
  | {<pdict>}:{<godanstem>ます} \
  | {<ppast>}:{<godanstem>ました} \
  | {<pneg>}:{<godanstem>ません} \
  | {<pnegpast>}:{<godanstem>ませんでした} \
  | {<past>}:{<godantestem><godantaconversion>} \ % TODO: Verb adjective?
  | {<zuneg>}:{<godannegstem>ず} \
  | {<pvol>}:{<godanstem>ましょう} \
  | {<vol>}:{<godanvolstem>う} \
  | {<imp>}:{<estem>} \
  | {<negimp>}:{な} \
  | {<condba>}:{<estem>ば} \
  | {<condtara>}:{<godantestem><godantaconversion>ら} \
  | {<potential>}:{<estem>る<IchidanVerb>} \
  | {<tai>}:{<godanstem>たい<KeiyoushiAdjective>} \
  | {<te>}:{<godantestem>} \
)

$verb_ichidan$ = "lexicon/verb/verb_ichidan.lex" <IchidanVerb>
$verb_godan$ = "lexicon/verb/verb_godan.lex" <GodanVerb>

% Ichidan verb changes
% Remove る to make stem | 語幹を作るために「る」を消します
ALPHABET = [#sym#] る:<>
$verb_ichidan_stemmation$ = る <=> <> (<IchidanVerb> <ichidanstem>)


% Godan verb changes
% Change the last sound to an い to make stem | 語幹を作るために最後の文字の「う」が「い」に変えます
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[いきぎしちみにびり]
$verb_godan_stemmation$ = [うくぐすつむぬぶる] <=> [いきぎしちみにびり] (<GodanVerb> <godanstem>)

% Change the last sound to an あ to make stem | 語幹を作るために最後の文字の「う」が「い」に変えます
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[わかがさたまなばら]
$verb_godan_negative_stemmation$ = [うくぐすつむぬぶる] <=> [わかがさたまなばら] (<GodanVerb> <godannegstem>)

% Change the last sound to an お to make stem | 語幹を作るために最後の文字の「お」が「い」に変えます
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[おこごそとものぼろ]
$verb_godan_volitional_stemmation$ = [うくぐすつむぬぶる] <=> [おこごそとものぼろ] (<GodanVerb> <godanvolstem>)

% Te form conjugation is a bit strange but is regular
ALPHABET = [#sym#]
$verb_godan_te_stemmation$ = [うつる]:{って} \
                           | {す}:{して} \
                           | {く}:{いて} \
                           | {ぐ}:{いで} \
                           | [ぬむぶ]:{んで} ^-> (__ <GodanVerb><godantestem>)

% Change the last sound to an あ to make it past tense
ALPHABET = [#sym#] [てで]:[ただ]
$verb_godan_ta_conversion$ = [てで] <=> [ただ] (<GodanVerb> <godantestem> <godantaconversion>)

% Change the last sound to an え to make stem | 語幹を作るために最後の文字の「え」が「い」に変えます
% Used by Ichidan verbs for ば conditional
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[えけげせてめねべれ]
$verb_e_stemmation$ = [うくぐすつむぬぶる] <=> [えけげせてめねべれ] ([<IchidanVerb><GodanVerb>] <estem>)

% Verb stem rules
$verb_stemmation$ = $verb_ichidan_stemmation$ \
                 || $verb_godan_stemmation$ \
                 || $verb_godan_negative_stemmation$ \
                 || $verb_godan_volitional_stemmation$ \
                 || $verb_godan_te_stemmation$ \
                 || $verb_godan_ta_conversion$ \
                 || $verb_e_stemmation$