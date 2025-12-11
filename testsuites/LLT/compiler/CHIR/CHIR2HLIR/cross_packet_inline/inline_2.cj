// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %enableO2 %f 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex @llvm.sqrt.f64
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex-not declare double @"_CN11std.math4sqrtEd"(double) gc "cangjie"

internal import std.math.*

main() {
    var a: Float64 = 123.123
    a = sqrt(a)
    println(a)
    return 0
}
