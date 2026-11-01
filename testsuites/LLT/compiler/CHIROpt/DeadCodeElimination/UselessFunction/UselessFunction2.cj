// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py pkg.cj UselessFunction.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC: %frontendCompiler %enableO2 %dumpCHIRDebug -Woff unused UselessFunction.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_MergingBlockAfterUnreachableBlock.chirtxt" WHOLE | compare %f
// Before UselessFuncElimination, private unused methods are still present.
// ASSERT: scan srcCodeIdentifier: foo
// ASSERT: scan srcCodeIdentifier: goo
// ASSERT: scan srcCodeIdentifier: bar
