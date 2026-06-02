// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct Rcd {
    public var a: Int64
    public var b: Int64
    public init(x: Int64, y: Int64) {
        a = x
        b = y
    }
}

main(): Int64 {
    var rcd = Rcd(0, 1)
    func test() {
        let newRcd = Rcd(1, 2)
        rcd = newRcd
    }
    test()
    if (rcd.a != 1 || rcd.b != 2) {
        print("a: ${rcd.a}, b:${rcd.b}\n")
        return 1
    }
    return 0
}
