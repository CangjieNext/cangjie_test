// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %n.cj %dumpCHIRDebug -o %output
// RUN-EXEC: %run %run_opt %output
// EXEC: %python pick_defination.py callee_param_local_maybe_default_generic01_CHIR/[0-9]*_Canonicalization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// ASSERT: scan-1 StartRegion()
// ASSERT: scan-1 EndRegion()

// Instantiated call of a generic callee (Apply to `f<Int64>`). SetMemRegion runs in
// Canonicalization (before O2); GetRawCallee uses GetGenericDecl() so the
// `local?`+default rule still applies at the call site in `main`.
class C {
    init() {
        x = 3
    }
    exclave init(this @local?) {
        x = 7
    }
    var x: Int
}

func f<T>(x!: C@local? = C()) {
    println(x.x)
}

main() {
    f<Int64>()
}
