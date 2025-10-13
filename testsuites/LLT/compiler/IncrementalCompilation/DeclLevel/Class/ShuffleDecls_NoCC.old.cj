internal import std.convert.*


class B <: A < Rune, String > { }
extend C <: A < Rune, String > {
    public static func c() {
        '2'
    }

    public static func d() {
        "'2'"
    }
}
type A < T, k >= interfaceA < T, k >

func a(a: B) {
    return B().a(r'2').toString() + B().b("'2'") + C.c().toString() + C.d()
}
main(): Int64 {

    if(a(B()) == "2'2'2'2'") {
        return Int64(Float64.tryParse(0.toString()).getOrThrow())
    } else {
        return Int64(Float64.tryParse(1.toString()).getOrThrow())
    }
}
interface interfaceA < T, K > where T <: Any {
    func a(a: T) {
        a
    }

    func b(b: K) {
        b
    }
}
class C { }


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
