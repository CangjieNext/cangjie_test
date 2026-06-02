// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    let z = 999
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
    let aa = 5000
    let bb = [50, 60, 70]
    let cc = A()
    let dd = EE1.EA
    let ee = EE2.EA
    let ff = EE3.EB(50)
    let gg = EE4.EB(A())
    let hh = EE5.EB(50)
    func foo() {
        let a = aa
        let b = bb
        let c = cc
        let d = dd
        let e = ee
        let f = ff
        let g = gg
        let h = hh
    }
    foo()
    return 0
}
