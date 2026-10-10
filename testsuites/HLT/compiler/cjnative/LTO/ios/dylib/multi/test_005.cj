// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import my_test11.*
import my_test12.*
import my_test3.*
import my_test4.*
import my_test5.*
import my_test6.*
import my_test7.*
import my_test8.*
import my_test9.*
import my_test10.*

// LEVEL: 1
// DEPENDENCE: my_test11.cj my_test12.cj my_test3.cj my_test4.cj my_test5.cj my_test6.cj my_test7.cj my_test8.cj my_test9.cj my_test10.cj 
// (target_ios_simulator)EXEC: %compiler   %cmp_opt  %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full  --output-type=staticlib my_test12.cj -o my_test12.bc
// (target_ios_simulator)EXEC: %compiler   %cmp_opt  %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full  --output-type=staticlib my_test3.cj -o my_test3.bc
// (target_ios_simulator)EXEC: %compiler   %cmp_opt  %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test11.cj my_test12.bc my_test3.bc --output-type=dylib -o libmy_test11.dylib  
// (target_ios_simulator)EXEC: %compiler   %cmp_opt  %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test4.cj  --output-type=dylib -o libmy_test4.dylib 
// (target_ios_simulator)EXEC: %compiler   %cmp_opt  %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test5.cj  --output-type=dylib -o libmy_test5.dylib 
// (target_ios_simulator)EXEC: %compiler   %cmp_opt  %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test6.cj --output-type=dylib -o libmy_test6.dylib 
// (target_ios_simulator)EXEC: %compiler   %cmp_opt  %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test7.cj --output-type=dylib -o libmy_test7.dylib 
// (target_ios_simulator)EXEC: %compiler   %cmp_opt  %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test8.cj --output-type=dylib -o libmy_test8.dylib 
// (target_ios_simulator)EXEC: %compiler   %cmp_opt  %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test9.cj --output-type=dylib -o libmy_test9.dylib 
// (target_ios_simulator)EXEC: %compiler   %cmp_opt  %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test10.cj  --output-type=dylib -o libmy_test10.dylib 
// (target_ios_simulator)EXEC: %compiler   %cmp_opt  %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %f  -L. -lmy_test11 -lmy_test4 -lmy_test5 -lmy_test6 -lmy_test7 -lmy_test8 -lmy_test9 -lmy_test10 -o %output
// (target_ios_simulator)RUN-EXEC: %run %run_opt %output %run_args

main(){
   
    f1xx()
    f2xx()
    f3xx()
    f4xx()
    f5xx()
    f6xx()
    f7xx()
    f8xx()
    f9xx()
    f10xx()

    return 0
}

