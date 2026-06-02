// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// EXEC: %run %run_opt %n.%suffix

public struct Record15 {
    var var300: Unit = ();
    var var332: Int64 = 112;
}

main(): Int64 {
    let var24: Record15 = Record15();
    if (var24.var332 != 112) {
        return 1
    }
    return 0;
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
