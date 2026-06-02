/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import stdx.serialization.serialization.*
import stdx.encoding.json.*
import std.collection.*
/*
 * Test description: Test the funcs for DataModelString
 * Test class:
 * public class DataModelString <: DataModel
 */
@Test
class DataModelSeqTest {
    /*
     * Test description: Test DataModelSeq ::serialization
     * Test API:
     * public init()
     * public init(list: ArrayList<DataModel>)
     */
    @TestCase
    func testDataModelSeqInit(): Unit {
        DataModelSeq()
        DataModelSeq(ArrayList<DataModel>([DataModelBool(false)]))
        @Expect(true)
    }
    /*
     * Test description: Test DataModelSeq ::serialization
     * Test API:
     * public func getItems(): ArrayList<DataModel>
     */
    @TestCase
    func testDataModelSeqGetItems(): Unit {
        @Expect(DataModelSeq().getItems().size,JsonArray().size())
    }
    /*
     * Test description: Test DataModelSeq ::serialization
     * Test API:
     * public func add(dm: DataModel)
     */
    @TestCase
    func testDataModelSeqAdd(): Unit {
        DataModelSeq(ArrayList<DataModel>([DataModelBool(false)])).add(DataModelBool(false))
        @Expect(true)
    }

    /*
     * Test description: Test DataModelSeq ::serialization
     * Test API:
     * public func add(dm: DataModel)
     */
    @TestCase
    func testDataModelSeqToJson(): Unit {
        @Expect(DataModelSeq(ArrayList<DataModel>([DataModel.fromJson(JsonString("250"))])).toJson().toString(),#"["250"]"#)
        @Expect(DataModelSeq(ArrayList<DataModel>([DataModel.fromJson(JsonBool(false))])).toJson().toString(),  #"[false]"#)
        @Expect(DataModelSeq(ArrayList<DataModel>([HashMap<String, Int32>([("1", 3),("2", 6),("3", 9)]).serialize()])).toJson().toString(),  #"[{"1":3,"2":6,"3":9}]"#)
    }

    /*
     * Test description: Test DataModelSeq ::serialization
     * Test API:
     * public func add(dm: DataModel)
     */
    @TestCase
    func testDataModelSeqFromJson(): Unit {
        @Expect(DataModel.fromJson(JsonString("250"))is DataModelString)
    }
}
