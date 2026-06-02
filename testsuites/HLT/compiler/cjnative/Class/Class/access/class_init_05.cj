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

class GenRec {
    public var a: Int64
    public var b: Int32 = 1
    public init(x: Int64, y: Int32, str: String) {
        // this.a = x
        this(y, x)
        this.b = y
    }
    private init(x: Int32, y: Int64) {
        this.a = y
    }
}

main(): Int64 {
    var data2 = GenRec(3, 4, "1")
    if (data2.a == 3 && data2.b == 4) {
        return 0
    }
    return 1
}
