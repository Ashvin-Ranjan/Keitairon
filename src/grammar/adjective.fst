% Inflection rules (Adjectives)
% Key:
% <dict>: Dictionary form
% <past>: Past form
% <adv>: Adverb form
% <te>: て form
% <condba>: ば conditional form
% <condtara>: たら conditional form
$adj_keiyoushi_infl$ = (\
    {<dict>}:{} \
  | {<past>}:{<keiyoushistem>かった} \
  | {<adv>}:{<keiyoushistem>く} \
  | {<te>}:{<keiyoushistem>くて} \
  | {<condba>}:{<keiyoushistem>ければ} \
  | {<condtara>}:{<keiyoushistem>かったら} \
)

$adj_keiyoushi$ = "lexicon/adjective/adj_keiyoushi.lex" <KeiyoushiAdjective>

% Keiyoushi adjective changes
% Remove い to make stem | 語幹を作るために「い」を消します
ALPHABET = [#sym#] い:<>
$adj_keiyoushi_stemmation$ = い <=> <> (<KeiyoushiAdjective> <keiyoushistem>)

$adj_stemmation$ = $adj_keiyoushi_stemmation$