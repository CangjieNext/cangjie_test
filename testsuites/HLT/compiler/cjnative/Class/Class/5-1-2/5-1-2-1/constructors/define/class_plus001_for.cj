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

class Data {
    public let width: Int32
    public let length: Int32
    public init(x: Int32, y: Int32) {
        width = x
        length = y
    }
}

func run(): Int64 {
    var data: Data
    var width: Int32 = 0
    var length: Int32 = 0
    let rows: Array<Int32> = [2]
    for (number in rows) {
        data = Data(number, number)
        print(data.width.toString() + "\n")
        width = data.width
        length = data.length
    }
    if (width == 2 && length == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
