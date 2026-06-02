// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg
// EXEC:%compiler %compile_lib_opt pkg/pkg.cj -o pkg.%middle
// EXEC:%compiler pkg.%middle %n.cj -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan [][]
internal import pkg.*

main() {
    for (i in a) {
        print(i)
        test(i)
    }
    return 0
}
