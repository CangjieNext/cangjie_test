/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class GenRec {
    public let b: Int32 = 1
    public init(str: String) {
        return GenRec("hi")
    }
}

main(): Int64 {
    var rec = GenRec("hi")
    if (rec.b == 1) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_mismatched_types
