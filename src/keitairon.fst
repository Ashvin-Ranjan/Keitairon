% Setup
#kana# = あ-ゖ ア-ヶ
#type# = <GodanVerb><IchidanVerb><KeiyoushiAdjective>
#stemmarker# = <godanstem><godannegstem><godanvolstem><estem><ichidanstem><ichidante>
#marker# = #type# #stemmarker#
#sym# = #kana# #marker#

% Inflection rules (Verbs)
$verb_ichidan_infl$ = (\
  | {<dict>}:{} \
  | {<ppast>}:{<ichidanstem>ました} \
  | {<pdict>}:{<ichidanstem>ます} \
  | {<past>}:{<ichidante>た} \
  | {<zuneg>}:{<ichidanstem>ず} \
  | {<pvol>}:{<ichidanstem>ましょう} \
  | {<vol>}:{<ichidanstem>よう} \
  | {<imp>}:{<ichidanstem>ろ} \
  | {<condba>}:{<estem>ば} \
  | {<condtara>}:{<ichidante>たら} \
)

$verb_godan_infl$ = (\
  | {<dict>}:{} \
  | {<ppast>}:{<godanstem>ました} \
  | {<pdict>}:{<godanstem>ます} \
  | {<zuneg>}:{<godannegstem>ず} \
  | {<pvol>}:{<godannegstem>ましょう} \
  | {<vol>}:{<godanvolstem>う} \
  | {<imp>}:{<estem>} \
  | {<condba>}:{<estem>ば} \
)

% Inflection rules (Adjectives)
% TODO

% Get all of the lexicon files
$verb_ichidan$ = "lexicon/verb/verb_ichidan.lex" <IchidanVerb>
$verb_godan$ = "lexicon/verb/verb_godan.lex" <GodanVerb>
$adjective_keiyoushi$ = "lexicon/adjective/adjective_keiyoushi.lex" <KeiyoushiAdjective>


% Do inflections
$morph$ = $verb_ichidan$ $verb_ichidan_infl$ |\
          $verb_godan$ $verb_godan_infl$

% Ichidan verb changes
% Remove る to make stem | 語幹を作るために「る」を消します
ALPHABET = [#sym#] る:<>
$verb_ichidan_stemmation$ = る <=> <> (<IchidanVerb> [<ichidanstem><ichidante>])


% Godan verb changes
% Change the last sound to an い to make stem | 語幹を作るために最後の文字の「う」が「い」に変えます
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[いきぎしちみにびり]
$verb_godan_stemmation$ = [うくぐすつむぬぶる] <=> [いきぎしちみにびり] (<GodanVerb> <godanstem>)

% Change the last sound to an あ to make stem | 打消しの語幹を作るために最後の文字の「う」が「い」に変えます
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[わかがさたまなばら]
$verb_godan_negative_stemmation$ = [うくぐすつむぬぶる] <=> [わかがさたまなばら] (<GodanVerb> <godannegstem>)

% Change the last sound to an お to make stem | 打消しの語幹を作るために最後の文字の「う」が「い」に変えます
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[おこごそとものぼろ]
$verb_godan_volitional_stemmation$ = [うくぐすつむぬぶる] <=> [おこごそとものぼろ] (<GodanVerb> <godanvolstem>)

% Change the last sound to an え to make stem | 打消しの語幹を作るために最後の文字の「う」が「い」に変えます
% Used by Ichidan verbs for ば conditional
ALPHABET = [#sym#] [うくぐすつむぬぶる]:[えけげせてめねべれ]
$verb_e_stemmation$ = [うくぐすつむぬぶる] <=> [えけげせてめねべれ] ([<IchidanVerb><GodanVerb>] <estem>)

% Remove markers
ALPHABET = [#kana#] [#marker#]:<>
$delete_MARKER$ = .*

$R$ = $verb_ichidan_stemmation$ \
   || $verb_godan_stemmation$ \
   || $verb_godan_negative_stemmation$ \
   || $verb_godan_volitional_stemmation$ \
   || $verb_e_stemmation$
   || $delete_MARKER$

$morph$ || $R$