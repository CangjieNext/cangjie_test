// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class C {
    var a = 10
    var b = "HHH"
    var c = [1, 2, 3]
    var d: (S, E)
    init(s: S, e: E) {
        d = (s, e)
    }
}

struct S {
    var e = 10
    var f: String
    init(str: String) {
        f = str
    }
}

enum E {
    En | En(Int64)
}

main() 
{
    var SS = S("2.5")
    var EE = En(500)
    var CC = C(SS, EE)
    0
}
