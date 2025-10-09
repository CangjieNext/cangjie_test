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

struct Data {
    public Data(let a!: Int32, let b!: Int32) {
    }
}

struct Data_1 {
    public let a: Int32
    public let b: Int32
    public init(a!: Int32, b!: Int32) {
        //        super()
        this.a = a
        this.b = b
    }
}

struct Data2 {
    public Data2(let a: Int32, let b: Int32) {
    }
}

struct Data2_1 {
    public let a: Int32
    public let b: Int32
    public init(a: Int32, b: Int32) {
        //        super()
        this.a = a
        this.b = b
    }
}

func run(): Int32 {
    var data: Data = Data(a: 1, b: 2)

    if (data.a == 1 && data.b == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return Int64(run())
}
