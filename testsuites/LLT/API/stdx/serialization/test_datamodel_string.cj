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
/*
 * Test description: Test the funcs for DataModelString
 * Test class:
 * public class DataModelString <: DataModel
 */
@Test
class DataModelStringTest {
    /*
     * Test description: Test DataModelString ::serialization
     * Test API:
     * public init(sv: String)
     */
    @TestCase
    func testDataModelStringInit(): Unit {
        DataModelString("test String!")
        @Expect(true)
    }
    /*
     * Test description: Test DataModelString ::serialization
     * Test API:
     * public func getValue(): String
     */
    @TestCase
    func testDataModelStringGetValue(): Unit {
        @Expect(DataModelString("test String!").getValue(),"test String!")
    }

    /*
     * Test description: Test DataModelString ::serialization
     * Test API:
     * func toJson(): JsonValue
     */
    @TestCase
    func testDataModelStringToJson(): Unit {
        @Expect(DataModelString("test String!").toJson().toString(),JsonString("test String!").toString())
        @Expect(DataModelString("\\\\\\").toJson().toString(), JsonString("\\\\\\").toString())
        @Expect(DataModelString("`").toJson().toString(), JsonString("`").toString())
        @Expect(DataModelString(#"\\"#).toJson().toString(),  JsonString(#"\\"#).toString())
    }

    /*
     * Test description: Test DataModelString ::serialization
     * Test API:
     * static func fromJson(jv: JsonValue): DataModel
     */
    @TestCase
    func testDataModelStringFromJson(): Unit {
        @Expect(DataModel.fromJson(JsonString("test String!")) is DataModelString)
    }
}
