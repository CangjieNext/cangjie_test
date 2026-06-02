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

main(): Int64 {
    return run()
}

class Data<T> {
    public let width: T
    public let length: T
    public init(widthin: T, lengthin: T) {
        width = widthin
        length = lengthin
    }
}

func run(): Int64 {
    let data: Data<Int32> = Data(3, 4)
    return 0
}
