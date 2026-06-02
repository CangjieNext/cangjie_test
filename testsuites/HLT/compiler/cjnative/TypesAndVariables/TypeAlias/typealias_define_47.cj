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

struct RecordData<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

type RD<T> = RecordData<T>

main(): Int64 {
    var struct1: RD<Int32> = RecordData<Int32>(2)
    var struct2: RecordData<Int32> = RecordData<Int32>(2)
    if (struct1.a == struct2.a) {
        return 0
    }
    return 1
}
