// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: sideeffect08.cj
// EXEC: %compiler sideeffect08.cj %compile_lib_opt -o sideeffect08.%middle
// EXEC-PIPE-0: %compiler %cmp_opt %f sideeffect08.%middle -o %output 
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan cntGet: 2
// ASSERT: scan cntSet: 1

import a.*

main() {
   foo()
}
