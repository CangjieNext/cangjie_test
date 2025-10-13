import std.convert.*
import std.core

open class Object <: core.Object {
    @OverflowSaturating
    func cjTest25922635463202419() { println("newfunc! No used! Just for Test")
    }
    @OverflowSaturating
    func cjTest25922635463218606() { println("newfunc! No used! Just for Test")
    }

}

main(): Int64 {
    return Int64(Float64.tryParse(0.toString()).getOrThrow())
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
