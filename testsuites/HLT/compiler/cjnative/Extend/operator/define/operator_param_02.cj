/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var a: Int32 = 1
    return 0
}

class A {}

extend Int32 {
    public operator func !(right: A): String { //error: invalid number of parameters for operator '!'
        return "abc"
    }
}
// ASSERT: scan sema_operator_overload_invalid_num_parameter
