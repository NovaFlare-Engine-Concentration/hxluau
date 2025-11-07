package luau;

#if !cpp
#error 'Luau supports only C++ target platforms.'
#end

import hxluau.Types;

/**
 * Thin wrappers around Luau standard libraries (lualib.h)
 * Provides functions commonly used by higher-level libraries (e.g., lscript).
 */
@:buildXml('<include name="${haxelib:hxluau}/project/Build.xml" />')
@:include('lualib.h')
@:unreflective
extern class LuaOpen {
    // Open all builtin libraries
    @:native('luaL_openlibs')
    public static function openlibs(L:cpp.RawPointer<Lua_State>):Void;

    // Sandbox helpers
    @:native('luaL_sandbox')
    public static function sandbox(L:cpp.RawPointer<Lua_State>):Void;

    @:native('luaL_sandboxthread')
    public static function sandboxthread(L:cpp.RawPointer<Lua_State>):Void;

    // Individual libraries
    @:native('luaopen_base')
    public static function open_base(L:cpp.RawPointer<Lua_State>):Int;

    @:native('luaopen_coroutine')
    public static function open_coroutine(L:cpp.RawPointer<Lua_State>):Int;

    @:native('luaopen_table')
    public static function open_table(L:cpp.RawPointer<Lua_State>):Int;

    @:native('luaopen_os')
    public static function open_os(L:cpp.RawPointer<Lua_State>):Int;

    @:native('luaopen_string')
    public static function open_string(L:cpp.RawPointer<Lua_State>):Int;

    @:native('luaopen_bit32')
    public static function open_bit32(L:cpp.RawPointer<Lua_State>):Int;

    @:native('luaopen_buffer')
    public static function open_buffer(L:cpp.RawPointer<Lua_State>):Int;

    @:native('luaopen_utf8')
    public static function open_utf8(L:cpp.RawPointer<Lua_State>):Int;

    @:native('luaopen_math')
    public static function open_math(L:cpp.RawPointer<Lua_State>):Int;

    @:native('luaopen_debug')
    public static function open_debug(L:cpp.RawPointer<Lua_State>):Int;

    @:native('luaopen_vector')
    public static function open_vector(L:cpp.RawPointer<Lua_State>):Int;
}