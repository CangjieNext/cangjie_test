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

main(): Int64 {
    var a = Coo(3, "s", 3, "s", r's') // init1()
    if (a.g != 3) {
        return 1
    }
    var b = Coo(3, "s", 3, "s", e: r's', f: 3, h: 1) // Coo()
    if (b.g != 1) {
        return 1
    }
    var c = Coo(3, "s", 3, "s", e: r's', g: 2, f: 3, h: 1) // Coo()
    if (c.g != 2) {
        return 1
    }
    var d = Coo(3, "s", 3, "s", 1) // init2()
    if (d.g != 3) {
        return 1
    }
    var e = Coo(3, "s", 3, "s", h: 1) // Coo()
    if (e.g != 1) {
        return 1
    }
    return 0
}

class Coo {
    public var a: Int64 = 1
    public Coo(
        a: Int64,
        b: String,
        var c: Int32,
        var d: String,
        var e!: Rune = r'a',
        var f!: Int64 = a,
        var g!: Int64 = 1,
        var h!: Int64
    ) {}
    public init(
        a: Int64,
        b: String,
        c: Int32,
        d: String,
        g: Rune
    ) {
        this.a = 2 // a is a in Coo()
        this.c = 2
        this.d = "b"
        e = r'b' // e is suger of this.e,e is e in Coo()
        this.f = a // a is a in init()
        this.g = a
        this.h = a
    }
    public init(
        a: Int64,
        b: String,
        c: Int32,
        d: String,
        h: Int64
    ) {
        this.a = 2 // a is a in Coo()
        this.c = 2
        this.d = "b"
        e = r'b' // e is suger of this.e,e is e in Coo()
        this.f = a // a is a in init()
        this.g = a
        this.h = a
    }
}
