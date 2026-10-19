// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %n.cj %dumpCHIRDebug -Woff unused -o %output
// RUN-EXEC: %run %run_opt %output
// EXEC: %python pick_defination.py lambda_type_local_maybe01_CHIR/[0-9]*_Canonicalization.chirtxt "Func @_CN7default2s1Hv" | compare %f
// ASSERT: scan-1 StartRegion()
// ASSERT: scan-1 EndRegion()

// SetMemRegion rule 5: a Lambda whose FuncType is @local? opens a region in the
// enclosing scope. The call result is Copyable Int64, so rules 1/3 do not fire.
func s1(): Int64 {
    let h: (() -> Int64) @ local? = { => 42 }
    let r = h()
    return r
}

main() {
    println(s1())
}
