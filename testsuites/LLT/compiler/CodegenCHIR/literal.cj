// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan-2 1

main() {
    let a1: VArray<Int64, $3> = [1, 2, 3]
    println(a1[0])
    let a2 = (1, 2, 3)
    println(a1[0])
    0
}
