/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../testcase
// EXEC: %compiler %cmp_opt %compile_lib_opt testcase/a/a1.cj -o a1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt testcase/b/b1.cj -o b1.%middle
// EXEC: %compiler %cmp_opt %f a1.%middle b1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package testcase

import testcase.a.*
import testcase.b.*

main(): Int64 {
    var a = a1
    var b = b1
    return 0
}

public var c1 = 1
