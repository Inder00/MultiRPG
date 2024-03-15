Brama = createObject (17951, 1548.3000488281, 736.29998779297, 11.60000038147, 0, 0, 359.25)
function OtworzBrame ()
moveObject ( Brama, 1000, 1548.3000488281, 736.29998779297, 11.60000038147 )
end
addCommandHandler("gc4", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, 1548.3000488281, 736.29998779297, 7.9000000953674 )
end
addCommandHandler("go4", ZamknijBrame )



-- <script src="brama.lua" />