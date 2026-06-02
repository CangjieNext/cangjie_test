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

struct DataRec {
    public var width: Int32 = 3
    public init(width!: Int32 = 3) {
        this.width = width
    }
}

class Data<T> {
    public let rec: T
    public init(x: T) {
        rec = x
    }
}

func run(): Int64 {
    let dataRec: DataRec = DataRec()
    let data: Data<DataRec> = Data<DataRec>(dataRec)
    var res: DataRec = data.rec
    if (res.width == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
