/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args -Woff=all

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import std.convert.*
import std.unittest.common.*
import stdx.unittest.data.*
import stdx.serialization.serialization.*

class Person <: Serializable<Person> & ToString & Equatable<Person> {
    Person(let n: UInt64, let name: String, let age: UInt32) {}

    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("n", DataModelString(n.toString())))
        dms.add(Field("name", DataModelString(name)))
        dms.add(Field("age", DataModelString(age.toString())))
        return dms
    }

    public static func deserialize(dm: DataModel): Person {
        var data: DataModelStruct = match (dm) {
            case dms: DataModelStruct => dms
            case _ => throw DataModelException("this data is not DataModelStruct")
        }

        let n = String.deserialize(data.get("n"))
        let name = String.deserialize(data.get("name"))
        let age = String.deserialize(data.get("age"))
        return Person(UInt64.parse(n), name, UInt32.parse(age))
    }

    public func toString(): String {
        return "Person(n: ${n}, name: ${name}, age: ${age})"
    }

    public operator func ==(rhs: Person): Bool {
        return this.n == rhs.n && this.name == rhs.name && this.age == rhs.age
    }

    public operator func !=(rhs: Person): Bool {
        return !(this == rhs)
    }
}

@Test
class Test_csv_strategy_custom_class {
    @TestCase[record in csv("./files/simple_lf.csv")]
    func test(record: Person): Unit {
        var expected = [Person(1, "Alex", 21), Person(2, "John", 28)]
        @Assert(expected.contains(record))
    }

    @TestCase[record in csv("./files/simple_lf.csv", skipRows: [ 1u64 ])]
    func testFirstRow(record: Person): Unit {
        var expected = Person(2, "John", 28)
        @Assert(expected, record)
    }

    @TestCase[record in csv("./files/simple_lf.csv", skipRows: [ 2u64 ])]
    func testSecondRow(record: Person): Unit {
        var expected = Person(1, "Alex", 21)
        @Assert(expected, record)
    }

    @TestCase[record in csv("./files/simple_lf.csv", skipRows: [ 0u64 ], header: [ "n", "name", "age" ])]
    func testCustomHeader(record: Person): Unit {
        var expected = [Person(1, "Alex", 21), Person(2, "John", 28)]
        @Assert(expected.contains(record))
    }
}
