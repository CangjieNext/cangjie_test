/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %cmp_utest_opt %f -o %output

@Test
@BeforeAll
public func test_modify_testing_function1():Unit {
    var count = 0
    @Assert(count, 0)
}

@Test
@BeforeEach
public func test_modify_testing_function2():Unit {
    var count = 0
    @Assert(count, 0)
}

@Test
@AfterAll
public func test_modify_testing_function3():Unit {
    var count = 0
    @Assert(count, 0)
}

@Test
@AfterEach
public func test_modify_testing_function4():Unit {
    var count = 0
    @Assert(count, 0)
}
// ASSERT: scan macro_evaluate_failed
