/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public var a: Int32 = 1
    public var b: Int32 = 0
    public init() {
        a = a + 1
    }
    public init(b: Int32) {
        this()
        this.b = this.a + b
    }
}

class Data<T> {
    public var a: T
    public var b: T
    public init(a: T, b: T) {
        this.a = a
        this.b = b
    }
    public init(a: T) {
        this(a, a)
        this.a = a
        b = this.a
    }
}

func run(): Int64 {
    var test: Test = Test(1)
    var data: Data<Int32> = Data<Int32>(4)
    var res1: Int32 = test.b
    var res2: Int32 = data.b
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
