// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Document that constant Float64 power expressions are not range propagated.
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not warning: unreachable

main() {
    const power: Float64 = 2.0 ** 3.0
    if (power < 0.0) { println("not propagated const power") }
}
