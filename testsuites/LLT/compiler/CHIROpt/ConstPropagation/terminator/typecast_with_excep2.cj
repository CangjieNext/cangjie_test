// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %enableConstPropagation %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: scan integer type conversion overflow

let gv: Int16 = 128

func foo() {
    try {
        Int8(gv)
    } catch (_) {
        Int8(16)
    }
}

main() {
    0
}
