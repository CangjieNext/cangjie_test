/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: regex 7
open class Base {
    public static let a: Int32 = 1
}

class Data <: Base {
    public var b: Int32 = 2
    public init() {}
    public init(x: Int32) {
        this()
        let i_a: Int32 = 2 * Base.a // expected is 2*1
        var i_b: Int32 = 2 * b // expected is 2*2
        func foo(): Int32 {
            var i_f_a: Int32 = 2 * Base.a // expected is 2*1
            var i_f_b: Int32 = 2 * i_a // expected is 2*2
            var res: Int32 = Base.a + i_f_a + i_f_b // expected is 1+ 2 + 4
            return res
        }
        print(foo().toString() + "\n") // expected is 7
    }
    public func foo(): Int32 {
        var f_b = 3 * (Base.a) // expected is 3
        var f_c = b
        var res: Int32 = f_b + f_c
        return res
    }
}

func run(): Int64 {
    var res: Data = Data(2);
    if (res.foo() != 5) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
