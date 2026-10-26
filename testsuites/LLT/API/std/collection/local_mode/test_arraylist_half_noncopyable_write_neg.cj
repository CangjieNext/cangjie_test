/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXPECTED-COMPILE-FAIL (T425): ArrayList<String> @local? index assignment has no satisfying local? setter
// EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.collection.*

func rejectHalfReferenceWrite(list: ArrayList<String> @local?): Unit {
    list[0] = "x"
}

main(): Int64 {
    0
}
