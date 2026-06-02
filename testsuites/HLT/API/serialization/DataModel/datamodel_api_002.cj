/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.serialization.serialization.*
import std.collection.*
import stdx.encoding.json.*
import std.unittest.*

@Test
public class Test_DataModelBool_02 {
    @TestCase
    func test_DataModelBool_01(): Unit {
        let bool = DataModelBool(true)
        @Expect(bool.getValue(),true)
        let int = DataModelInt(123)
        @Expect(int.getValue(),123)
        let float = DataModelFloat(456.0)
        @Expect(float.getValue(),456.0)
        let str = DataModelString("cangjie")
        @Expect(str.getValue(),"cangjie")
    }

    @TestCase
    func test_DataModelBool_02(): Unit {
        let bool = DataModelBool(true)
        let seq = DataModelSeq()
        @Expect(seq.getItems().size,0)
        seq.add(bool)
        @Expect(seq.getItems().size,1)
    }

    @TestCase
    func test_DataModelBool_03(): Unit {
        var buf = ArrayList<DataModel>([DataModelBool(true), DataModelInt(123), DataModelFloat(456.0)])
        let bool = DataModelBool(true)
        let seq = DataModelSeq(buf)
        @Expect(seq.getItems().size,3)
        seq.add(bool)
        @Expect(seq.getItems().size,4)
    }
}
