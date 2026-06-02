// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt  -Woff unused %enableO2 %disableConstPropagation %f -o %output
// (DEBUG_OPTION)EXEC: %run %run_opt %output 2>&1 | compare %f

var globalVar: Int8 = 1

@OverflowThrowing
func test2() {
    return (99 + globalVar) * 3
}

main() {
    let x1 = test2()
    0
}

// ASSERT: scan OverflowException
