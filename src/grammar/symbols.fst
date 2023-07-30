% Symbols
#kana# = あ-ゖ ア-ヶ% 一-龯 㐀-䶿 
#type# = <GodanVerb><IchidanVerb><PoliteVerb><SpecialVerb><KeiyoushiAdjective><SpecialAdjective><Noun>
#verbmarker# = <godanstem><godanvolstem><godantestem><godantaconversion> \
               <estem><negstem> \
               <ichidanstem> \
               <politestem>
#adjmarker# = <keiyoushistem>
#marker# = #type# #verbmarker# #adjmarker#
#sym# = #kana# #marker#

% Remove markers
ALPHABET = [#kana#] [#marker#]:<>
$delete_MARKER$ = .*