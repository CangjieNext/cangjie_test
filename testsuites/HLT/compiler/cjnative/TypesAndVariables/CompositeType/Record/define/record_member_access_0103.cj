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

struct GenRec1 {
    public static let b: Int32 = GenRec2.foo()
    public static func foo(): Int32 {
        return 3
    }
}

public struct GenRec2 {
    public static let b: Int32 = GenRec1.foo()
    public static func foo(): Int32 {
        return 4
    }
}

main(): Int64 {
    var res1 = GenRec1.b
    var res2 = GenRec2.b
    if (res1 == 4 && res2 == 3) {
        return 0
    }
    return 1
}
