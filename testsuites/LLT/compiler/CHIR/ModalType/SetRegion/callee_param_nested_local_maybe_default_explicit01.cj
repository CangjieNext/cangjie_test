// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %n.cj %dumpCHIRDebug -Woff unused -o %output
// RUN-EXEC: %run %run_opt %output
// EXEC: %python pick_defination.py callee_param_nested_local_maybe_default_explicit01_CHIR/[0-9]*_Canonicalization.chirtxt "Func @_CN7default5outerHCNY_1CEQlE" | compare %f
// ASSERT: scan-2 StartRegion()
// ASSERT: scan-2 EndRegion()

// Nested func param is `C@local?` with a default. The call passes `c` explicitly,
// so the desugar is not applied at the call. Rule 3 still opens a region in
// `outer`; the other region is the default-value lambda's own `Allocate`.
class C {
    init() {
        x = 3
    }
    exclave init(this @local?) {
        x = 7
    }
    var x: Int
}

func outer(c: C@local?) {
    func f(x!: C@local? = C()) {
        println(x.x)
    }
    f(x: c)
}

main() {
    0
}
