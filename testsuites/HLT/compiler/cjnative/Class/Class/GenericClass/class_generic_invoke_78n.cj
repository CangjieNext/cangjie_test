/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

struct DataRec<T> {
    public let width: T
    public init(x: T) {
        width = x
    }
}

class Data<T> {
    public let rec: T
    public init(x: T) {
        rec = x
    }
}

func run(): Int64 {
    let dataRec: DataRec<Int32> = DataRec<Int32>(4)
    let data: Data<DataRec<T>> = Data<DataRec<Int32>>(dataRec)
    var res = data.rec
    if (res.width == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_undeclared_type_name
