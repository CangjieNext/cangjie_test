// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../src/src00/p1 ../../src/src00/main_p1.cj
//  EXEC:%frontendCompiler -p %compile_lib_opt p1 --apc=1
// (not CJNATIVE) EXEC:%frontendCompiler -p %compile_lib_opt p1
// EXEC:%compiler main_p1.cj p1.bc -o %output
// EXEC:%run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello cangjie!
