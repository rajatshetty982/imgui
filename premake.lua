project("ImGui")
kind("StaticLib")
language("C++")
cppdialect("C++17")
staticruntime("On")

targetdir("bin/" .. outputdir .. "/%{prj.name}")
objdir("bin-int/" .. outputdir .. "/%{prj.name}")

files({
    "imconfig.h",
    "imgui.h",
    "imgui.cpp",
    "imgui_draw.cpp",
    "imgui_internal.h",
    "imgui_widgets.cpp",
    "imgui_tables.cpp",
    "imstb_rectpack.h",
    "imstb_textedit.h",
    "imstb_truetype.h",
    "imgui_demo.cpp",

    -- ImGui Backends
    "backends/imgui_impl_glfw.h",
    "backends/imgui_impl_glfw.cpp",
    "backends/imgui_impl_opengl3.h",
    "backends/imgui_impl_opengl3.cpp",
    "backends/imgui_impl_opengl3_loader.h",
})

includedirs({
    -- to backends to find imgui.h internally
    ".",
    -- for backends to see GLFW and Glad headers from your workspace paths
    "../glfw/include",
    "../Glad/include",
})

-- Linux specific requirements for Shared Libraries
filter("system:linux")
pic("On")
systemversion("latest")

filter("system:windows")
systemversion("latest")

filter("configurations:Debug")
runtime("Debug")
symbols("On")

filter("configurations:Release")
runtime("Release")
optimize("Full")
