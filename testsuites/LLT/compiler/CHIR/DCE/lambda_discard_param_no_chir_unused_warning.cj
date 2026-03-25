// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Discard parameter `_` in a lambda must not trigger CHIR DCE unused-variable warning
// (same as for ordinary function parameters).

// EXEC: %compiler %f %cmp_opt 2>&1 | compare %f
// EXEC: %compiler %f -g %cmp_opt 2>&1 | compare %f
// EXEC: %compiler %f -O2 %cmp_opt 2>&1 | compare %f

main(): Int64 {
    let f = { _: Int64 => 123 }
    return f(0)
}

// ASSERT: scan-not warning
