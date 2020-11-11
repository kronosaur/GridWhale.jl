#	GridWhale module
#	Copyright (c) 2020 Kronosaur Productions, LLC. All Rights Reserved.
#
#	This file provides functions for interacting with Google Drive.

export GoogleDriveFileResource
export input_resource
export load_resource_as

struct GoogleDriveFileResource
	resID::UInt32
end

function input_resource(res::Type{GoogleDriveFileResource})::GoogleDriveFileResource
	resid::UInt32 = ccall("InputGoogleDriveFile", Cuint, ())
	GoogleDriveFileResource(resid)
end

function load_resource_as(res::GoogleDriveFileResource, mimetype::AbstractString)
	if mimetype == "text/csv"
		rawtable = ccall("LoadResourceAs", Any, (Cuint, Cstring), res.resID, mimetype)

		colCount = size(rawtable, 2)
		rowCount = size(rawtable[2, 1])

		table = DataTable("", 0, 0, [], [])

		for i = 1:colCount
			table[rawtable[1, i]] = rawtable[2, i]
		end

		return table
	else
		return nothing
	end
end
