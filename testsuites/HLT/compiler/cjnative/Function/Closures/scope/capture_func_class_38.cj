/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var res: Int32 = 0

class Aoo {
    public static var a: Int32 = 1
    public var b: Int32 = 1
    public init(y: Rune, x!: Int32 = a) {
        m = a
        m = this.b
        var l = a
        var k = this.b
        b = a + 1
    }
    public init(y: Int64, x!: Int32 = a) {
        m = a
        m = this.b
        b = a + 2
    }
    public Aoo(y: String, x!: Int32 = a, var m!: Int32 = a) {
        var l = a
        var k = this.b
        b = a + 3
    }
}

main(): Int64 {
    var a = Aoo(r'a')
    if (a.b != 2) {
        return 1
    }
    var b = Aoo(1)
    if (b.b != 3) {
        return 1
    }
    var c = Aoo("a")
    if (c.b != 4) {
        return 1
    }
    return 0
}
