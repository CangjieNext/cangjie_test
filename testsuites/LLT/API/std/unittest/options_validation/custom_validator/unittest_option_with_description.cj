/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color

@UnittestOption[Bool](opt1, "Some description")

@UnittestOption[String](opt2, { _: String => true  }, "Some description")

@UnittestOption[Int, Bool](opt3, "Some description", { _: Any => true })
