package tmp_test

// LEVEL: 1
// DEPENDENCE: lib1.cj
// DEPENDENCE: lib2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full lib2.cj -o lib2.bc
// EXEC: %compiler --lto-keep-pkg-visibility="" %cmp_opt %compile_shared_lib_opt --lto=full lib1.cj lib2.bc -o lib.so 
// EXEC-1: nm lib.so | grep -E "T.*(foo|fxx|hw)"
// EXEC: %compiler %cmp_opt %f  -L . -l:lib.so -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return 0
}