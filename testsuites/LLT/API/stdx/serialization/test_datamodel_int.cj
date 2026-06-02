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
 * Test description: Test the funcs for DataModelInt
 * Test class:
 * public class DataModelInt <: DataModel
 */
@Test
class DataModelIntTest {
    /*
     * Test description: Test DataModelInt ::serializatiopn
     * Test API:
     * public init(bv: Bool)
     */
    @TestCase
    func testDataModelIntInit(): Unit {
        DataModelInt(10)
        @Expect(true)
    }
    /*
     * Test description: Test DataModelInt ::serialization
     * Test API:
     * public func getValue(): Bool
     */
    @TestCase
    func testDataModelIntGetValue(): Unit {
        @Expect(DataModelInt(250).getValue(),250)
    }

    /*
     * Test description: Test DataModelInt ::serialization
     * Test API:
     * func toJson(): JsonValue
     */
    @TestCase
    func testDataModelIntToJson(): Unit {
        @Expect(DataModelInt(10).toJson().toString(),JsonInt(10).toString())
    }

    /*
     * Test description: Test DataModelInt ::serialization
     * Test API:
     * static func fromJson(jv: JsonValue): DataModel
     */
    @TestCase
    func testDataModelIntFromJson(): Unit {
        @Expect(DataModel.fromJson(JsonInt(250)) is DataModelInt)
    }
}
