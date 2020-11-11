#	GridWhale module
#	Copyright (c) 2020 Kronosaur Productions, LLC. All Rights Reserved.
#
#	This file provides functions for interacting with the Canvas port. It is 
#	part of the GridWhale module.

module Canvas

function beginpath()
	ccall("CanvasBeginPath", Cvoid, ())
end

function closepath()
	ccall("CanvasClosePath", Cvoid, ())
end

function fill()
	ccall("CanvasFill", Cvoid, ())
end

function lineto(x::Real, y::Real)
	ccall("CanvasLineTo", Cvoid, (Cdouble, Cdouble), x, y)
end

function moveto(x::Real, y::Real)
	ccall("CanvasMoveTo", Cvoid, (Cdouble, Cdouble), x, y)
end

function stroke()
	ccall("CanvasStroke", Cvoid, ())
end

function setfillstyle(style::AbstractString)
	ccall("CanvasFillStyle", Cvoid, (Cstring, ), style)
end

function setstrokestyle(style::AbstractString)
	ccall("CanvasStrokeStyle", Cvoid, (Cstring, ), style)
end

end