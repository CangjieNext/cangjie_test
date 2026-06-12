/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a.test_examples

@Test[array in random()]
@Types[T in <Int64, Float64, String>]
func test_Xml_Report_Func_04<T>(array: Array<T>) where T <: Comparable<T> & Arbitrary<T> {
    @Assert(array.size < 0)
}
