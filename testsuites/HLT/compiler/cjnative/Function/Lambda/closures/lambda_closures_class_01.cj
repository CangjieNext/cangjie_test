/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output

main(): Int64 {
    if (case01().foo()() != 5) {
        return 1
    }
    if (case02().foo() != 5) {
        return 2
    }
    if (case03().foo()() != 5) {
        return 3
    }
    if (case04().foo()() != 5) {
        return 3
    }
    return 0
}

class case01 {
    public var a: Int32 = 1
    public let b: Int32 = 2
    public func foo() {
        return {
            => a + b
                + Coo().a + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f
        }
    }
}

class case02 {
    public var a: Int32 = 1
    public let b: Int32 = 2
    public func foo() {
        return {
            => a + b + Coo().a
                + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f
        }()
    }
}

class case03 {
    public var a: Int32 = 1
    public let b: Int32 = 2
    public func foo(
        x!: () -> Int32 = {
            => a + b
                + Coo().a + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f
        }) {
        return x
    }
}

class case04 {
    public var a: Int32 = 1
    public let b: Int32 = 2
    public func foo() {
        var x = {
            => a + b + Coo().a
                + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f
        }
        return x
    }
}

class Coo {
    public var a: Int32 = 1
    public let b: Int32 = 2
    public static var c: Int32 = 3
    public static let d: Int32 = 4
    public var e: Int32
    public let f: Int32
    public init() {
        e = 5
        f = 6
    }
}

struct Roo {
    public var a: Int32 = 1
    public let b: Int32 = 2
    public static var c: Int32 = 3
    public static let d: Int32 = 4
    public var e: Int32
    public let f: Int32
    public init() {
        e = 5
        f = 6
    }
}
