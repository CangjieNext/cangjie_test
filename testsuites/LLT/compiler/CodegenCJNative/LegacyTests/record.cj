// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

struct Rectangle {
    public var width: Int32
    public let length: Int32
    public var f: (Int32) -> Int32
    public func count(a: Int32) {
        a
    }
    public func count() {
        length
    }
    public init() {
        width = 10
        length = 20
        f = {a: Int32 => return a + 1}
    }
    public init(width1: Int32, length1: Int32, f1: (Int32) -> Int32) {
        width = width1
        length = length1
        f = f1
    }
}

func codegenUnitTest(): Int32 {
    var n: Rectangle = Rectangle(1, 2, {a: Int32 => return 1111})
    n = Rectangle()
    n.width = 15
    let r = n.width;
    let call = n.f(99)
    return r + n.length + call + n.count()
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 155) {
        return 0
    } else {
        return -1
    }
}
