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
    public var i: Int32 = 2
    public func foo(x: Int32): String {
        var i: Int32 = this.bar() + x
        return i.toString()
    }
    public func bar(): Int32 {
        return 3
    }
}

class Data<T> {
    public var i: Int32 = 2
    public func foo(x: Int32): Int32 {
        var i: Int32 = this.bar() + x
        return i
    }
    public func bar(): Int32 {
        return 3
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: String = test.foo(3)
    var res2: Int32 = data.foo(4)
    if (res1 == "6" && res2 == 7) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
