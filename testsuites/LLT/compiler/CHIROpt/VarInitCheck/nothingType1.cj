// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %disableSemaVic %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: scan-not not all the member variables are initialized in this constructor

var a: Array<Nothing> = []

main() {
    var b = 0
    while (b < 3) {
        b++
        a = [break, continue]
    }

    return a.size + b - 1
}
