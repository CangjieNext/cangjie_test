// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt -Woff unused %n.cj

interface I {}
interface J {}
enum E<T> where T <: I { A }

extend<T> E<T> where T <: J {
    func derivingChecks(): Unit {
        func check<S>(): Unit where S <: J {}
        let _ = check<T>
    }
}

main() {}