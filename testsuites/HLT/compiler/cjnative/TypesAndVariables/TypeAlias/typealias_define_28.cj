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

struct RecordData {
    public var i: Int32 = 2
}

type RD = RecordData

main(): Int64 {
    var struct1: RD = RecordData()
    var struct2: RecordData = RecordData()
    if (struct1.i == struct2.i) {
        return 0
    }
    return 1
}
