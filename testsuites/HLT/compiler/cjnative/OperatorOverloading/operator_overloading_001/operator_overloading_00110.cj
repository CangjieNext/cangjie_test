/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    let a: Int32
    private operator func +(inputB: A): Int32 {
        return 1
    }
    init(a: Int32) {
        this.a = a
    }
}

main(): Int64 {
    var a = A(1)
    var b = A(-1)
    return (a + b)
}
// ASSERT: scan sema_invalid_binary_expr
