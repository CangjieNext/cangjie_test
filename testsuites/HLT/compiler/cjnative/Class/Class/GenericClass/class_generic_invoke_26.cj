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

open class Base {
    public var a: Int32 = 3
}

class Data<T> <: Base {
    public var aa: Int32 = 2
    public var b: Int32 = 0
    public init() {
        b = super.a + 1
    }
    public init(y: T) {}
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>()
    var res1: Int32 = data.aa
    var res2: Int32 = data.b
    if (res1 == 2 && res2 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
