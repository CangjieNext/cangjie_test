/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.reflect.*
import std.collection.ArrayList

@Test
class ClassTypeInfoFullTest {
    @TestCase
    func testClassTypeInfoIsSealed(): Unit {
        let sealedClassInfo = ClassTypeInfo.of<SealedTestClass>()
        @Expect(sealedClassInfo.isSealed())
    }

    @TestCase
    func testClassTypeInfoIsAbstract(): Unit {
        let abstractClassInfo = ClassTypeInfo.of<AbstractTestClass>()
        @Expect(abstractClassInfo.isAbstract())
    }

    @TestCase
    func testClassTypeInfoIsOpen(): Unit {
        let openClassInfo = ClassTypeInfo.of<OpenTestClass>()
        @Expect(openClassInfo.isOpen())
    }

    @TestCase
    func testSealedSubclasses(): Unit {
        let sealedClassInfo = ClassTypeInfo.of<SealedTestClass>()
        let subclasses = sealedClassInfo.sealedSubclasses

        @Assert(subclasses.size, 3)

        let subclassNames = ArrayList<String>()
        for (subclass in subclasses) {
            subclassNames.add(subclass.name)
        }

        @Expect(subclassNames.contains("SealedSubclassA"))
        @Expect(subclassNames.contains("SealedSubclassB"))
    }

    @TestCase
    func testSealedSubclassesEmptyForNonSealed(): Unit {
        let openClassInfo = ClassTypeInfo.of<OpenTestClass>()
        let subclasses = openClassInfo.sealedSubclasses

        @Assert(subclasses.size, 0)
    }

    @TestCase
    func testConstructors(): Unit {
        let classInfo = ClassTypeInfo.of<ConstructorTestClass>()
        let constructors = classInfo.constructors

        @Expect(constructors.size > 0)
    }

    @TestCase
    func testInstanceVariables(): Unit {
        let classInfo = ClassTypeInfo.of<VariableTestClass>()
        let instanceVars = classInfo.instanceVariables

        @Expect(instanceVars.size > 0)

        let varInfo = classInfo.getInstanceVariable("instanceVar")
        @Assert(varInfo.name, "instanceVar")
    }

    @TestCase
    func testStaticVariables(): Unit {
        let classInfo = ClassTypeInfo.of<VariableTestClass>()
        let staticVars = classInfo.staticVariables

        @Expect(staticVars.size > 0)

        let varInfo = classInfo.getStaticVariable("staticVar")
        @Assert(varInfo.name, "staticVar")
    }

    @TestCase
    func testSuperClass(): Unit {
        let classInfo = ClassTypeInfo.of<ChildTestClass>()
        let superClass = classInfo.superClass

        @Expect(superClass.isSome())
        let superInfo = superClass.getOrThrow()
        @Assert(superInfo.name, "ParentTestClass")
    }

    @TestCase
    func testSuperClassForObject(): Unit {
        let classInfo = ClassTypeInfo.of<Object>()
        let superClass = classInfo.superClass

        @Expect(superClass.isNone())
    }

    @TestCase
    func testConstructWithArgs(): Unit {
        let classInfo = ClassTypeInfo.of<ConstructorTestClass>()
        let instance = classInfo.construct([42])

        let concrete = (instance as ConstructorTestClass).getOrThrow()
        @Assert(concrete.value, 42)
    }

    @TestCase
    func testConstructAbstractClass(): Unit {
        let classInfo = ClassTypeInfo.of<AbstractTestClass>()

        try {
            classInfo.construct(Array<Any>())
            @Expect(false)
        } catch (e: InvocationTargetException) {
            @Expect(e.message.contains("abstract") || e.message.contains("not allowed"))
        }
    }
}

sealed abstract class SealedTestClass {
    public init() {}
}

class SealedSubclassA <: SealedTestClass {
    public init() {}
}

class SealedSubclassB <: SealedTestClass {
    public init() {}
}

abstract class AbstractTestClass {
    public func abstractMethod(): Int64
}

open class OpenTestClass {
    public var openVar: Int64 = 100
    public init() {}
}

class ConstructorTestClass {
    public var value: Int64
    public init(v: Int64) {
        value = v
    }
}

class VariableTestClass {
    public var instanceVar: String = "instance"
    public static var staticVar: Float64 = 1.5
    public init() {}
}

open class ParentTestClass {
    public init() {}
}

class ChildTestClass <: ParentTestClass {
    public init() {}
}
