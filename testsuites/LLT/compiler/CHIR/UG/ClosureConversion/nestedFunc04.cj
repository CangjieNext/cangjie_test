// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %enableFuncInlining %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func foo<T1>(x: T1) {
    func goo(y: T1): T1 {
        var a = goo
        a(y)
    }
    goo(x)
}

main() {
    0
}
