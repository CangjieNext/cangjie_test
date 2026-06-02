// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %f %cmp_opt | compare %f

main() {
    for (i in 1..100) {
        if (i % 2 == 0) {
            continue
        }
    }
    for (i in 1..=100) {
        if (i % 2 == 0) {
            continue
        }
    }
}

// ASSERT: scan-not unreachable block
