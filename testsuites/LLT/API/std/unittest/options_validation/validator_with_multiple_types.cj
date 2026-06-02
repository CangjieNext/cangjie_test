/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color

class A {}

struct B {}

@UnittestOption[A, Int64, String, (Float64, Bool)](opt1)

@UnittestOption[B](opt2)

@UnittestOption[Array<String>](opt3, { a: Array<String> => a.size == 1 })

@UnittestOption[Bool](opt4, { b: Bool => 
    match (b) {
        case true => return None<String>
        case false => return "wrong bool"
    }
})

@Test
@Configure[opt1: 42]
func foo1() {}

@Test
@Configure[opt1: "sdfsdfs"]
func foo2() {}

@Test
@Configure[opt1: A()]
func foo3() {}

@Test
@Configure[opt1: (1.0, false)]
func foo4() {}

@Test
@Configure[opt2: B()]
func boo1() {}

@Test
@Configure[opt3: ["ok"]]
func boo2() {}

@Test
@Configure[opt4: true]
func boo3() {}
