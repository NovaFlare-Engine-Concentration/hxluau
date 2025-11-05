# IFLOW Context for hxluau

## Project Overview

This project provides Haxe/hxcpp @:native bindings for [Luau](https://luau.org/), a fast, small, safe, gradually typed embeddable scripting language derived from Lua. It allows Haxe applications targeting C++ to embed and execute Luau scripts.

### Key Components

1.  **Haxe Bindings**: Located in `source/hxluau/`, these are extern classes (`Lua.hx`, `LuaL.hx`, `Types.hx`, etc.) that provide a typed interface to the underlying Luau C++ API.
2.  **Luau C++ Source**: Located in `project/luau/`, this directory contains the complete Luau C++ source code, which is compiled as part of the hxcpp build process.
3.  **Examples**: Found in the `examples/` directory, these demonstrate various ways to use the hxluau library, such as calling Lua functions, passing data, handling return values, and integrating with modules.
4.  **Build System**: Uses hxcpp's build system, configured via `project/Build.xml` (referenced in the Haxe externs) and Haxe's standard `.hxml` files for compilation.

### Technologies

*   **Haxe**: A high-level, cross-platform programming language.
*   **hxcpp**: The C++ target for Haxe, allowing Haxe code to compile to native C++.
*   **Luau**: The embeddable scripting language, implemented in C++.

## Building and Running

### Prerequisites

*   Haxe
*   hxcpp library (`haxelib install hxcpp`)
*   hxluau library (this project, installed via `haxelib install hxluau` or `haxelib git`)

### Building an Example

1.  Navigate to an example directory (e.g., `examples/simple-call/`).
2.  Run the Haxe compiler with the appropriate build file for your target platform:
    *   Windows: `haxe build-win.hxml`
    *   Unix-like systems: `haxe build-unix.hxml`

This will compile the Haxe code and link it with the Luau C++ code using the hxcpp build system.

### Running an Example

After building, an executable (e.g., `Main.exe` on Windows, `Main` on Unix) will be generated in the example directory. Run this executable to see the example in action. It will typically load and execute the associated `script.lua` file.

## Development Conventions

*   **Externs**: The Haxe bindings in `source/hxluau/` are `extern` classes, meaning they describe the interface to the C++ code but don't contain the implementation. The actual implementation resides in the Luau C++ source.
*   **@:native Metadata**: Used extensively in the externs to map Haxe identifiers to the corresponding C identifiers from the Luau API.
*   **@:include and @:buildXml**: These metadata tags in the externs link the Haxe code to the necessary C++ headers (`@:include`) and the build configuration (`@:buildXml`), ensuring the Luau C++ source is compiled and linked correctly.
*   **C++ Integration**: The use of `cpp.RawPointer`, `cpp.ConstCharStar`, etc., in the externs reflects the direct mapping to C++ types.
*   **Examples**: Examples are self-contained and demonstrate specific features. They usually follow the pattern of initializing the Luau VM (`LuaL.newstate`, `LuaL.openlibs`), executing a script (`LuaL.dostring` or `LuaL.loadfile`), interacting with the script's environment if needed, and then closing the VM (`Lua.close`).
