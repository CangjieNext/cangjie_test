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

struct Data {
    public let width: Int32
    public let length: Int32

    public init(x: Int32, y: Int32) {
        width = x
        length = y
    }

    public operator func ==(oprRight: Data): Bool {
        if (this.width == oprRight.width && this.length == oprRight.length) {
            return true
        }
        return false
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    var data1: Data = Data(a, b)
    var data2: Data = Data(a, b)
    var res = data1 == data2
    if (res) {
        return 0
    }
    return 1
}
