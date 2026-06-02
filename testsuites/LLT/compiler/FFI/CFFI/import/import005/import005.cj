// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.a.cj

// EXEC-1: %compiler %clang_opt --verbose %n.a.cj -o %n.a.%middle

package test

internal import A.*

main(): Int64 {
    unsafe {
        f5((), 1)
    }
    return 0
}
