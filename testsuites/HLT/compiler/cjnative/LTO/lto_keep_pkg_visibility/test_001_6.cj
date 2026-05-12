// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import lib1.*
import lib2.*
// LEVEL: 1
// DEPENDENCE: lib1.cj lib2.cj

// EXEC: %compiler %cmp_opt %compile_lib_opt --lto=thin lib2.cj -o lib2.bc
// EXEC: %compiler %cmp_opt %compile_lib_opt --lto=thin lib2.cj -o lib1.bc
// EXEC: %compiler --lto-keep-pkg-visibility="tmp_test" %cmp_opt %compile_dylib_opt --lto=full lib1.bc lib2.bc %f -o lib.so 
// EXEC-1: nm lib.so | grep -E "T.*(foo|fxx)" 
// EXEC-1: nm lib.so | grep -E "T.*(hw)" 
// EXEC: nm lib.so | grep -E "T.*(testmain)" 
// EXEC: %compiler %cmp_opt %f  -L . -l:lib.so -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    hw()
    return 0
}

public func testmain(): Unit {
    fxx()
}