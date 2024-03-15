Brama = createObject (17951, 1499.5, 761.5, 11.800000190735, 0, 0, 90)
function OtworzBrame ()
moveObject ( Brama, 1000, 1499.5, 761.5, 11.800000190735 )
end
addCommandHandler("gc5", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, 1499.5, 761.5, 7.9000000953674 )
end
addCommandHandler("go5", ZamknijBrame )



-- <script src="brama.lua" />