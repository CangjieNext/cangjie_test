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
    public let width: Int32
    public let length: Int32
    public init(x: Int32, y: Int32) {
        width = x
        length = y
    }
}

let data: Data = Data(2, 3)
var width: Int32 = data.width
var length: Int32 = data.length

func run(): Int64 {
    if (width == 2 && length == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
