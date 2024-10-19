workspace "Text-Editor"
    architecture "x64"
    startproject "Text-Editor"

configurations
{
    "Debug",
    "Release",
    "Dist"
}

flags { "MultiProcessorCompile" }
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Text-Editor"
    location "Text-Editor"
    kind "ConsoleApp"
    language "C"
    cdialect "C17"
    staticruntime "on"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.c",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
        "vendor/SDL2/include"
    }

    libdirs 
    {
        "vendor/SDL2/lib/x64"
    }

    links
    {
        "SDL2.lib",
        "SDL2main.lib"
    }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        symbols "On"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"
        symbols "Off"
