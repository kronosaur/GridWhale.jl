#	GridWhale module
#	Copyright (c) 2020 Kronosaur Productions, LLC. All Rights Reserved.
#
#	This file defines types used by GridWhale

export DataTable

mutable struct DataTable
	name::String
	colCount::Int
	rowCount::Int
	columnNames::Array{Symbol,1}
	columnValues::Array{Any,1}
end

function Base.firstindex(table::DataTable)
	return firstindex(table.columnNames)
end

function Base.lastindex(table::DataTable)
	return lastindex(table.columnNames)
end

function Base.getindex(table::DataTable, colindex::Int)
	return getindex(table.columnNames, colindex)
end

function Base.getindex(table::DataTable, colname::Symbol)
	for i = 1:length(table.columnNames)
		if table.columnNames[i] == colname
			return table.columnValues[i]
		end
	end
end

function Base.getindex(table::DataTable, colname::AbstractString)
	Base.getindex(table, Symbol(colname))
end

function Base.setindex!(table::DataTable, colvalues::Any, colname::AbstractString)
	table.colCount = table.colCount + 1;
	table.columnNames = [table.columnNames; [Symbol(colname)]]
	table.columnValues = [table.columnValues; [colvalues]]
	table.rowCount = max(table.rowCount, size(colvalues, 1))
end
