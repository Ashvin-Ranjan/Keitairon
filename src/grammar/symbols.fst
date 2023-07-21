% Symbols
#kana# = あ-ゖ ア-ヶ
#type# = <GodanVerb><IchidanVerb><PoliteVerb><KeiyoushiAdjective><Noun>
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