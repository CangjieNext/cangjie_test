// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %n.cj %dumpCHIRDebug -o %output
// RUN-EXEC: %run %run_opt %output
// EXEC: %python pick_defination.py callee_param_local_maybe_default_nested01_CHIR/[0-9]*_Canonicalization.chirtxt "Func @_CN7default5outerHv" | compare %f
// ASSERT: scan StartRegion()
// ASSERT: scan EndRegion()

// Nested callee with `local?`+default. After CC it is a Function, so GetRawCallee
// sees it and `outer` must open a region when calling `inner()`.
class C {
    init() {
        x = 3
    }
    exclave init(this @local?) {
        x = 7
    }
    var x: Int
}

func outer() {
    func inner(x!: C@local? = C()) {
        println(x.x)
    }
    inner()
}

main() {
    outer()
}
