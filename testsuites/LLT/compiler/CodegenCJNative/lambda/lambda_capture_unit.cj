// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func f() {
    let a: Unit = ()
    let b: Unit = ()
    let l = {
        =>
        let c = a
        let m = {
            =>
            var d = b
            var e = c
            return
        }
        return m
    }
    return l()()
}

main() {
    let a: Unit = f()
    let b = {
        =>
        var c = a
        return 0
    }
    b()
    return b()
}
