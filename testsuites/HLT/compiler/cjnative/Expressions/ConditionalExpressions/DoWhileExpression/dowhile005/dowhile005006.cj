/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not O2) ERRCHECK: %compiler %cmp_opt %f -o %output

func foo() {
    var a: Int32
    do {
        if (true) {
            continue
        }
        a = 1
    } while (a == 0)
}

main() {
    0
}
// ASSERT: scan sema_used_before_initialization
