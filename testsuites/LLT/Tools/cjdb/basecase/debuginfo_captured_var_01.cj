// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    var z = 999
}

enum EE1 {
    EA | EB
}

enum EE2 {
    EA
}

enum EE3 {
    EA | EB(Int64)
}

enum EE4 {
    EA | EB(A)
}

enum EE5 {
    EA | EB(Int64) | EC
}


main() {
    var aa = 5000
    var bb = [50, 60, 70]
    var cc = A()
    var dd = EE1.EA
    var ee = EE2.EA
    var ff = EE3.EB(50)
    var gg = EE4.EB(A())
    var hh = EE5.EB(50)
    func foo() {
        var a = aa
        var b = bb
        var c = cc
        var d = dd
        var e = ee
        var f = ff
        var g = gg
        var h = hh
    }
    foo()
    return 0
}
