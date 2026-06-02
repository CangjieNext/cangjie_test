/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: check_array.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt check_array.cj -o libcangjie-check.%middle
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -L. -lcangjie-check -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan Success

import A.*
import std.collection.*
import std.runtime.*

let tmpCheck: CheckArray = CheckArray()

class Test <: TestBase {
    public var t0: Int32 = 1
    ~init() {
        tmpCheck.SetIndex(index)
    }
}

struct TestRecord1 {
    public var v1: Int64 = 1
    public var v2: Int8 = 2
    public var v3: Int16 = 3
    public var r1: Test = CreateAndRegisterObject()
    public var r2: Test = CreateAndRegisterObject()
    public var v4: Int64 = 4
    public var v5: Int32 = 5
    public var r3: Test = CreateAndRegisterObject()
    public var v6: Int64 = 6
    public var r4: Test = CreateAndRegisterObject()
    public var v7: Int64 = 7
    public var r5: Test = CreateAndRegisterObject()
    public var v8: Int32 = 8
    public var r6: Test = CreateAndRegisterObject()
    public var v9: Int16 = 9
    public var r7: Test = CreateAndRegisterObject()
    public var r8: Test = CreateAndRegisterObject()
    public var v10: Float32 = 10.0
    public var v11: Float32 = 11.0
    public var v12: Int64 = 12
    public var r9: Test = CreateAndRegisterObject()
    public var r10: Test = CreateAndRegisterObject()
    public var r11: Test = CreateAndRegisterObject()
    public var r12: Test = CreateAndRegisterObject()
    public var v13: Float64 = 13.0
}

struct TestRecord2 {
    public var v1: Int64 = 1
    public var v2: Int8 = 2
    public var v3: Int16 = 3
    public var v4: Int64 = 4
    public var v5: Int32 = 5
    public var v6: Int64 = 6
    public var v7: Int64 = 7
    public var v8: Int32 = 8
    public var v9: Int16 = 9
    public var v10: Float32 = 10.0
    public var v11: Float32 = 11.0
    public var v12: Int64 = 12
    public var v13: Float64 = 13.0
}

let registerObjIndexList = ArrayList<Int64>()
var globalObject: Test = Test()
var globalRcd1: TestRecord1 = TestRecord1()
var globalRcd2: TestRecord2 = TestRecord2()

class TestObject {
    public static var staticObjectField: Object = CreateAndRegisterObject()
    public static var staticRcdField1: TestRecord1 = TestRecord1()
    public static var staticRcdField2: TestRecord2 = TestRecord2()
    public var rcdField1: TestRecord1 = TestRecord1()
    public var rcdField2: TestRecord2 = TestRecord2()
}

func CreateAndRegisterObject(): Test {
    var obj = Test()
    registerObjIndexList.add(tmpCheck.RegisterIndex(obj))
    return obj
}

func CheckAllRegisterObjsAlive(): Bool {
    for (index in registerObjIndexList) {
        if (tmpCheck.CheckItem(index)) {
            return false
        }
    }
    return true
}

main(): Int64 {
    registerObjIndexList.clear()

    globalObject = CreateAndRegisterObject()
    TestObject.staticObjectField = CreateAndRegisterObject()

    globalRcd1 = TestRecord1()
    TestObject.staticRcdField1 = TestRecord1()

    globalRcd2 = TestRecord2()
    TestObject.staticRcdField2 = TestRecord2()

    GC()
    if (CheckAllRegisterObjsAlive()) {
        print("Success\n")
    } else {
        print("fail: objs are not freed after GC!\n")
    }
    return 0
}
