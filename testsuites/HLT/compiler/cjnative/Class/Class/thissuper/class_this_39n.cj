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
    public var a: Int32
    public var b: Int32
    public var i: Int32 = 1
    public init() {}
    public init(x: Int32, y: Int32) {
        this()
        this(this.i)
        b = y
    }
    public init(x: Int32) {
        a = x
    }
}

class Data<T> {
    public var a: Int32
    public var b: T
    public var i: Int32 = 1
    public init() {}
    public init(x: T, y: T) {
        this()
        this(this.i)
        b = y
    }
    public init(x: Int32) {
        a = x
    }
}

func run(): Int64 {
    var test: Test = Test(2, 3)
    var data: Data<Int32> = Data<Int32>(4, 5)
    print(test.a.toString())
    print(test.b.toString())
    if (test.a == 1 && test.b == 3 && data.a == 1 && data.b == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_illegal_place_of_calling_this_or_super
