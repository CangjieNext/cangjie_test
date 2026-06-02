/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC-PIPE: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color 

func cb(s: String) {
    s.size < 5
}

@UnittestOption[String](opt, cb)

@Test
@Configure[opt: "123"]
func test4() {}
