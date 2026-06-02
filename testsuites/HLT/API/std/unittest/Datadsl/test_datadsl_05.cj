/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./users.json
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan x = User(Mike, 4)

import std.unittest.*
import std.unittest.testmacro.*
import stdx.encoding.json.*
import stdx.serialization.serialization.*
import stdx.unittest.data.*

class User <: Serializable<User> & ToString {
    User(let name: String, let age: Int64) {}

    public func serialize(): DataModel {
        let result = DataModelStruct()
        result.add(Field("name", DataModelString(name)))
        result.add(Field("age", DataModelInt(age)))
        return result
    }

    public static func deserialize(dm: DataModel): User {
        match (dm) {
            case dms: DataModelStruct =>
                let name = (dms.get("name") as DataModelString ?? throw Exception()).getValue()
                let age = (dms.get("age") as DataModelInt ?? throw Exception()).getValue()
                return User(name, age)
            case _ => throw Exception()
        }
    }

    public func toString():String {
        "User(${name}, ${age})"
    }
}

@Test[x in json("users.json")]
func testMe(x: User): Unit {
    @Expect(x.name.size != x.age)
}
