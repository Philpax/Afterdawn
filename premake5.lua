solution "Afterdawn"
	configurations { "Debug", "Release" }

	-- Include the vespertine project in this solution
	include "vespertine/premake5.lua"

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

	project "Afterdawn"
		kind "ConsoleApp"
		language "C++"
		targetdir "bin/%{cfg.buildcfg}"

		includedirs(RerootPaths(VENDOR_INCLUDES))
		includedirs { "vespertine/include/", "include/" }
		files { "include/**.hpp", "src/**.cpp" }

		sdl2LibDir = RerootPath "vendor/SDL2-2.0.3/lib/x86"

		libdirs { sdl2LibDir }
		links { "SDL2", "Vespertine", "dxgi", "d3d11", "d3dcompiler" }
		postbuildcommands 
		{ 
			[[{COPY} %{sdl2LibDir .. "/SDL2.dll"} bin/%{cfg.buildcfg}]],
			[[{COPY} %{RerootPath "data"} bin/%{cfg.buildcfg}/data]] 
		}

		filter "configurations:Debug"
			defines { "DEBUG" }
			flags { "Symbols" }

		filter "configurations:Release"
			defines { "NDEBUG" }
			optimize "On"

		configuration { "gmake" }
			buildoptions { "-std=c++11" }