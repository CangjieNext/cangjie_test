// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var a = Aoo()
    var b = a.goo2()()
    if (b != 2) {
        print("${b}")
        return 2
    }
    return 0
}

struct Aoo {
    public var a: Int32 = 1
    public static var b: Int32 = 1
    public func foo2() {
        var x = a + b;
        return x
    }
    public func goo2() {
        var a = foo2
        return a
    }
}
