% Symbols
#kana# = あ-ゖ ア-ヶ
#type# = <GodanVerb><IchidanVerb><KeiyoushiAdjective>
#verbmarker# = <godanstem><godannegstem><godanvolstem><estem><ichidanstem><godantestem><godantaconversion>
#adjmarker# = <keiyoushistem>
#marker# = #type# #verbmarker# #adjmarker#
#sym# = #kana# #marker#

% Remove markers
ALPHABET = [#kana#] [#marker#]:<>
$delete_MARKER$ = .*