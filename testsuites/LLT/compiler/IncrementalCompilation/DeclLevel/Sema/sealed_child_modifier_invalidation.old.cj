// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

abstract sealed class Root {}

class A <: Root {}
class B <: Root {}

func f(v: Root): Int64 {
    return match (v) {
        case _: A => 0
        case _ => 1
    }
}

main(): Int64 {
    return f(A())
}
