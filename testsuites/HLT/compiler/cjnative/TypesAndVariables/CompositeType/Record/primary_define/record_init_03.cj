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

struct GenRec<T, V> {
    public var a: T
    public let b: T
    public GenRec(x: T, y: V) {
        this.a = x
        this.b = this.a
        this.c = y
    }
    public var c: V
}

main(): Int64 {
    var data = GenRec<Int64, Int32>(3, 4)
    if (data.a == 3 && data.b == 3 && data.c == 4) {
        return 0
    }
    return 1
}
