// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroShiftRight.cj
// EXEC: %compiler %cmp_macro macroShiftRight.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_parallel %f -o %output

import define.*

main() {
    var a = 1
    @ShiftRightAssign(a)
    @ShiftRight(5)
    @LeftRight(4)
    @GE(3)
    @LE(2)
    return 0
}
