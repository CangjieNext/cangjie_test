/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXPECTED-COMPILE-FAIL: T129 heap Array<Int64> cannot be assigned directly to Array<Int64> @local! slot
// DISABLED-EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args
//
// This is a single intentional T129 mode negative. A heap value cannot be silently
// reclassified as a local! value; callers must use a local-mode constructor/copy path.

main(): Int64 {
    let heap: Array<Int64> = [1, 2]
    let localBang: Array<Int64> @local! = heap
    0
}
