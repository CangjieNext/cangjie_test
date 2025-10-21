/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: Hashable_01.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import stdx.syntax.*

// 节点的内容&源文件&解析方式完全相同
@Test
func test_hashable_001() {
    let res_1 = parseFile("./Hashable_01.cj")
    let sourcefile_1: SourceFile = res_1.node.getOrThrow()
    let sourcefile_2: SourceFile = sourcefile_1
    @Assert(sourcefile_1.hashCode() == sourcefile_2.hashCode())
    sourcefile_1.toString()
    sourcefile_1.hashCode() |> println
    @Assert(sourcefile_1.hashCode() == sourcefile_2.hashCode())
}
