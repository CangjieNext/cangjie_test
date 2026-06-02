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
    public var b: Int32 = 1
    public var c: Int64 = 2
    public init(str: String) {
        this()
    }
    public init() {
        this.b = 1
        this.c = 3
    }
}

main(): Int64 {
    var rec = GenRec("hi")
    if (rec.c == 3) {
        return 0
    }
    return 1
}
