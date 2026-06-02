// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A {
    func f() {
        A()
    }
}

main(): Int64 {
    var i = A()
    i.f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f()
    return 0
}

// from 8.5s to 2.15s
