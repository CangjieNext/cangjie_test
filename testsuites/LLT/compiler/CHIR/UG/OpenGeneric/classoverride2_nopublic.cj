// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %f %cmp_opt

interface I {
    func f<T>(a: T): T
}

class C <: I {
    func f<T>(a: T): T {
        a
    }
}

main() {
}

// ASSERT: scan error: a deriving member must be at least as visible as its base member
