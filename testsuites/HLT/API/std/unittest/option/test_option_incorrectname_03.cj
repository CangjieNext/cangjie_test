/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 

@Test
class Test_Option_Types {
    @TestCase
    @Configure[randomseed: 1]
    func test_running_param(): Unit {
    }
}
