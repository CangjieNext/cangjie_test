// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %n.cj %dumpCHIRDebug -Woff unused -o %output
// RUN-EXEC: %run %run_opt %output
// EXEC: %python pick_defination.py callee_param_invoke_local_must01_CHIR/[0-9]*_Canonicalization.chirtxt "Func @_CN7default6callerHCNY_1IE" | compare %f
// ASSERT: scan-1 StartRegion()
// ASSERT: scan-1 EndRegion()
// ASSERT: scan Invoke(

// Instance virtual call (`Invoke`): GetRawCallee takes the DynamicDispatch branch.
// Abstract/open methods cannot carry optional params, so this uses `C@local!`
// (rule 2b via IsMustLocalRegion). The local ctor Apply in the same body also
// needs a region; the Invoke line is what guards the dispatch path.
class C {
    init() {
        x = 3
    }
    exclave init(this @local!) {
        x = 7
    }
    var x: Int
}

interface I {
    func use(x: C@local!): Unit
}

class A <: I {
    public func use(x: C@local!): Unit {
        println(x.x)
    }
}

func caller(p: I) {
    p.use(C())
}

main() {
    let p: I = A()
    caller(p)
}
