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

var c: Int32 = 0

struct R {
    public static func a(a: Int32) {
        c = 10 + a
    }

    public var b = a
    public init(b!: (Int32) -> Unit = a) {
        this.b = b
    }
}

main(): Int64 {
    var d = R().b
    d(3)
    return Int64(c - 13)
}
