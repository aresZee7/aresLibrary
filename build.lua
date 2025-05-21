local Library = {}

function Library:Create(Class, Properties)
	local _Instance = (typeof(Class) == "string") and Instance.new(Class) or Class

	if Properties then
		for Property, Value in pairs(Properties) do
            if _Instance[Property] then
			    _Instance[Property] = Value
            end
		end
	end

	return _Instance
end	

return Library
