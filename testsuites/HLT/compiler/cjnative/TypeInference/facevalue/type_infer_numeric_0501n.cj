/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Data {
    public var data: Int8
    public init(x: Int8) {
        data = x
    }
}

func foo1(x: Int8): Int32 {
    return 2.0
}

func foo2(x: Int8): Int32 {
    return 3
}

extend Int32 {
    public func add(x: Int32, y: Int32): Int64 {
        return 3
    }
}

extend Int64 {
    public func add(x: Int64, y: Int32): Int64 {
        return x
    }
}

main(): Int64 {
    var str = "hello world"
    var num1: Int8 = 2.0
    var res1 = str.get(3.0)
    var res2 = Data(2.0).data
    var res3 = foo(2.0)
    var num2: Int64 = 2
    var res4 = add(num2, 3.0)

    return 0
}
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_undeclared_identifier
