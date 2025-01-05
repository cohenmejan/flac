project "FLAC"
    kind "StaticLib"
    language "C++"
	systemversion "latest"
	staticruntime "on"
	
	targetdir "%{wks.location}/bin/%{cfg.buildcfg}/%{prj.name}"
	objdir "%{wks.location}/bin-obj/%{cfg.buildcfg}/%{prj.name}"

	flags {
		"MultiProcessorCompile",
	}

    includedirs {
        "include",
		"src/libFLAC/include"
    }

    files {
		"include/*.h",
		"include/FLAC/*.h",
		"include/FLAC++/*.h",
		"src/libFLAC/*.c",
		"src/libFLAC++/*.cpp",
		"src/share/win_utf8_io/*.c",
    }

	removefiles {
		"src/libFLAC/ogg_*.c"
	}

    defines {
		"HAVE_CONFIG_H",
    	"PACKAGE_VERSION=\"1.3.4\"",
		"_CRT_SECURE_NO_DEPRECATE",
		"FLAC__NO_DLL"
    }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"