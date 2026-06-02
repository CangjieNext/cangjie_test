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

struct GenRec {
    public var a: Int64
    public GenRec(x: Int64, y: Int32, str: String) {
        var x1 = x + 1
        this.a = x1
    }
    public var b: Int32 = 1
}

main(): Int64 {
    var data2 = GenRec(3, 4, "1")
    if (data2.a == 4 && data2.b == 1) {
        return 0
    }
    return 1
}
