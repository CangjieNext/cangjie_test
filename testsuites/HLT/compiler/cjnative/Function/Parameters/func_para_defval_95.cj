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

func run(): Int64 {
    var res1 = Data(3)
    if (res1.x == 25) {
        return 0
    }
    return 1
}

class Data <: Base {
    public var x: Int32 = 11
    public init(x: Int32, y!: Int32 = 4) {
        super(3)
        this.x = this.x + x + y + super.base_x
    }
}

open class Base {
    public var base_x: Int32 = 1
    public var base_y: Int32 = 2
    public init(x: Int32, y!: Int32 = 4) {
        this()
        this.base_x = x + y
    }
    public init() {
    }
}
