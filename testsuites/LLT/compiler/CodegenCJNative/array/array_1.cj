// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen --apc=1 %f 2>&1 | compare %f

// ASSERT: regex-1 private unnamed_addr constant \[1 x i1\] \[i1 true\], align 1
// ASSERT: regex-1 private unnamed_addr constant \[2 x i1\] \[i1 true, i1 false\], align 1

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var var_1: VArray<Bool, $1> = [true]
var var_2: Array<Bool> = [true, false]
var var_3: VArray<Bool, $1> = [true]
var var_4: Array<Bool> = [true, false]

main() {
    println(var_1[0])
    println(var_2[0])
    0
}
