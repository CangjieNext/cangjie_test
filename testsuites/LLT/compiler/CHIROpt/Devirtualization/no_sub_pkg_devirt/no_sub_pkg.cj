// DEPENDENCE: no_sub_pkg_lib.cj
// EXEC-PIPE-0: %compiler %enableO2 --no-sub-pkg no_sub_pkg_lib.cj %compile_lib_opt -o test0.%middle
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 test0.%middle %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
 
import no_sub_pkg_lib.*
 
main() {
    let a: II<Int32> = goo()
    a.foo()
}
 
// ASSERT: scan [Devirtualization] The function call to foo at [10,5] was optimized.

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
