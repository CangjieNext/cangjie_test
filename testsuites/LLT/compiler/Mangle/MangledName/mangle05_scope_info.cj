// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: B
// (DEBUG_OPTION)EXEC-PIPE:%compiler %cmp_opt %compile_lib_opt B/B.cj -o B.%middle
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %enableCompileDebug B.%middle %f -o %n.%suffix
// (DEBUG_OPTION)EXEC: %run %run_opt %n.%suffix
// (DEBUG_OPTION)EXEC-PIPE:%frontendCompiler %compile_lib_opt %cmp_opt B/B.cj --dump-ir 2>&1 | compare %f
// (CJNATIVE) ASSERT: regex _CN1B7Class_110func_outerHtE10func_innerIG_HG_
// (not CJNATIVE) ASSERT: regex _ZN1B7Class_110func_outer10func_innerIbS13.*b
// Test two func_inner exportID, should be different.

internal import B.*

main() {
    Class_1().func_outer(0)
    return 0
}
