package tmp_test
import my_test1.*

// LEVEL: 1
// DEPENDENCE: my_test1.cj my_test2.cj
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=thin --output-type=staticlib --lto-staticlib-format=bitcode my_test2.cj -o my_test2.bc
// (target_ios_simulator)EXEC-PIPE-1: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental my_test1.cj my_test2.bc --output-type=staticlib --lto-staticlib-format=native -o libmy_test1.a 2>&1 | compare %f
// ASSERT: scan Option '--lto-staticlib-format' only takes effect when lto mode is enabled

main(): Int64 {
    hw()
    return 0
}