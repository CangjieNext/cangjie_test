/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-1: %run %run_opt %output %run_utest_opt

func reverse(s: String) {
    let temp = s.toRuneArray()
    temp.reverse()
    return String(temp)
}

@Test[s in random()]
func testC(s: String): Unit {
    @Expect(s != reverse(s))
}
// case from unittest_lib.md, if it's updated, pls update unittest_lib.md as well.
