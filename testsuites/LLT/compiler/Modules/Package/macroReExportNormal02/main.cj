// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1.cj pkg2.cj define.cj define2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2.cj -o pkg2.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt define.cj -o define.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt define2.cj -o define2.%middle
// (CJNATIVE)EXEC: %compiler %cmp_opt pkg2.%middle pkg1.%middle %n.cj -o %output
// (not CJNATIVE)EXEC: %compiler %cmp_opt pkg1.%middle pkg2.%middle %n.cj -o %output
// EXEC: %run %run_opt %output

import define2.* // Not need import a macro which not public import pkg2
import define.* // Then import another macro which public import pkg2

main(): Int64 {
    test<Int64>()
    if (aa != "pkg2") {
        return 1
    }
    return 0
}
