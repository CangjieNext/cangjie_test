// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// NOTE: TEST CHECKS THAR `private static const` IS EXPORTED IN CJO when compiling c.cj,
// AND INITIIALIZER IS GENERATED FOR IT WHEN COMPILING main.cj
//
// In march 2026 const evaluation happens after CHIR in BCHIR interpreter,
// but .cjo may already be serialized, so no way to save evaluated constant values,
// so it need to be re-evaluated (as part of optimization about `const` values inlining)

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir
package cmp

public common class A {
    public common init(a!: A = throw Exception()) {}
    private static const var_1769617886784_4501 : UInt32 = 194;
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj --output-type=dylib --common-part-cjo=cmp.cjo cmp.chir
package cmp

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor main.cj -L. -lcmp -o %output 2>&1
import cmp.*

main(): Unit {}

