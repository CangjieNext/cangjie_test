// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

internal import std.ast.*
import b.define_10026.*

main() {
    var a = quote(@X @Y var x : Int64 - 1 )
    a.dump()

    var b = quote(@YY)
    b.dump()

    var c = quote(\@YYY(1))
    c.dump()

    var d = quote(@XXXX[1]@YYYY[1](1))
    d.dump()

    return 0
}
