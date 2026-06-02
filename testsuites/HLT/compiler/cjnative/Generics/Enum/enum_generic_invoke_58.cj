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

struct DataRec<T> {
    public let width: T
    public init(x: T) {
        width = x
    }
}

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    let dataRec: DataRec<Int32> = DataRec<Int32>(4)
    var time = Time<DataRec<Int32>>.Day(dataRec)
    var res: Int32 = match (time) {
        case Day(x) => x.width
    }
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
