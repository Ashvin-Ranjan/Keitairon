% Inflection rules (Adjectives)
% Key:
% <dict>: Dictionary form
% <neg>: Negative form
% <past>: Past form
% <sanoun>: さ noun form
% <minoun>: み noun form
% <adv>: Adverb form
% <te>: て form
$adj_keiyoushi_infl$ = (\
    {<dict>}:{} \
  | {<neg>}:{<keiyoushistem>くない<KeiyoushiAdjective>} \
  | {<past>}:{<keiyoushistem>かった} \ % TODO: Verb adjective?
  | {<sanoun>}:{<keiyoushistem>さ} \ % TODO: Noun
  | {<minoun>}:{<keiyoushistem>み} \ % TODO: Noun
  | {<adv>}:{<keiyoushistem>く} \
  | {<te>}:{<keiyoushistem>くて} \ % TODO: Combinations
)

$adjective_keiyoushi$ = "lexicon/adjective/adjective_keiyoushi.lex" <KeiyoushiAdjective>

% Keiyoushi adjective changes
% Remove い to make stem | 語幹を作るために「い」を消します
ALPHABET = [#sym#] い:<>
$adj_keiyoushi_stemmation$ = い <=> <> (<KeiyoushiAdjective> <keiyoushistem>)