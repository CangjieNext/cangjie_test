// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %f

interface I<CA> {
    static func of(data: Int64): CA

    static func create(data: Int64): ?CA {
        Some(of(data))
    }
}

struct S <: I<S> {
    S(let i: Int64) {}

    public static func of(data: Int64): S {
        S(data)
    }
}

main() {
    for (s in [1, 4, 7].iterator().filterMap(S.create)) {
        println("ok, ${s.i}")
    }
}
