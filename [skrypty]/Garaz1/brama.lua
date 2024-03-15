Brama = createObject (17951, 1423.4000244141, 683.79998779297, 11.60000038147, 0, 0, 0)
function OtworzBrame ()
moveObject ( Brama, 1000, 1423.4000244141, 683.79998779297, 11.60000038147 )
end
addCommandHandler("gc3", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, 1423.4000244141, 683.79998779297, 8 )
end
addCommandHandler("go3", ZamknijBrame )



-- <script src="brama.lua" />