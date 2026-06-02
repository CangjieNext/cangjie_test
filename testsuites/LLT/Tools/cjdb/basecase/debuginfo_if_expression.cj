// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    let score: Int64 = 90
    var scoreResult: Int64 = match (score) {
        case 90 => 5
        case _ => 1
    }
    foo()
    return scoreResult
}

class A {
    var c = 111
}

func foo() {
    var a = 999
    var ccc = if (a == 888) {
        A()
    } else {
        A()
    }
    var d = ccc.c
    0
}
