/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: testcase
// EXEC: %compiler %cmp_opt %compile_lib_opt testcase/a/a1.cj -o a1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt testcase/b/b1.cj -o b1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt testcase/c0.cj -o c0.%middle
// EXEC-PIPE: %compiler %cmp_opt a1.%middle b1.%middle c0.%middle %f -o %output 2>&1|compare %f

import testcase.*
import testcase.a.*
import testcase.b.*

main(): Int64 {
    var a = a1
    var b = b1
    var c = c1
    return 0
}
// ASSERT: scan chir_dce_unused_variable
