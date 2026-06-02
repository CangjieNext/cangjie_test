/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

class Test {
    public var a: Int32 = 2
    public var b: Int32 = 4
    public init(x: Int32, y: Int32) {
        a = x
        b = y
    }
    public func foo() {
        this(this.a + 1, this.b)
    }
}

class Data<T> {
    public var a: T
    public var b: T
    public init(x: T, y: T) {
        a = x
        b = y
    }
    public func foo(z: T) {
        this(this.a, this.b)
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(3, 5)
    test.foo()
    data.foo(4)
    if (test.a == 3 && data.b == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_invalid_this_call_outside_ctor
// ASSERT: scan sema_wrong_number_of_arguments
