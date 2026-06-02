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
    public var a: Int32 = 2
    public init(a!: Int32 = 2) {
        this.a = a
    }
}

struct Test2 {
    public var b: Int32 = Test1().a
    public init(b!: Int32 = Test1().a) {
        this.b = b
    }
}

let res = Test2().b

func run(): Int64 {
    if (res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
