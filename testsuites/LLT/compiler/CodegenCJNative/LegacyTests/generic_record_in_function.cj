// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

struct R<T> {
    public let a: T
    public init(a: T) {
        this.a = a
    }
}

func f<T>(): Int32 {
    var x: R<Int32> = R<Int32>(1)
    var y = R<Int8>(10)
    return x.a + Int32(y.a)
}

func f1<T>(x: T): T {
    return x
}

func codegenUnitTest(): Int32 {
    var r = f1<R<Int32>>(R<Int32>(100))
    return f<Int32>() + r.a
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 111) {
        return 0
    } else {
        return -1
    }
}
