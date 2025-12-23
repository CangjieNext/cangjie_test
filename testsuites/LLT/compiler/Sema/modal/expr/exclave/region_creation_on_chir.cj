// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// Test that a region is generated on CHIR when accessing global/member/static
// member/local func and when calling all kinds of funcs. Only assert compile and run.

let gGlobal: Int = 10
func globalFunc(): Int { 1 }

class F {
    init() {}
    init(this @local!) { exclave { } }
}
class C {
    var p: Int = 2
    func m(): Int { 3 }
    static var s: Int = 4
    static func sf(): Int { 5 }
}

func accessGlobalVar(): Int {
    let _ = F()
    exclave { gGlobal }
}
func accessGlobalFunc(): Int {
    let _ = F()
    exclave { globalFunc() }
}
func accessMemberField(): Int {
    let _ = F()
    exclave {
        let c = C()
        c.p
    }
}
func accessMemberFunc(): Int {
    let _ = F()
    exclave {
        let c = C()
        c.m()
    }
}
func accessStaticVar(): Int {
    let _ = F()
    exclave { C.s }
}
func accessStaticFunc(): Int {
    let _ = F()
    exclave { C.sf() }
}
func accessLocalFunc(): Int {
    let _ = F()
    func localF(): Int { 6 }
    exclave { localF() }
}

main(): Int {
    accessGlobalVar()
    accessGlobalFunc()
    accessMemberField()
    accessMemberFunc()
    accessStaticVar()
    accessStaticFunc()
    accessLocalFunc()
    0
}
