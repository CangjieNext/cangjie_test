/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color

// NOTE: this test file contains only valid use cases

@UnittestOption[String](option1)

@UnittestOption[String, Int](option2)

@UnittestOption[(Bool, Bool), CustomClass](option3)

@UnittestOption[String](option4, { str: String => str.size < 5 })

@UnittestOption[(String) -> Bool](option5)

class CustomClass {}

@Test
@Configure[option1 : "x"]
func foo1() {}

@Test
@Configure[option2 : 1]
func foo2() {}

@Test
@Configure[option3 : (true, false)]
func foo3() {}

@Test
@Configure[option4 : "xx"]
func foo4() {}

func foo(_: String) {
    true
}

@Test
@Configure[option5 : foo]
func foo5() {}