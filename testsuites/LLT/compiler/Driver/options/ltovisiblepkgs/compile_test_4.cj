package tmp_test
import lib2.*

// LEVEL: 1
// DEPENDENCE: lib2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full lib2.cj -o lib2.bc
// EXEC: %compiler --lto-keep-pkg-visibility="lib2"  %cmp_opt --lto=full %f lib2.bc
// ASSERT: regex warning: --lto-keep-pkg-visibility only takes effect when outputting a dylib

main(): Int64 {
    return 0
}