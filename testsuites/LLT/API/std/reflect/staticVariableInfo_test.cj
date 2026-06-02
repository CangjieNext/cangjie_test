/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class StaticVariableInfo
 *          Test whether StaticVariableInfo is correct.
 * Test API:
 *      public prop name: String
 *      public prop typeInfo: TypeInfo
 *      public prop modifiers: Collection<ModifierInfo>
 *      public func isMutable(): Bool
 *      public func getValue(): Any
 *      public func setValue(newValue: Any): Unit
 *      public func toString(): String
 */

import std.reflect.*

@Test
class staticVariablesTest {
    @TestCase
    func correctTest(): Unit {
        let classInfo = A() |> TypeInfo.of
        let staticVariableArray = classInfo.staticVariables.toArray()
        @Expect(staticVariableArray.size, 4)

        let parm1 = classInfo.getStaticVariable("parm1")
        let parm2 = classInfo.getStaticVariable("parm2")
        let parm3 = classInfo.getStaticVariable("parm3")
        let parm4 = classInfo.getStaticVariable("parm4")

        @Expect(parm1.name, "parm1")
        @Expect(parm2.name, "parm2")
        @Expect(parm3.name, "parm3")
        @Expect(parm4.name, "parm4")

        expectModifier(parm1)
        expectModifier(parm2)
        expectModifier(parm3)
        expectModifier(parm4)

        @Expect(!parm1.isMutable())
        @Expect(!parm2.isMutable())

        @Expect((parm1.getValue() as Int64).getOrThrow(), 1)
        @Expect((parm2.getValue() as B).getOrThrow().toString(), "B")
        @Expect((parm3.getValue() as Int64).getOrThrow(), 1)
        @Expect((parm4.getValue() as B).getOrThrow().toString(), "B")

        parm3.setValue(1)
        @Expect(A.parm3, 1)
        parm4.setValue(B(2))
        @Expect(A.parm4._b, 2)
        parm4.setValue(C(2))
        @Expect(A.parm4._b, 3)

        try {
            parm1.setValue(1)
            @Expect(false)
        } catch (e: IllegalSetException) {
            @Expect(e.message, "Attempt to modify immutable variable 'parm1'.")
        }

        try {
            parm2.setValue(B(2))
            @Expect(false)
        } catch (e: IllegalSetException) {
            @Expect(e.message, "Attempt to modify immutable variable 'parm2'.")
        }

        try {
            parm3.setValue(1i32)
            @Expect(false)
        } catch (e: IllegalTypeException) {
        }

        @Expect(parm1.toString(), "static parm1: Int64")
        @Expect(parm2.toString(), "static parm2: default.B")
        @Expect(parm3.toString(), "static parm3: Int64")
        @Expect(parm4.toString(), "static parm4: default.B")
    }

    func expectModifier(info: StaticVariableInfo) {
        @Expect(info.modifiers.toArray().size, 1)
        @Expect(info.modifiers.toArray()[0], Static)
    }
}

public class A {
    public static let parm1: Int64 = 1
    public static let parm2: B = B(1)

    public static var parm3: Int64 = 1
    public static var parm4: B = B(1)
}

public open class B <: ToString {
    var _b: Int64
    public init(b: Int64) {
        _b = b
    }
    public func toString(): String {
        return "B"
    }
}

public class C <: B {
    public init(c: Int64) {
        super(c + 1)
    }
}
