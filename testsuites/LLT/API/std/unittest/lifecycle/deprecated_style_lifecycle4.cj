/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --no-color | compare %f
@Test
class MinixingDeprecatedAndAnnotations {
    @BeforeAll
    protected func ba1(): Unit {
        println("ba1")
    }

    protected override func beforeAll(): Unit {
        println("ba2")
    }

    @BeforeAll
    protected func ba3(): Unit {
        println("ba3")
    }

    @AfterEach
    func ae1() {
        println("ae1")
    }

    protected func afterEach() {
        println("ae2")
    }

    @AfterEach
    func ae3() {
        println("ae3")
    }

    @TestCase
    public func t1() {}
}

/* SCAN-IN
ba1
ba2
ba3
ae1
ae2
ae3
 */
