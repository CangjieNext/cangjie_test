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

class Data {
    public var a: Int32
    public var b: Int32
    public init(x: Int32, y: Int32) {
        a = x
        b = y
    }
    public func foo() {
        a += b
        return a
    }
    public static func bar(): Int32 {
        var i: Int32 = 3
        i /= 3
        i
    }
}

main(): Int64 {
    var data = Data(2, 2)
    data.a += data.b
    data.b -= data.foo() + Data.bar()
    if (data.a == 6 && data.b == -5) {
        return 0
    }
    return 1
}
