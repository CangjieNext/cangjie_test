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
import std.convert.*
import std.convert.*
import std.io.*
/*
 * Test description: Test the funcs for DataModelBool
 * Test class:
 * public class DataModelBool <: DataModel
 */
@Test
class DataModelBoolTest {
    /*
     * Test description: Test DataModelBool ::serialization
     * Test API:
     * public init(bv: Bool)
     */
    @TestCase
    func testDataModelBoolInit(): Unit {
        DataModelBool(false)
        @Expect(true)
    }
    /*
     * Test description: Test DataModelBool ::serialization
     * Test API:
     * public func getValue(): Bool
     */
    @TestCase
    func testDataModelBoolGetValue(): Unit {
        @Expect(DataModelBool(false).getValue(),false)
    }
    /*
     * Test description: Test DataModelBool ::serialization
     * Test API:
     * func toJson(): JsonValue
     */
    @TestCase
    func testDataModelBoolToJson(): Unit {
        @Expect(DataModelBool(false).toJson().toString(),JsonBool(false).toString())
    }

    /*
     * Test description: Test DataModelBool ::serialization
     * Test API:
     * static func fromJson(jv: JsonValue): DataModel
     */
    @TestCase
    func testDataModelBoolFromJson(): Unit {
        @Expect(DataModel.fromJson(JsonBool(false)) is DataModelBool)
        let b: Bool = Bool.tryParse("true").getOrThrow()

        @Expect(b,true)
    }
}
