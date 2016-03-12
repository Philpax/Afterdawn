-- Return paths relative to where vespertine is
function RerootPath(path)
	return "vespertine/" .. path
end

function RerootPaths(paths)
	ret = {}
	for _, v in pairs(paths) do
		table.insert(ret, RerootPath(v))
	end
	return ret
end

solution "Afterdawn"
	configurations { "Debug", "Release" }

	-- Include the vespertine project in this solution
	include "vespertine/premake5.lua"

	project "Afterdawn"
		kind "WindowedApp"
		language "C++"
		targetdir "bin/%{cfg.buildcfg}"
		debugdir "bin/%{cfg.buildcfg}"

		includedirs(RerootPaths(VENDOR_INCLUDES))
		includedirs { "vespertine/include/", "include/" }
		files { "include/**.hpp", "src/**.cpp" }
		flags { "FatalWarnings", "WinMain", "Symbols" }
		exceptionhandling "Off"
		rtti "Off"

		links { "Vespertine", "dxgi", "d3d11", "d3dcompiler" }
		links(RerootPaths(VENDOR_LINKS))
		postbuildcommands 
		{ 
			[[{COPY} %{RerootPath "data"} bin/%{cfg.buildcfg}/data]] 
		}

		filter "configurations:Debug"
			defines { "DEBUG" }
			flags { "Symbols" }

		filter "configurations:Release"
			defines { "NDEBUG" }
			optimize "On"

		configuration { "vs*" }
			buildoptions { "/EHsc" }

		configuration { "gmake" }
			buildoptions { "-std=c++11" }