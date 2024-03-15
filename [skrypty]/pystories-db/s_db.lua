-- Settings
DBHandler=nil
DBName="db_18945"
DBUser="db_18945"
DBPass="Z5kd42T9"
DBHost="185.30.124.6"

-- Functions
function dbSet(...)
	if not {...} then return end
	local query=dbExec(DBHandler, ...)
	return query
end

function dbGet(...)
	if not {...} then return end
	local query=dbQuery(DBHandler, ...)
	local result=dbPoll(query, -1)
	return result
end

addEventHandler("onResourceStart", resourceRoot, function()
	DBHandler=dbConnect("mysql", "dbname="..DBName..";host="..DBHost.."", DBUser, DBPass, "share=1")
	if DBHandler then
		outputDebugString("* Connect to server MYSQL...")
	else
		outputDebugString("* No Connecting to server MYSQL..")
	end
end)