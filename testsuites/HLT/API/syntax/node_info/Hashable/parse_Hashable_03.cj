/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: Hashable_01.cj, Hashable_02.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import std.fs.*
import stdx.syntax.*

// 节点的内容相同，源文件不�
@Test
class test_01{
    @TestCase
func test_hashable_003() {
    let res_1 = parseFile("./Hashable_01.cj")
    let sourcefile_1: SourceFile = res_1.node.getOrThrow()
    let res_2 = parseFile("./Hashable_02.cj")
    let sourcefile_2: SourceFile = res_2.node.getOrThrow()
    @Assert(File.readFrom("./Hashable_01.cj"), File.readFrom("./Hashable_02.cj"))
    @Assert(sourcefile_1.hashCode() != sourcefile_2.hashCode())
}
}