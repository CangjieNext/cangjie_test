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

struct Test1 {
    public var a: Int32 = 0
    public var b: Int32 = 0
    public Test1(a: Int32, b: Int32) {
        this.a = a
        this.b = b
    }
}

struct Test2 {
    public func foo(): Int32 {
        let test = Test1(2, 2)
        return test.a + test.b
    }
}

let res = Test2().foo()

func run(): Int64 {
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
