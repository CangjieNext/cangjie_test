// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func local(x: X) {
    if (x is J) {
        return 37
    }
    return 42
}

interface J {}

open class X {}

open class Y <: X {}

open class Z <: X & J {}

main() {
    if (local(Y()) == 42 && local(Z()) == 37) {
        return 0
    }
    return 1
}
