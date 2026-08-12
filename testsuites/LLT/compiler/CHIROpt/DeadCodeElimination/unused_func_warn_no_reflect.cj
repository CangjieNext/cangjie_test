// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for issue #987 (huge compiler slowdown in DeadCodeElimination).
// The fix hoists `ReflectPackageIsUsed(curPkg)` out of the per-function
// `ReportUnusedFunc` into `ReportUnusedCode`, so it is evaluated once per
// package instead of once per function. This case guards that, after the
// hoist, EVERY unused function is still reported exactly once when the
// reflect package is NOT used (usingReflectPackage == false branch).

// EXEC: %frontendCompiler %diag_json %f -o %output 2>&1 | compare %f
// ASSERT: scan-3 unused function:'

public func alpha(): Unit { println("a") }

public func beta(): Unit { println("b") }

func gamma(): Unit { println("c") }

main() {
    0
}
