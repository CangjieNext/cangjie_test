// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_lib %f -o %output
// EXEC: %run %run_opt %output %run_args

import CCC.*

@M1
enum EC1 {
    | XY | XYZ(Int64)
}

var bc1 = EM1.XY
var bc2 = EM1.XYZZ
var bc3 = bc2.ff1()

main() {
    return bc3 - 2
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
