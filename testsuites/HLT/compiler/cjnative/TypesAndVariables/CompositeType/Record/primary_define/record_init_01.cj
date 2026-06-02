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

struct Data {
    public var i: Int64
    private Data(x: Int32) {
        this.i = 4
    }
    public init(x: Float32, str: String) {
        this(Int32(3))
        this.i++
        this.i--
        this.i = this.i + Int64(x)
        print(this.i.toString())
    }
}

main(): Int64 {
    var data = Data(3.14, "hi")
    if (data.i == 7) {
        return 0
    }
    return 1
}
