// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC:%compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %macro_parallel %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

@M1
class A {
    func getX(): String {
        let a = "你好, let's try 中文 and English together === part one"
        return a
    }
}

@M2
class B {
    func getY(): String {
        let a = "你好, let's try 中文 and English together === part two"
        return a
    }

    let Korean = "이것은 한국어"
    let Swedish = "Det här är svenska"
}

main() {
    let a = A()
    let x = a.getX()
    if (x != "你好, let's try 中文 and English together === part one") {
        return 1
    }
    let b = B()
    let y = b.getY()
    if (y != "你好, let's try 中文 and English together === part two") {
        return 2
    }
    let k = b.Korean
    if (k != "이것은 한국어") {
        return 3
    }
    let s = b.Swedish
    if (s != "Det här är svenska") {
        return 4
    }
    0
}
