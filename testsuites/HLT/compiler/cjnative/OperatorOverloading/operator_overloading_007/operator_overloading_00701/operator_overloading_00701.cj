/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: operator_overloading_00701a.cj
// EXEC: %compiler %cmp_opt %f operator_overloading_00701a.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package operator_overloading_00701

interface update {
    operator func !(): Bool
}

main(): Int64 {
    var a = A()
    if (!a) {
        return 0
    }
    return 1
}
