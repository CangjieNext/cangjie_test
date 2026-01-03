/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: Equatable_01.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import stdx.syntax.*

// 节点的内容相同，不是来自于同�次解�
@Test
class test_01{
    @TestCase
func test_equatable_002() {
    let res_1 = parseFile("./Equatable_01.cj")
    let sourcefile_1: SourceFile = res_1.node.getOrThrow()
    let res_2 = parseFile("./Equatable_01.cj")
    let sourcefile_2: SourceFile = res_2.node.getOrThrow()
    @Assert(sourcefile_1 != sourcefile_2)
}
}