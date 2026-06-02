// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg
// EXEC:%compiler %enableCompileDebug %compile_lib_opt pkg/pkg.cj -o pkg.%middle
// EXEC:%compiler %enableCompileDebug pkg.%middle %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import pkg.*

main(): Int64 {
    if (Tensor.val == 1) {
        return 0
    }
    1
}
