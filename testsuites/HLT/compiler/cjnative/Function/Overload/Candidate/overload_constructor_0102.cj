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
    var a = Coo(3, "s", 3, "s") // Coo()
    if (a.a != 1) {
        return 1
    }
    var b = Boo(3, "s", 3, "s") // Boo()
    if (a.a != 1) {
        return 1
    }
    if (foo1(1).a != 1) {
        return 1
    }
    if (foo2(1).a != 1) {
        return 3
    }
    if (foo2(Int32(1)).a != 1) {
        return 4
    }
    if (foo2(x: 1).a != 2) {
        return 5
    }
    if (foo2().a != 2) {
        return 5
    }
    if (foo3(x: 1).a != 1) {
        return 6
    }
    if (foo3(x: Int32(1)).a != 2) {
        return 7
    }
    if (foo4(Int32(1), Int64(1)).a != 1) {
        return 8
    }
    if (foo4(1, 1).a != 3) {
        return 9
    }
    if (foo5(1, 1).a != 2) {
        return 10
    }
    return 0
}

class Coo {
    public var a: Int64 = 1
    public Coo(
        a: Int64,
        b: String,
        var c: Int64,
        var d: String
    ) {}
    public init(
        a: Int64,
        b: String,
        c: Int32,
        d: String
    ) {
        this.a = a // this.a is a in Coo(),a is a in init()
        this.c = 2
        this.d = "b"
    }
}

class Boo {
    public var a: Int64 = 1
    public Boo(
        a: Int64,
        b: String,
        c: Int64,
        d: String
    ) {}
    public init(
        a: Int64,
        b: String,
        c: Int32,
        d: String
    ) {
        this.a = a // this.a is a in Coo(),a is a in init()
    }
}

class foo1 {
    public var a: Int64 = 1
    public var b: Int32 = 1
    public foo1(x: Int64) {
        a = Int64(1)
    }
    public init(x: Int32) {
        b = Int32(2)
    }
}

class foo2 {
    public var a: Int64 = 1
    public var b: Int32 = 1
    public foo2(x: Int32) {
        a = 1
    }
    public init(x!: Int64 = 1) {
        a = 2
    }
}

class foo3 {
    public var a: Int64 = 1
    public var b: Int32 = 1
    public foo3(x!: Int64 = 1) {
        a = 1
    }
    public init(x!: Int32 = 1) {
        a = 2
    }
}

class foo4 {
    public var a: Int64 = 1
    public var b: Int32 = 1
    public foo4(x: Int32, y: Int64) {
        a = 1
    }
    public init(x: Int64, y: Int32) {
        a = 2
    }
    public init(x: Int64, y: Int64) {
        a = 3
    }
}

class foo5 {
    public var a: Int64 = 1
    public var b: Int32 = 1
    public foo5(x: Int32, y: Int64) {
        a = 1
    }
    public init(x: Int64, y: Int64) {
        a = 2
    }
}
