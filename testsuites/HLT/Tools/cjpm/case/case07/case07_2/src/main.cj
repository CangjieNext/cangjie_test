/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

func foo(a: Int64, b: Int64, c: Int64): Bool {
    if (a <= b) {
        return false
    } else {
        if (a <= c) {
            return false
        } else {
            return true
        }
    }
}

main(): Unit {
    let a = 1
    let b = 2
    let c = 4
    foo(a, b, c)
}
