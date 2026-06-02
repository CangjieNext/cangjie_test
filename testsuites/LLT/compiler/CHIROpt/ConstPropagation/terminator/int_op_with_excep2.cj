// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %enableConstPropagation %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: scan divide by zero

func foo() {
    try {
        let a: Int8 = 127
        let b: Int8 = 0
        a / b
    } catch (_) {
        Int8(16)
    }
}

main() {
    0
}
