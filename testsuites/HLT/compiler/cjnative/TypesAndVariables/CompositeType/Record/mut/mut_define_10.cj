/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %compile_lib_opt %f

interface A {
    mut func c(b: Int64): Int64
}

struct R <: A {
    public var a = 3
    public mut func c(b: Int64): Int64 {
        this.a = b
        return this.a
    }
}

main() {
    var a = R()
    a.c(9)
    return (a.a - 9)
}
