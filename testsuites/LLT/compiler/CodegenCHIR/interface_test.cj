// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj --disable-reflection -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix

public interface BlueDog {
    static func goo() {
        1
    }
    func foo(): Int64
    func getAge(): Bool {
        true
    }
}

public open class CBase <: BlueDog {
    public open func foo(): Int64 {
        9
    }
    public open func basefun() {
        5
    }
}

public class CA <: CBase {
    public func foo(): Int64 {
        19
    }
    public func getAge(): Bool {
        false
    }
    public func basefun() {
        6
    }
}

func getIns(x: Bool): BlueDog {
    if (x) {
        CA()
    } else {
        CBase()
    }
}

var flag = true

main() {
    var a: BlueDog = getIns(flag)
    var b: BlueDog = getIns(!flag)
    a.foo() + b.foo() - 28
}
