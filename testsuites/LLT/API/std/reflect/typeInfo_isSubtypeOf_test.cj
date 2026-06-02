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
 *          Test whether func isSubtypeOf is correct.
 * Test API:
 *      public func isSubtypeOf(supertype: TypeInfo): Bool
 */

import std.reflect.*

@Test
class TypeInfoIsSubOf {
    @TestCase
    func openClassTest(): Unit {
        let pig = TypeInfo.of<Pig>()
        @Expect(pig.isSubtypeOf(TypeInfo.of<Animal>()))
    }

    @TestCase
    func sealedClassTest(): Unit {
        let square = TypeInfo.of<Square>()
        @Expect(square.isSubtypeOf(TypeInfo.of<Rectangle>()))
    }

    @TestCase
    func abstractClassTest(): Unit {
        let job = TypeInfo.of<Programmer>()
        @Expect(job.isSubtypeOf(TypeInfo.of<Occupation>()))
    }

    @TestCase
    func interfaceClassTest(): Unit {
        let food = TypeInfo.of<Food>()
        @Expect(food.isSubtypeOf(TypeInfo.of<Price>()))
    }

    @TestCase
    func combinationsTest(): Unit {
        let huahua = TypeInfo.of<Panda>()
        @Expect(huahua.isSubtypeOf(TypeInfo.of<Animal>()))
        @Expect(huahua.isSubtypeOf(TypeInfo.of<Price>()))
        @Expect(huahua.isSubtypeOf(TypeInfo.of<Appearance>()))
    }

    @TestCase
    func anyTest(): Unit {
        let anyTypeInfo = TypeInfo.of<Any>()
        @Expect(TypeInfo.of<Int64>().isSubtypeOf(anyTypeInfo))
        @Expect(TypeInfo.of<String>().isSubtypeOf(anyTypeInfo))
        @Expect(TypeInfo.of<Object>().isSubtypeOf(anyTypeInfo))
        @Expect(anyTypeInfo.isSubtypeOf(anyTypeInfo))
        @Expect(TypeInfo.of<ToString>().isSubtypeOf(anyTypeInfo))
    }
}

public open class Animal {
    let _name = "Animal"
    public open func name(): String {
        return _name
    }
}

abstract sealed class Rectangle {
    let width = 1
    var length = 1
    public func area(): UInt64 {
        return UInt64(width * length)
    }
}

public abstract class Occupation {
    protected func wages(): Int64
}

public interface Price {
    func tradable(): Bool
}

public interface Appearance {
    func color(): String
}

public class Pig <: Animal {}

public class Square <: Rectangle {}

public class Programmer <: Occupation {
    public func wages(): Int64 {
        return 996
    }
}

public class Food <: Price {
    public func tradable(): Bool {
        return true
    }
}

public class Panda <: Animal & Price & Appearance {
    public func tradable(): Bool {
        return false
    }

    public func color(): String {
        return "black and white"
    }
}
