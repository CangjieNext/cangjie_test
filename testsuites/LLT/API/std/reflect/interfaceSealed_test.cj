/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test InterfaceTypeInfo
 *          Test sealedSubtypes property
 *          Test isSealed() method
 * Test API:
 *      public prop sealedSubtypes: Collection<TypeInfo>
 *      public func isSealed(): Bool
 */

import std.reflect.*
import std.collection.ArrayList

@Test
class InterfaceSealedTest {
    func testSealedInterfaceIsSealed(): Unit {
        let sealedInterface = InterfaceTypeInfo.of<ISealedShape>()
        @Expect(sealedInterface.isSealed())
    }

    func testNonSealedInterfaceIsSealed(): Unit {
        let nonSealedInterface = InterfaceTypeInfo.of<INormalShape>()
        @Expect(!nonSealedInterface.isSealed())
    }

    func testSealedInterfaceSubtypes(): Unit {
        let sealedInterface = InterfaceTypeInfo.of<ISealedShape>()
        let subtypes = sealedInterface.sealedSubtypes

        @Assert(subtypes.size, 3)

        let subtypeNames = ArrayList<String>()
        for (subtype in subtypes) {
            subtypeNames.add(subtype.name)
        }

        @Expect(subtypeNames.contains("Circle"))
        @Expect(subtypeNames.contains("Square"))
        @Expect(subtypeNames.contains("Triangle"))
    }

    func testNonSealedInterfaceSubtypesEmpty(): Unit {
        let nonSealedInterface = InterfaceTypeInfo.of<INormalShape>()
        let subtypes = nonSealedInterface.sealedSubtypes

        @Assert(subtypes.size, 0)
    }

    func testSealedSubtypesAreSubtypeOf(): Unit {
        let sealedInterface = InterfaceTypeInfo.of<ISealedShape>()
        let subtypes = sealedInterface.sealedSubtypes

        for (subtype in subtypes) {
            @Expect(subtype.isSubtypeOf(sealedInterface))
        }
    }
}

sealed interface ISealedShape {
    func area(): Float64
}

interface INormalShape {
    func perimeter(): Float64
}

class Circle <: ISealedShape {
    let radius: Float64
    public init(r: Float64) {
        radius = r
    }
    public func area(): Float64 {
        3.14159 * radius * radius
    }
}

class Square <: ISealedShape {
    let side: Float64
    public init(s: Float64) {
        side = s
    }
    public func area(): Float64 {
        side * side
    }
}

class Triangle <: ISealedShape {
    let base: Float64
    let height: Float64
    public init(b: Float64, h: Float64) {
        base = b
        height = h
    }
    public func area(): Float64 {
        0.5 * base * height
    }
}

class Rectangle <: INormalShape {
    let width: Float64
    let height: Float64
    public init(w: Float64, h: Float64) {
        width = w
        height = h
    }
    public func perimeter(): Float64 {
        2.0 * (width + height)
    }
}
