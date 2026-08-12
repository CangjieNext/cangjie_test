// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for issue #987 (huge compiler slowdown in DeadCodeElimination).
// After hoisting `ReflectPackageIsUsed(curPkg)` out of the per-function
// `ReportUnusedFunc`, the reflect-package suppression must keep the SAME
// behaviour: when the reflect package is used (usingReflectPackage == true),
// a PUBLIC unused function is NOT reported (it may be reached via reflection),
// while a non-public unused function is still reported. The positive
// `internalUnused` assertion also guards against a false pass where the whole
// unused-code reporting was skipped.

// EXEC: %frontendCompiler %diag_json %f -o %output 2>&1 | compare %f
// ASSERT: scan-not unused function:'reflectablePublic'
// ASSERT: scan-1 unused function:'internalUnused'

package reflectPkg

import std.reflect.*

// public + reflect used  -> reachable via reflection -> must NOT be reported
public func reflectablePublic(): Unit { println("pub") }

// non-public + unused    -> reflect suppression does not apply -> reported
func internalUnused(): Unit { println("internal") }

public class MyData {
    public func foo(): Int64 { 0 }
}

main() {
    let t = TypeInfo.of<MyData>()
    let f = t.getInstanceFunction("foo", [])
    f.apply(MyData())
    0
}
