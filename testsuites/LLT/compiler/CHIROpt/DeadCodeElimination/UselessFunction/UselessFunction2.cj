// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0
 
// DEPENDENCE: pkg.cj UselessFunction.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC: %frontendCompiler %dumpCHIRDebug -Woff all UselessFunction.cj -o %n.%suffix -g -j1
// (not Windows) EXEC: %cat %n\_CHIR/[0-9]*\_RemoveUnusedImports.chirtxt 2>&1 | compare %f
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC: %frontendCompiler %dumpCHIRDebug -Woff all UselessFunction.cj -o %n.%suffix -j1
// (not Windows) EXEC: %cat %n\_CHIR/[0-9]*\_RemoveUnusedImports.chirtxt 2>&1 | compare %f
 
// (not Windows) ASSERT: scan @_CN7default2C03fooHv
// (not Windows) ASSERT: scan @_CN7default2C1IG_E3fooHv
// (not Windows) ASSERT: scan @_CN7default2C23fooIG_Hv
// (not Windows) ASSERT: scan @_CN7default2C23gooHv
// (not Windows) ASSERT: scan @_CN7default2C33fooHv
// (not Windows) ASSERT: scan @_CN7default2C33barHv