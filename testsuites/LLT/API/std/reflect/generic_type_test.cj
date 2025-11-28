/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

package foo
import std.reflect.*
import std.collection.*

class NestedGenericC1<T> {
    public var value: T
    public init(val: T) {
        this.value = val
    }
}
class NestedGenericC2<U> {
    public var value: U
    public init(val: U) {
        this.value = val
    }
}
class NestedGenericC<T, U> {
    public var first: T
    public var second: U
    public init(f: T, s: U) {
        this.first = f
        this.second = s
    }
}

@Test
class GenericTypeInfoTest {
    @TestCase
    func testGenerics(): Unit {
        let arr = Array<HashMap<String, Array<ArrayList<HashMap<Int64, Object>>>>>()
        let t1 = TypeInfo.get(
            "Array<std.collection.HashMap<String, Array<std.collection.ArrayList<std.collection.HashMap<Int64, Object>>>>>")
        let t2 = TypeInfo.get(
            "std.core.Array<std.collection.HashMap<std.core.String, std.core.Array<std.collection.ArrayList<std.collection.HashMap<Int64, std.core.Object>>>>>")
        let t3 = TypeInfo.get(
            "std.core.Array<std.collection.HashMap<std.core.String,std.core.Array<std.collection.ArrayList<std.collection.HashMap<Int64,std.core.Object>>>>>")
        @Expect(TypeInfo.of(arr), t1)
        @Expect(TypeInfo.of(arr), t2)
        @Expect(TypeInfo.of(arr), t3)
    }

    @TestCase
    func typeInfoParsesNestedGenericArgsForLocalTypes(): Unit {
        let typeName =
            "foo.NestedGenericC<foo.NestedGenericC1<Int64>, foo.NestedGenericC2<String>>"
        let fromName = TypeInfo.get(typeName)
        let fromType = TypeInfo.of<NestedGenericC<NestedGenericC1<Int64>, NestedGenericC2<String>>>()
        @Expect(fromName, fromType)
        @Expect(fromName.qualifiedName, typeName)
    }
}
