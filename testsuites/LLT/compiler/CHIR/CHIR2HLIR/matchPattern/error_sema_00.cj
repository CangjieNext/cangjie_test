// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public let var1_1: Int16 = Int16(-51)

main(): Int64 {
    (try {
        Result<Int64>.Err(Exception("AnyString"))
    } finally {
    //do nothing
    } ?? Int64(match (var1_1) {
        case var1_2 | 1 => print("AnyString")
    }))
    return 0;
}
