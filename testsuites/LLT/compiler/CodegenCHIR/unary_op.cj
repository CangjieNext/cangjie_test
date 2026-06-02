// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix

main() {
    let x = false
    let not_x = !x
    let y = 100
    let neg_y = -y
    if (not_x && neg_y == -100) {
        return 0
    } else {
        return 1
    }
}
