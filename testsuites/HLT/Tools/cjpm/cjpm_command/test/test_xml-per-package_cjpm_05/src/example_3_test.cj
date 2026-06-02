/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

@Test
public class Xml_Report_Class_03 {
    @TestCase[
        ele in [0, 1, 2]
    ]
    func test_Xml_Report_Func_04(ele: Int64): Unit {
        println(ele)
    }
}