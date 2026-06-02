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

main(): Int64 {
    return run()
}

struct Step {
    public var step: Int32 = 2
    public init(step!: Int32 = 2) {
        this.step = step
    }
}

struct Data {
    public let width: Int32
    public let length: Int32

    public init(x: Int32, y: Int32) {
        width = x
        length = y
    }

    public operator func -(): Data {
        var step = Step().step
        Data(this.width - step, this.length - step)
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    var data: Data = Data(a, b)
    var d1 = -data
    var res1: Int32 = d1.width
    var res2: Int32 = d1.length
    if (res1 == 1 && res2 == 2) {
        return 0
    }
    return 1
}
