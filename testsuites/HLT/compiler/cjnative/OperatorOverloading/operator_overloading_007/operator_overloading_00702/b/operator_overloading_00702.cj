/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../a
// EXEC: %compiler %cmp_opt %compile_lib_opt ./a/operator_overloading_00702a.cj -o ./a/operator_overloading_00702a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f ./a/operator_overloading_00702a.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package b

import a.update

main(): Int64 {
    var i = A()
    if (!i) {
        return 0
    }
    return 1
}
