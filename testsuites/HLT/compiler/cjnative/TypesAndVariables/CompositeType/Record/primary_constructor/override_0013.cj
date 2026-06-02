/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

struct Data<D, C> {
    public var a: Int32 = 1
    public var b: Int32 = 2
    public Data(a: D, b: Int32, c: Bool) {
        //    this.a = a 
        //    this.b = a
    }

    public init(a: C, b: Int32, c: Bool) {
    }
}

func run(): Int64 {
    var a: Int32 = 8
    let b: Bool = false
    return Int64(Data<Int32, Int64>(a, a, b).a - 1)
}

main(): Int64 {
    return run()
}
