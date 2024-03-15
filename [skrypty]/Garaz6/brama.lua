Brama = createObject (17951, 1492.6999511719, 761.5, 11.800000190735, 0, 0, 90)
function OtworzBrame ()
moveObject ( Brama, 1000, 1492.6999511719, 761.5, 11.800000190735 )
end
addCommandHandler("gc6", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, 1492.6999511719, 761.5, 7.8000001907349 )
end
addCommandHandler("go6", ZamknijBrame )



-- <script src="brama.lua" />