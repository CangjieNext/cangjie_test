/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --no-color --filter="MySimpleTest.gg*" | compare %f
@Test
class MySimpleTest {
    @AfterAll
    public func aa(): Unit {
        println("aa")
    }

    @AfterEach
    public func ae(): Unit {
        println("ae")
    }

    @BeforeAll
    public func ba(): Unit {
        println("ba")
    }

    @BeforeEach
    public func be(): Unit {
        println("be")
    }

    @TestCase
    public func gga() {}

    @TestCase
    public func ggb() {}

    @TestCase
    public func ffh() {}
}

/* SCAN-IN
ba
be
ae
be
ae
aa
 */
