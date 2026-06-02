// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    init(v: Int32) {
    }
    func f1() {
        return 1
    }
}

main() {
    let a = Foo(2)
    a.f1()
    return 0
}
