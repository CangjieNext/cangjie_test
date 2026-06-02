/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan eprint1eprint2eprintln
// ASSERT: scan eprintAeprintlnA
// ASSERT: scan 仓颉编程语言是一款面向全场景智能的新一代编程语言，主打原生智能化、天生全场景、高性能、强安全。仓颉编程语言是一款面向全场景智能的新一代编程语言，主打原生智能化、天生全场景、高性能、强安全。

@Test
class PrintTest {
    @TestCase
    func test_eprint(): Unit {
        eprint("eprint1", flush: true)
        eprint("eprint2")
        eprintln("eprintln")

        eprint<A>(A("eprintA"))
        eprintln<A>(A("eprintlnA"))

        let str = "仓颉编程语言是一款面向全场景智能的新一代编程语言，主打原生智能化、天生全场景、高性能、强安全。"
        eprint(str)
        eprintln(str)
    }
}

class A <: ToString {
    A(let x: String) {}

    public func toString(): String {
        x
    }
}
