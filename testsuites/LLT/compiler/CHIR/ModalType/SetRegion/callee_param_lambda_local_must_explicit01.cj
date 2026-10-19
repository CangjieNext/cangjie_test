// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %n.cj %dumpCHIRDebug -Woff unused -o %output
// RUN-EXEC: %run %run_opt %output
// EXEC: %python pick_defination.py callee_param_lambda_local_must_explicit01_CHIR/[0-9]*_Canonicalization.chirtxt "Func @_CN7default5outerHCNY_1CEQLE" | compare %f
// ASSERT: scan-1 StartRegion()
// ASSERT: scan-1 EndRegion()

// No local construction in `outer`: the value arrives as `c: C@local!`. Direct
// `f(c)` is illegal (external @local! to @local! param), so bind to a local
// `c2` first. Calling the lambda returns Unit (not a local value) and there is
// no local ctor Apply in `outer`, so StartRegion is required only because the
// lambda's formal is non-copyable `C@local!` (callee looked up through the
// LocalVar→Lambda path).
class C {
    init() {
        x = 3
    }
    exclave init(this @local!) {
        x = 7
    }
    var x: Int
}

func outer(c: C@local!) {
    let c2: C@local! = c
    let f = { x: C@local! => println(x.x) }
    f(c2)
}

main() {
    0
}
