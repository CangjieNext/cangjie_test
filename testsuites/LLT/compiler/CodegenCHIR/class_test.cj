// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix

public interface BlueDog {
    static func goo() {
        1
    }
    func foo(): Unit
    func getAge(): Bool {
        true
    }
}

public open class CBase {
    private var ab = 1
    public var cd = 3
    public open func basefun() {
        5
    }
}

public class Middle {
    public var q = 10
}

public class CA <: CBase & BlueDog {
    private var ef = 3
    public var gh = ef + 2
    public var middle = Middle()
    public func foo(): Unit {}
    public func getAge(): Bool {
        false
    }
    public func basefun() {
        cd + ef // i.e., 3+3=6
    }
}

main() {
    var ca: CBase = CA()
    if (ca.basefun() != 6) {
        return 1
    }

    var ba = CA()
    ba.middle.q = 1
    if (ba.cd + ba.gh + ba.middle.q != 9) { // i.e., 3+5+1=9
        return 1
    }
    0
}
