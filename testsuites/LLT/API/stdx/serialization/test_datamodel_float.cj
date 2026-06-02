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
import std.math.*
/*
 * Test description: Test the funcs for DataModelFloat
 * Test class:
 * public class DataModelFloat <: DataMode
 */
@Test
class DataModelFloatTest {
    /*
     * Test description: Test DataModelFloat ::serialization
     * Test API:
     * public init(fv: Float64)
     */
    @TestCase
    func testDataModelFloatInit(): Unit {
        DataModelFloat(250.250)
        DataModelFloat(250)
        DataModelFloat(222_222.0)
        DataModelFloat(-2.0)
        DataModelFloat(0)
        @Expect(true)
    }
    /*
     * Test description: Test DataModelFloat ::serialization
     * Test API:
     * public func getValue(): Float64
     */
    @TestCase
    func testDataModelFloatGetValue(): Unit {
        @Expect(DataModelFloat(250.250).getValue(),250.250)
    }

    /*
     * Test description: Test DataModelFloat ::serialization
     * Test API:
     * func toJson(): JsonValue
     */
    @TestCase
    func testDataModelFloatToJson(): Unit {
        @Expect(DataModelFloat(250.250).toJson().toString(),JsonFloat(250.250).toString())
        @Expect(DataModelFloat(Float64.Max).toJson().toString(),JsonFloat(Float64.Max).toString())
    }

    /*
     * Test description: Test DataModelFloat ::serialization
     * Test API:
     * static func fromJson(jv: JsonValue): DataModel
     */
    @TestCase
    func testDataModelFloatFromJson(): Unit {
        @Expect(DataModel.fromJson(JsonFloat(250.250)) is DataModelFloat)
    }
}
