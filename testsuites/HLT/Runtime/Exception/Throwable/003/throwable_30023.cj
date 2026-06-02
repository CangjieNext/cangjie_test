/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Exception {}

var a = {
    x: Int64 => if (x == 0) {
        throw A();
        1
    } else {
        2
    }
}
var b = {x: Int64 => a(x - 1)}
var c = {x: Int64 => b(x - 1)}

main() {
    try {
        c(2)
    } catch (a: A) {
        print("success")
        a.printStackTrace()
        return 0
    }
    return 5
}
