/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var a: Int32 = 1
let b: Int32 = 2

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

var s1 = {
    =>
    var s = a + b
        + Coo().a + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
        + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f;
    return s
}
var s2 = {
    =>
    var s = a + b + Coo().a
        + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
        + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f;
    return s
}()
var s3 = foo(
    {
        =>
        var s = a + b
            + Coo().a + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
            + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f;
        return s
    }
)

main(): Int64 {
    if (s1() != 45) {
        return 1
    }
    if (s2 != 45) {
        return 1
    }
    if (s3() != 45) {
        return 1
    }
    return 0
}

func foo(x: () -> Int32) {
    return x
}

func goo(x: Int32) {
    return x
}
