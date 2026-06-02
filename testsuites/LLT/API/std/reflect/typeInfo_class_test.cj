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
 *      Test class TypeInfo
 *          Test whether TypeInfo is correctly provided for class.
 * Test API:
 *      public static func of<T>(): TypeInfo
 *      public static func of(a: Any): TypeInfo
 *      public open prop name: String
 *      public open prop qualifiedName: String
 *      public open prop instanceFunctions: Collection<InstanceFunctionInfo>
 *      public open prop staticFunctions: Collection<StaticFunctionInfo>
 *      public open prop instanceProperties: Collection<InstancePropertyInfo>
 *      public open prop staticProperties: Collection<StaticPropertyInfo>
 *      public open prop superInterfaces: Collection<InterfaceTypeInfo>
 *      public func isSubtypeOf(supertype: TypeInfo): Bool
 *      public func getInstanceFunction(name: String, parameterTypes: Array<TypeInfo>): Option<InstanceFunctionInfo>
 *      public func getStaticFunction(name: String, parameterTypes: Array<TypeInfo>): Option<StaticFunctionInfo>
 *      public operator func ==(that: TypeInfo): Bool
 *      public operator func !=(that: TypeInfo): Bool
 *      public func hashCode(): Int64
 *      public open func toString(): String
 */

import std.reflect.*

@Test
class classTypeInfoTest {
    @TestCase
    func classTest(): Unit {
        let a = ClassTypeInfo.of<Bird>()
        let b = Bird() |> ClassTypeInfo.of

        @Expect(a, b)

        @Expect(a.name, "Bird")

        @Expect(a.qualifiedName, "default.Bird")

        @Expect(a, TypeInfo.get("default.Bird"))

        try {
            TypeInfo.get("default/Bird")
            @Expect(false)
        } catch (e: ReflectException) {
        }

        try {
            TypeInfo.get("default.\0Bird")
            @Expect(false)
        } catch (e: ReflectException) {
        }

        try {
            TypeInfo.get("default.Birds")
            @Expect(false)
        } catch (e: ReflectException) {
        }

        let instanceFunctions = a.instanceFunctions.toArray()
        let instanceFunctionsNum = instanceFunctions.size
        let instanceFunctionsArray = Array<String>(instanceFunctionsNum, {
            num => instanceFunctions[num].name
        })
        @Expect(instanceFunctionsArray.contains("fly"))
        @Expect(instanceFunctionsArray.contains("eat"))

        let staticFunctions = a.staticFunctions.toArray()
        let staticFunctionsNum = staticFunctions.size
        let staticFunctionsArray = Array<String>(staticFunctionsNum, {
            num => staticFunctions[num].name
        })
        @Expect(staticFunctionsArray.contains("drink"))

        let instanceProperties = a.instanceProperties.toArray()
        let instancePropertiesNum = instanceProperties.size
        let instancePropertiesArray = Array<String>(instancePropertiesNum, {
            num => instanceProperties[num].name
        })

        let staticProperties = a.staticProperties.toArray()
        let staticPropertiesNum = staticProperties.size
        let staticPropertiesArray = Array<String>(staticPropertiesNum, {
            num => staticProperties[num].name
        })

        let superInterfaces = a.superInterfaces.toArray()
        let superInterfacesNum = superInterfaces.size
        let superInterfacesArray = Array<String>(superInterfacesNum, {
            num => superInterfaces[num].qualifiedName
        })
        @Expect(superInterfacesArray.contains("default.Flyable"))

        @Expect(a.isSubtypeOf(TypeInfo.of<Animal>()))

        let eatFunc11 = a.getInstanceFunction("eat", TypeInfo.of<Int64>())
        @Expect(eatFunc11.name, "eat")
        @Expect(eatFunc11.returnType, TypeInfo.of<Int64>())

        try {
            a.getInstanceFunction("", TypeInfo.of<Int64>())
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getInstanceFunction("0eat", TypeInfo.of<Int64>())
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getInstanceFunction("let", TypeInfo.of<Int64>())
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getInstanceFunction("`let", TypeInfo.of<Int64>())
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getInstanceFunction("e\rat", TypeInfo.of<Int64>())
            @Expect(false)
        } catch (e: Exception) {
        }

        let eatFunc12 = a.getInstanceFunction("eat", parseParameterTypes("Int64"))
        @Expect(eatFunc12.name, "eat")
        @Expect(eatFunc12.returnType, TypeInfo.of<Int64>())

        try {
            a.getInstanceFunction("", parseParameterTypes("Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getInstanceFunction("0eat", parseParameterTypes("Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getInstanceFunction("let", parseParameterTypes("Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getInstanceFunction("`let", parseParameterTypes("Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getInstanceFunction("e\rat", parseParameterTypes("Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getInstanceFunction("eat", parseParameterTypes("food Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getInstanceFunction("eat", parseParameterTypes("food:"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getInstanceFunction("eat", parseParameterTypes("Int128"))
            @Expect(false)
        } catch (e: Exception) {
        }

        let eatFunc2 = a.getInstanceFunction("eat")
        @Expect(eatFunc2.name, "eat")

        let drinkFunc11 = a.getStaticFunction("drink", TypeInfo.of<Int64>())
        @Expect(drinkFunc11.name, "drink")
        @Expect(drinkFunc11.returnType, TypeInfo.of<Int64>())

        try {
            a.getStaticFunction("", TypeInfo.of<Int64>())
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getStaticFunction("0drink", TypeInfo.of<Int64>())
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getStaticFunction("let", TypeInfo.of<Int64>())
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getStaticFunction("`let", TypeInfo.of<Int64>())
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getStaticFunction("d\rrink", TypeInfo.of<Int64>())
            @Expect(false)
        } catch (e: Exception) {
        }

        let drinkFunc12 = a.getStaticFunction("drink", parseParameterTypes("Int64"))
        @Expect(drinkFunc12.name, "drink")
        @Expect(drinkFunc12.returnType, TypeInfo.of<Int64>())

        try {
            a.getStaticFunction("", parseParameterTypes("Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getStaticFunction("0drink", parseParameterTypes("Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getStaticFunction("let", parseParameterTypes("Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getStaticFunction("`let", parseParameterTypes("Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getStaticFunction("d\rrink", parseParameterTypes("Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getStaticFunction("drink", parseParameterTypes("food Int64"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getStaticFunction("drink", parseParameterTypes("food:"))
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            a.getStaticFunction("eat", parseParameterTypes("food: Int128"))
            @Expect(false)
        } catch (e: Exception) {
        }

        let drinkFunc2 = a.getStaticFunction("drink")
        @Expect(drinkFunc2.name, "drink")

        var value = Some(20)
        var instance = A()
        ClassTypeInfo.of<A>().instanceVariables.toArray()[0].setValue(instance, value)
        @Expect(instance.id, Some(20))
    }
}

public class A {
    public var id: ?Int64 = 10
}

public open class Animal {
    public static const variety = "animal"
    public var _age = 1

    public func weight(): Unit {
        println("this animal's weight is 100kg")
    }

    public static func high(): Unit {
        println("this animal's high is 1m")
    }

    public mut prop age: Int64 {
        get() {
            _age
        }
        set(v) {
            _age = v
        }
    }
}

public interface Flyable {
    func fly(): Unit
}

public class Bird <: Animal & Flyable {
    public static var _name = "kiki"
    public var _color = "white"

    public func fly(): Unit {
        println("this bird can fly")
    }

    public func eat(): Unit {
        println("this bird eat bugs")
    }

    public static func drink() {
        println("this bird drink water")
    }

    public mut prop color: String {
        get() {
            _color
        }
        set(v) {
            _color = v
        }
    }

    public mut static prop name: String {
        get() {
            _name
        }
        set(v) {
            _name = v
        }
    }

    public func eat(food: Int64): Int64 {
        if (food < 100) {
            return 1
        } else {
            return 2
        }
    }

    public static func drink(drinks: Int64) {
        if (drinks == 1) {
            return 1
        } else {
            return 2
        }
    }
}
