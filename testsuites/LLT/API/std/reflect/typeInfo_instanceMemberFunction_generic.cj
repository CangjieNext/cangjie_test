/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1
import std.reflect.*
import std.sort.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

public class NonGenericClass {}

public class GenericClassWith1TypeParameters<TypeGeneric_0> <: Equatable<GenericClassWith1TypeParameters<TypeGeneric_0>> {
    public operator func ==(i: GenericClassWith1TypeParameters<TypeGeneric_0>): Bool {
        true
    }
    public operator func !=(i: GenericClassWith1TypeParameters<TypeGeneric_0>): Bool {
        false
    }
}

public class GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_1> <: Equatable<GenericClassWith2TypeParameters<TypeGeneric_0,
    TypeGeneric_1>> {
    public operator func ==(i: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_1>): Bool {
        true
    }
    public operator func !=(i: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_1>): Bool {
        false
    }
}

public class StandardClassType<TypeGeneric_0, TypeGeneric_1, TypeGeneric_2> {
    public static func staticFunction_1(parameter_2: NonGenericClass,
        parameter_3: GenericClassWith2TypeParameters<Unit, Unit>,
        parameter_4: GenericClassWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): Unit {
        println("hello world")
    }
}

public interface NonGenericInterface {}

public class TestStaticFunction<TypeGeneric> {
    // check Generic Constraint
    public static func f1<FuncGeneric>(p0: FuncGeneric): Int64 where FuncGeneric <: NonGenericInterface {
        0
    }
}

@Test
class ReflectTest {
    @TestCase
    func test_generic_func() {
        let f1 = getStaticFunctions(TypeInfo.of<StandardClassType<Float32, NonGenericClass, Unit>>(), "staticFunction_1")[0]
        @Expect(f1.toString(), "static func staticFunction_1(default.NonGenericClass, default.GenericClassWith2TypeParameters<Unit, Unit>, default.GenericClassWith2TypeParameters<default.NonGenericClass, default.NonGenericClass>): Unit")

        try {
            f1.apply(
                TypeInfo.of<StandardClassType<Float32, NonGenericClass, Unit>>(),
                [NonGenericClass(), GenericClassWith2TypeParameters<Unit, Unit>(),
                    GenericClassWith2TypeParameters<NonGenericClass, NonGenericClass>()]
            )
        } catch (e: Exception) {
            @Assert(false)
        }
    }

    @TestCase
    func testGenericConstraint(): Unit {
        let funcinfo = getStaticFunctions(TypeInfo.of<TestStaticFunction<Int64>>(), "f1")
        try {
            funcinfo[0].apply(TypeInfo.of<TestStaticFunction<Int64>>(), [TypeInfo.of<String>()], ["111"])
        } catch (e: IllegalTypeException) {
            @Expect(e.message.contains("does not match the type"))
        }
    }
}

func getStaticFunctions(ti: TypeInfo, name: String) {
    let fns = ti.getStaticFunctions(name).toArray()
    fns.sortBy() {
        rht: StaticFunctionInfo, lht: StaticFunctionInfo =>
        let rhn = rht.toString() + rht.genericParams.toArray().toString()
        let lhn = lht.toString() + lht.genericParams.toArray().toString()
        return if (rhn > lhn) {
            Ordering.GT
        } else if (rhn < lhn) {
            Ordering.LT
        } else {
            Ordering.EQ
        }
    }
    fns
}
