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
    public var width: Int32 = 1
    public var length: Int32 = 2
    public init(width!: Int32 = 1, length!: Int32 = 2) {
        this.width = width
        this.length = length
    }
}

func run(): Int64 {
    let data: Data = Data()
    var res1: Int32 = data.width
    var res2: Int32 = data.length
    if (res1 == 1 && res2 == 2) {
        return 0
    }
    return 1
}
