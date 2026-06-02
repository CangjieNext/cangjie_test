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
 *      Test class InstanceVariableInfo
 *          Test whether InstanceVariableInfo is correct.
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
        let a = A()
        let classInfo = TypeInfo.of(a)
        let InstanceVariableInfo = classInfo.instanceVariables.toArray()
        @Expect(InstanceVariableInfo.size, 4)

        let parm1 = classInfo.getInstanceVariable("parm1")
        let parm2 = classInfo.getInstanceVariable("parm2")
        let parm3 = classInfo.getInstanceVariable("parm3")
        let parm4 = classInfo.getInstanceVariable("parm4")

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

        @Expect((parm1.getValue(a) as Int64).getOrThrow(), 1)
        @Expect((parm2.getValue(a) as B).getOrThrow().toString(), "B")
        @Expect((parm3.getValue(a) as Int64).getOrThrow(), 1)
        @Expect((parm4.getValue(a) as B).getOrThrow().toString(), "B")

        parm3.setValue(a, 1)
        @Expect(a.parm3, 1)
        parm4.setValue(a, B(2))
        @Expect(a.parm4._b, 2)
        parm4.setValue(a, C(2))
        @Expect(a.parm4._b, 3)

        try {
            parm1.setValue(a, 1)
            @Expect(false)
        } catch (e: IllegalSetException) {
            @Expect(e.message, "Attempt to modify immutable variable 'parm1'.")
        }

        try {
            parm2.setValue(a, B(2))
            @Expect(false)
        } catch (e: IllegalSetException) {
            @Expect(e.message, "Attempt to modify immutable variable 'parm2'.")
        }

        try {
            parm3.setValue(a, 1i32)
            @Expect(false)
        } catch (e: IllegalTypeException) {
        }

        @Expect(parm1.toString(), "parm1: Int64")
        @Expect(parm2.toString(), "parm2: default.B")
        @Expect(parm3.toString(), "parm3: Int64")
        @Expect(parm4.toString(), "parm4: default.B")
    }

    func expectModifier(info: InstanceVariableInfo) {
        @Expect(info.modifiers.toArray().size, 0)
    }
}

public class A {
    public let parm1: Int64 = 1
    public let parm2: B = B(1)

    public var parm3: Int64 = 1
    public var parm4: B = B(1)
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
