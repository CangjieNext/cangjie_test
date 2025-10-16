/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./dependency/annotation_macro.cj
// DEPENDENCE: ./dependency/annotation_dynamic.cj
// (CJNATIVE) EXEC: %compiler -Woff all %cmp_opt --compile-macro annotation_macro.cj
// (CJNATIVE) EXEC: %compiler -Woff all %cmp_opt --import-path ./ --output-type dylib annotation_dynamic.cj
// (CJNATIVE) EXEC: %compiler -Woff all %cmp_opt %f --import-path ./ -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.reflect.*
import std.collection.*
import annotation_macro.*

@Annotation
@ConstructAnnotation
public class A1 {}

@Annotation
@ConstructAnnotation
public class A2 {}

@Annotation
@ConstructAnnotation
public class A3 {}

@Annotation
@ConstructAnnotation
public class A4 {}
/******************************************************************/
@A1["Annotation1"]
@A1["Annotation1"]
public let globalVariable1: Int64 = 1

@A1["Annotation1_0"]
@A1["Annotation1_1"]
public let globalVariable2: Int64 = 1

@A1["Annotation1_0"]
@A1["Annotation1_1"]
@A2["Annotation2"]
public let globalVariable3: Int64 = 1

@A1["Annotation1"]
@A2["Annotation2"]
@A3["Annotation3"]
public let globalVariable4: Int64 = 1

@A1["Annotation1"]
@A1["Annotation1"]
public func globalFunction1() {}

@A1["Annotation1_0"]
@A1["Annotation1_1"]
public func globalFunction2() {}

@A1["Annotation1_0"]
@A1["Annotation1_1"]
@A2["Annotation2"]
public func globalFunction3() {}

@A1["Annotation1"]
@A2["Annotation2"]
@A3["Annotation3"]
public func globalFunction4() {}
/******************************************************************/
@A1["Annotation1"]
@A1["Annotation1"]
struct S0 {
    @A1["Annotation1"]
    @A1["Annotation1"]
    public init() {}
}

@A1["Annotation1_0"]
@A1["Annotation1_1"]
struct S1 {
    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    public init() {}
}

@A1["Annotation1_0"]
@A1["Annotation1_1"]
@A2["Annotation2"]
struct S2 {
    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    @A2["Annotation2"]
    public init() {}
}

@A1["Annotation1"]
@A2["Annotation2"]
@A3["Annotation3"]
struct S3 {
    @A1["Annotation1"]
    @A2["Annotation2"]
    @A3["Annotation3"]
    public init() {}
}
/******************************************************************/
@A1["Annotation1"]
@A1["Annotation1"]
class C0 {
    @A1["Annotation1"]
    @A1["Annotation1"]
    public prop instanceProperty: Int64 {
        get() {
            1
        }
    }

    @A1["Annotation1"]
    @A1["Annotation1"]
    public static prop staticProperty: Int64 {
        get() {
            2
        }
    }

    @A1["Annotation1"]
    @A1["Annotation1"]
    public let instanceVariable: Int64 = 3

    @A1["Annotation1"]
    @A1["Annotation1"]
    public static let staticVariable: Int64 = 4

    @A1["Annotation1"]
    @A1["Annotation1"]
    public func instanceFunction() {
    }

    @A1["Annotation1"]
    @A1["Annotation1"]
    public static func staticFunction() {
    }

    public func parameterFunction(@A1["Annotation1"] @A1["Annotation1"] para: Int64) {}
}

@A1["Annotation1_0"]
@A1["Annotation1_1"]
class C1 {
    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    public prop instanceProperty: Int64 {
        get() {
            1
        }
    }

    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    public static prop staticProperty: Int64 {
        get() {
            2
        }
    }

    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    public let instanceVariable: Int64 = 3

    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    public static let staticVariable: Int64 = 4

    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    public func instanceFunction() {
    }

    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    public static func staticFunction() {
    }

    public func parameterFunction(@A1["Annotation1_0"] @A1["Annotation1_1"] para: Int64) {}
}

@A1["Annotation1_0"]
@A1["Annotation1_1"]
@A2["Annotation2"]
class C2 {
    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    @A2["Annotation2"]
    public prop instanceProperty: Int64 {
        get() {
            1
        }
    }

    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    @A2["Annotation2"]
    public static prop staticProperty: Int64 {
        get() {
            2
        }
    }

    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    @A2["Annotation2"]
    public let instanceVariable: Int64 = 3

    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    @A2["Annotation2"]
    public static let staticVariable: Int64 = 4

    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    @A2["Annotation2"]
    public func instanceFunction() {
    }

    @A1["Annotation1_0"]
    @A1["Annotation1_1"]
    @A2["Annotation2"]
    public static func staticFunction() {
    }

    public func parameterFunction(@A1["Annotation1_0"] @A1["Annotation1_1"] @A2["Annotation2"] para: Int64) {}
}

@A1["Annotation1"]
@A2["Annotation2"]
@A3["Annotation3"]
class C3 {
    @A1["Annotation1"]
    @A2["Annotation2"]
    @A3["Annotation3"]
    public prop instanceProperty: Int64 {
        get() {
            1
        }
    }

    @A1["Annotation1"]
    @A2["Annotation2"]
    @A3["Annotation3"]
    public static prop staticProperty: Int64 {
        get() {
            2
        }
    }

    @A1["Annotation1"]
    @A2["Annotation2"]
    @A3["Annotation3"]
    public let instanceVariable: Int64 = 3

    @A1["Annotation1"]
    @A2["Annotation2"]
    @A3["Annotation3"]
    public static let staticVariable: Int64 = 4

    @A1["Annotation1"]
    @A2["Annotation2"]
    @A3["Annotation3"]
    public func instanceFunction() {
    }

    @A1["Annotation1"]
    @A2["Annotation2"]
    @A3["Annotation3"]
    public static func staticFunction() {
    }
    public func parameterFunction(@A1["Annotation1"] @A2["Annotation2"] @A3["Annotation3"] para: Int64) {}
}
/******************************************************************/

@CountAnnotations[earlyBreak: false]
func countAnnotation<T>(arr: Array<Annotation>): Int64 where T <: Annotation {
}

@CountDynamicAnnotations
func countDynamicAnnotation(arr: Array<Annotation>, ti: TypeInfo) {
}

@CountAnnotations[earlyBreak: false]
func countAnnotationArray<T>(arr: Array<T>): Int64 where T <: Annotation {
}

@CountDynamicAnnotations
func countDynamicAnnotationArray<T>(arr: Array<T>, ti: TypeInfo): Int64 where T <: Annotation {
}

@CheckAnnotations
func checkAnnotationArray<T>(annos: Array<T>, names: Array<String>): Bool where T <: Annotation & ToString {
    true
}

/******************************************************************/
@Test
class StructAnnotationTest {
    @TestCase
    func testStructGetAllAnnotations() {
        @Assert(countAnnotation<A1>(StructTypeInfo.of<S0>().getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S0>().getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S0>().getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S0>().getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(StructTypeInfo.of<S1>().getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S1>().getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S1>().getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S1>().getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(StructTypeInfo.of<S2>().getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S2>().getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S2>().getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S2>().getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(StructTypeInfo.of<S3>().getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S3>().getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S3>().getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S3>().getAllAnnotations()), 0)
    }

    @TestCase
    func testStructFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S0>().findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S0>().findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S0>().findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S0>().findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S1>().findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S1>().findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S1>().findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S1>().findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S2>().findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S2>().findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S2>().findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S2>().findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S3>().findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S3>().findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S3>().findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S3>().findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(StructTypeInfo.of<S0>().findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A1>(StructTypeInfo.of<S1>().findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))

        @Assert(checkAnnotationArray<A1>(StructTypeInfo.of<S2>().findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(StructTypeInfo.of<S2>().findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(StructTypeInfo.of<S3>().findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(StructTypeInfo.of<S3>().findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(StructTypeInfo.of<S3>().findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testStructFindAnnotation() {
        // check annotation num
        @Assert(StructTypeInfo.of<S0>().findAnnotation<A1>().isNone())
        @Assert(StructTypeInfo.of<S0>().findAnnotation<A2>().isNone())
        @Assert(StructTypeInfo.of<S0>().findAnnotation<A3>().isNone())
        @Assert(StructTypeInfo.of<S0>().findAnnotation<A4>().isNone())

        @Assert(StructTypeInfo.of<S1>().findAnnotation<A1>().isNone())
        @Assert(StructTypeInfo.of<S1>().findAnnotation<A2>().isNone())
        @Assert(StructTypeInfo.of<S1>().findAnnotation<A3>().isNone())
        @Assert(StructTypeInfo.of<S1>().findAnnotation<A4>().isNone())

        @Assert(StructTypeInfo.of<S2>().findAnnotation<A1>().isNone())
        @Assert(StructTypeInfo.of<S2>().findAnnotation<A2>().isSome())
        @Assert(StructTypeInfo.of<S2>().findAnnotation<A3>().isNone())
        @Assert(StructTypeInfo.of<S2>().findAnnotation<A4>().isNone())

        @Assert(StructTypeInfo.of<S3>().findAnnotation<A1>().isSome())
        @Assert(StructTypeInfo.of<S3>().findAnnotation<A2>().isSome())
        @Assert(StructTypeInfo.of<S3>().findAnnotation<A3>().isSome())
        @Assert(StructTypeInfo.of<S3>().findAnnotation<A4>().isNone())
    }
}

@Test
class ClassAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C0>().findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C1>().findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C2>().findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C2>().findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C3>().findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C3>().findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(ClassTypeInfo.of<C3>().findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testFindAnnotation() {
        // check annotation num
        @Assert(ClassTypeInfo.of<C0>().findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C0>().findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C0>().findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C0>().findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C1>().findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C1>().findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C1>().findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C1>().findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C2>().findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C2>().findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C2>().findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C2>().findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C3>().findAnnotation<A1>().isSome())
        @Assert(ClassTypeInfo.of<C3>().findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C3>().findAnnotation<A3>().isSome())
        @Assert(ClassTypeInfo.of<C3>().findAnnotation<A4>().isNone())
    }
}

@Test
class ConstructAnnotationTest {
    @TestCase
    func testConstructorGetAllAnnotations() {
        @Assert(countAnnotation<A1>(StructTypeInfo.of<S0>().getConstructor([]).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S0>().getConstructor([]).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S0>().getConstructor([]).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S0>().getConstructor([]).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(StructTypeInfo.of<S1>().getConstructor([]).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S1>().getConstructor([]).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S1>().getConstructor([]).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S1>().getConstructor([]).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(StructTypeInfo.of<S2>().getConstructor([]).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S2>().getConstructor([]).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S2>().getConstructor([]).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S2>().getConstructor([]).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(StructTypeInfo.of<S3>().getConstructor([]).getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S3>().getConstructor([]).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S3>().getConstructor([]).getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S3>().getConstructor([]).getAllAnnotations()), 0)
    }

    @TestCase
    func testConstructorFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S0>().getConstructor([]).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S0>().getConstructor([]).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S0>().getConstructor([]).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S0>().getConstructor([]).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S1>().getConstructor([]).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S1>().getConstructor([]).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S1>().getConstructor([]).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S1>().getConstructor([]).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S2>().getConstructor([]).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S2>().getConstructor([]).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S2>().getConstructor([]).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S2>().getConstructor([]).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S3>().getConstructor([]).findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S3>().getConstructor([]).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S3>().getConstructor([]).findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S3>().getConstructor([]).findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(StructTypeInfo.of<S0>().getConstructor([]).findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A1>(StructTypeInfo.of<S1>().getConstructor([]).findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))

        @Assert(checkAnnotationArray<A1>(StructTypeInfo.of<S2>().getConstructor([]).findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(StructTypeInfo.of<S2>().getConstructor([]).findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(StructTypeInfo.of<S3>().getConstructor([]).findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(StructTypeInfo.of<S3>().getConstructor([]).findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(StructTypeInfo.of<S3>().getConstructor([]).findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testConstructorFindAnnotation() {
        // check annotation num
        @Assert(StructTypeInfo.of<S0>().getConstructor([]).findAnnotation<A1>().isNone())
        @Assert(StructTypeInfo.of<S0>().getConstructor([]).findAnnotation<A2>().isNone())
        @Assert(StructTypeInfo.of<S0>().getConstructor([]).findAnnotation<A3>().isNone())
        @Assert(StructTypeInfo.of<S0>().getConstructor([]).findAnnotation<A4>().isNone())

        @Assert(StructTypeInfo.of<S1>().getConstructor([]).findAnnotation<A1>().isNone())
        @Assert(StructTypeInfo.of<S1>().getConstructor([]).findAnnotation<A2>().isNone())
        @Assert(StructTypeInfo.of<S1>().getConstructor([]).findAnnotation<A3>().isNone())
        @Assert(StructTypeInfo.of<S1>().getConstructor([]).findAnnotation<A4>().isNone())

        @Assert(StructTypeInfo.of<S2>().getConstructor([]).findAnnotation<A1>().isNone())
        @Assert(StructTypeInfo.of<S2>().getConstructor([]).findAnnotation<A2>().isSome())
        @Assert(StructTypeInfo.of<S2>().getConstructor([]).findAnnotation<A3>().isNone())
        @Assert(StructTypeInfo.of<S2>().getConstructor([]).findAnnotation<A4>().isNone())

        @Assert(StructTypeInfo.of<S3>().getConstructor([]).findAnnotation<A1>().isSome())
        @Assert(StructTypeInfo.of<S3>().getConstructor([]).findAnnotation<A2>().isSome())
        @Assert(StructTypeInfo.of<S3>().getConstructor([]).findAnnotation<A3>().isSome())
        @Assert(StructTypeInfo.of<S3>().getConstructor([]).findAnnotation<A4>().isNone())
    }
}

@Test
class InstanceFunctionAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testFindAnnotation() {
        // check annotation num
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAnnotation<A1>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAnnotation<A3>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAnnotation<A4>().isNone())
    }
}

@Test
class StaticFunctionAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testFindAnnotation() {
        // check annotation num
        @Assert(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAnnotation<A1>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAnnotation<A3>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAnnotation<A4>().isNone())
    }
}

@Test
class InstanceVariableAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testFindAnnotation() {
        // check annotation num
        @Assert(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAnnotation<A1>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAnnotation<A3>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAnnotation<A4>().isNone())
    }
}

@Test
class StaticVariableAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testFindAnnotation() {
        // check annotation num
        @Assert(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAnnotation<A1>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAnnotation<A3>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAnnotation<A4>().isNone())
    }
}

@Test
class InstancePropertyAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testFindAnnotation() {
        // check annotation num
        @Assert(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAnnotation<A1>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAnnotation<A3>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAnnotation<A4>().isNone())
    }
}

@Test
class StaticPropertyAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testFindAnnotation() {
        // check annotation num
        @Assert(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAnnotation<A1>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAnnotation<A3>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAnnotation<A4>().isNone())
    }
}

@Test
class ParameterAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testFindAnnotation() {
        // check annotation num
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A1>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A3>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAnnotation<A4>().isNone())
    }
}

@Test
class GlobalVariableAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(PackageInfo.get("default").getVariable("globalVariable1").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getVariable("globalVariable1").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getVariable("globalVariable1").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getVariable("globalVariable1").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getVariable("globalVariable2").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getVariable("globalVariable2").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getVariable("globalVariable2").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getVariable("globalVariable2").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getVariable("globalVariable3").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getVariable("globalVariable3").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getVariable("globalVariable3").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getVariable("globalVariable3").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getVariable("globalVariable4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getVariable("globalVariable4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getVariable("globalVariable4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getVariable("globalVariable4").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable1").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getVariable("globalVariable1").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getVariable("globalVariable1").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getVariable("globalVariable1").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable2").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getVariable("globalVariable2").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getVariable("globalVariable2").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getVariable("globalVariable2").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable3").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getVariable("globalVariable3").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getVariable("globalVariable3").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getVariable("globalVariable3").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable4").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getVariable("globalVariable4").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getVariable("globalVariable4").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getVariable("globalVariable4").findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable1").findAllAnnotations<A1>(), ["Annotation1"]))

        @Assert(checkAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable2").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(PackageInfo.get("default").getVariable("globalVariable2").findAllAnnotations<A2>(), []))

        @Assert(checkAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable3").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(PackageInfo.get("default").getVariable("globalVariable3").findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable4").findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(PackageInfo.get("default").getVariable("globalVariable4").findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(PackageInfo.get("default").getVariable("globalVariable4").findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testFindAnnotation() {
        // check annotation num
        @Assert(PackageInfo.get("default").getVariable("globalVariable1").findAnnotation<A1>().isNone())
        @Assert(PackageInfo.get("default").getVariable("globalVariable1").findAnnotation<A2>().isNone())
        @Assert(PackageInfo.get("default").getVariable("globalVariable1").findAnnotation<A3>().isNone())
        @Assert(PackageInfo.get("default").getVariable("globalVariable1").findAnnotation<A4>().isNone())

        @Assert(PackageInfo.get("default").getVariable("globalVariable2").findAnnotation<A1>().isNone())
        @Assert(PackageInfo.get("default").getVariable("globalVariable2").findAnnotation<A2>().isNone())
        @Assert(PackageInfo.get("default").getVariable("globalVariable2").findAnnotation<A3>().isNone())
        @Assert(PackageInfo.get("default").getVariable("globalVariable2").findAnnotation<A4>().isNone())

        @Assert(PackageInfo.get("default").getVariable("globalVariable3").findAnnotation<A1>().isNone())
        @Assert(PackageInfo.get("default").getVariable("globalVariable3").findAnnotation<A2>().isSome())
        @Assert(PackageInfo.get("default").getVariable("globalVariable3").findAnnotation<A3>().isNone())
        @Assert(PackageInfo.get("default").getVariable("globalVariable3").findAnnotation<A4>().isNone())

        @Assert(PackageInfo.get("default").getVariable("globalVariable4").findAnnotation<A1>().isSome())
        @Assert(PackageInfo.get("default").getVariable("globalVariable4").findAnnotation<A2>().isSome())
        @Assert(PackageInfo.get("default").getVariable("globalVariable4").findAnnotation<A3>().isSome())
        @Assert(PackageInfo.get("default").getVariable("globalVariable4").findAnnotation<A4>().isNone())
    }
}

@Test
class GlobalFunctionAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(PackageInfo.get("default").getFunction("globalFunction1").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getFunction("globalFunction1").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getFunction("globalFunction1").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getFunction("globalFunction1").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getFunction("globalFunction2").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getFunction("globalFunction2").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getFunction("globalFunction2").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getFunction("globalFunction2").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getFunction("globalFunction3").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getFunction("globalFunction3").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getFunction("globalFunction3").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getFunction("globalFunction3").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getFunction("globalFunction4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getFunction("globalFunction4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getFunction("globalFunction4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getFunction("globalFunction4").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction1").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getFunction("globalFunction1").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getFunction("globalFunction1").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getFunction("globalFunction1").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction2").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getFunction("globalFunction2").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getFunction("globalFunction2").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getFunction("globalFunction2").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction3").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getFunction("globalFunction3").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getFunction("globalFunction3").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getFunction("globalFunction3").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction4").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getFunction("globalFunction4").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getFunction("globalFunction4").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getFunction("globalFunction4").findAllAnnotations<A4>()), 0)

        // check annotation name
        @Assert(checkAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction1").findAllAnnotations<A1>(), ["Annotation1"]))

        @Assert(checkAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction2").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))

        @Assert(checkAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction3").findAllAnnotations<A1>(), ["Annotation1_0", "Annotation1_1"]))
        @Assert(checkAnnotationArray<A2>(PackageInfo.get("default").getFunction("globalFunction3").findAllAnnotations<A2>(), ["Annotation2"]))

        @Assert(checkAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction4").findAllAnnotations<A1>(), ["Annotation1"]))
        @Assert(checkAnnotationArray<A2>(PackageInfo.get("default").getFunction("globalFunction4").findAllAnnotations<A2>(), ["Annotation2"]))
        @Assert(checkAnnotationArray<A3>(PackageInfo.get("default").getFunction("globalFunction4").findAllAnnotations<A3>(), ["Annotation3"]))
    }

    @TestCase
    func testFindAnnotation() {
        // check annotation num
        @Assert(PackageInfo.get("default").getFunction("globalFunction1").findAnnotation<A1>().isNone())
        @Assert(PackageInfo.get("default").getFunction("globalFunction1").findAnnotation<A2>().isNone())
        @Assert(PackageInfo.get("default").getFunction("globalFunction1").findAnnotation<A3>().isNone())
        @Assert(PackageInfo.get("default").getFunction("globalFunction1").findAnnotation<A4>().isNone())

        @Assert(PackageInfo.get("default").getFunction("globalFunction2").findAnnotation<A1>().isNone())
        @Assert(PackageInfo.get("default").getFunction("globalFunction2").findAnnotation<A2>().isNone())
        @Assert(PackageInfo.get("default").getFunction("globalFunction2").findAnnotation<A3>().isNone())
        @Assert(PackageInfo.get("default").getFunction("globalFunction2").findAnnotation<A4>().isNone())

        @Assert(PackageInfo.get("default").getFunction("globalFunction3").findAnnotation<A1>().isNone())
        @Assert(PackageInfo.get("default").getFunction("globalFunction3").findAnnotation<A2>().isSome())
        @Assert(PackageInfo.get("default").getFunction("globalFunction3").findAnnotation<A3>().isNone())
        @Assert(PackageInfo.get("default").getFunction("globalFunction3").findAnnotation<A4>().isNone())

        @Assert(PackageInfo.get("default").getFunction("globalFunction4").findAnnotation<A1>().isSome())
        @Assert(PackageInfo.get("default").getFunction("globalFunction4").findAnnotation<A2>().isSome())
        @Assert(PackageInfo.get("default").getFunction("globalFunction4").findAnnotation<A3>().isSome())
        @Assert(PackageInfo.get("default").getFunction("globalFunction4").findAnnotation<A4>().isNone())
    }
}

/******************************************************************/
let packageInfo = try {
    PackageInfo.load("libAnnotationTestDynamic")
} catch (e: Exception) {
    println(e)
    PackageInfo.get("AnnotationTestDynamic")
}
let DA1 = packageInfo.getTypeInfo("AnnotationTestDynamic.DA1")
let DA2 = packageInfo.getTypeInfo("AnnotationTestDynamic.DA2")
let DA3 = packageInfo.getTypeInfo("AnnotationTestDynamic.DA3")
let DA4 = packageInfo.getTypeInfo("AnnotationTestDynamic.DA4")
let DS0 = packageInfo.getTypeInfo("AnnotationTestDynamic.DS0")
let DS1 = packageInfo.getTypeInfo("AnnotationTestDynamic.DS1")
let DS2 = packageInfo.getTypeInfo("AnnotationTestDynamic.DS2")
let DS3 = packageInfo.getTypeInfo("AnnotationTestDynamic.DS3")
let DC0 = packageInfo.getTypeInfo("AnnotationTestDynamic.DC0")
let DC1 = packageInfo.getTypeInfo("AnnotationTestDynamic.DC1")
let DC2 = packageInfo.getTypeInfo("AnnotationTestDynamic.DC2")
let DC3 = packageInfo.getTypeInfo("AnnotationTestDynamic.DC3")
let dynamicFunction1 = packageInfo.getFunctions("globalFunction1")[0]
let dynamicFunction2 = packageInfo.getFunctions("globalFunction1")[0]
let dynamicFunction3 = packageInfo.getFunctions("globalFunction1")[0]
let dynamicFunction4 = packageInfo.getFunctions("globalFunction1")[0]
let dynamicVariable1 = packageInfo.getVariable("globalVariable1")
let dynamicVariable2 = packageInfo.getVariable("globalVariable2")
let dynamicVariable3 = packageInfo.getVariable("globalVariable3")
let dynamicVariable4 = packageInfo.getVariable("globalVariable4")

@Test
class DynamicStructAnnotationTest {
    @TestCase
    func testStructGetAllAnnotations() {
        @Assert(countDynamicAnnotation(dynamicFunction1.getAllAnnotations(), DA1), 2)

        
        @Assert(countDynamicAnnotation(DS0.getAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotation(DS0.getAllAnnotations(), DA2), 0)
        @Assert(countDynamicAnnotation(DS0.getAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotation(DS0.getAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotation(DS1.getAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotation(DS1.getAllAnnotations(), DA2), 0)
        @Assert(countDynamicAnnotation(DS1.getAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotation(DS1.getAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotation(DS2.getAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotation(DS2.getAllAnnotations(), DA2), 1)
        @Assert(countDynamicAnnotation(DS2.getAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotation(DS2.getAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotation(DS3.getAllAnnotations(), DA1), 1)
        @Assert(countDynamicAnnotation(DS3.getAllAnnotations(), DA2), 1)
        @Assert(countDynamicAnnotation(DS3.getAllAnnotations(), DA3), 1)
        @Assert(countDynamicAnnotation(DS3.getAllAnnotations(), DA4), 0)
    }

    @TestCase
    func testStructFindAllAnnotations() {
        // check annotation num
        @Assert(countDynamicAnnotationArray(DS0.findAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotationArray(DS0.findAllAnnotations(), DA2), 0)
        @Assert(countDynamicAnnotationArray(DS0.findAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotationArray(DS0.findAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotationArray(DS1.findAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotationArray(DS1.findAllAnnotations(), DA2), 0)
        @Assert(countDynamicAnnotationArray(DS1.findAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotationArray(DS1.findAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotationArray(DS2.findAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotationArray(DS2.findAllAnnotations(), DA2), 1)
        @Assert(countDynamicAnnotationArray(DS2.findAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotationArray(DS2.findAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotationArray(DS3.findAllAnnotations(), DA1), 1)
        @Assert(countDynamicAnnotationArray(DS3.findAllAnnotations(), DA2), 1)
        @Assert(countDynamicAnnotationArray(DS3.findAllAnnotations(), DA3), 1)
        @Assert(countDynamicAnnotationArray(DS3.findAllAnnotations(), DA4), 0)
    }
}

@Test
class DynamicClassAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countDynamicAnnotation(DC0.getAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotation(DC0.getAllAnnotations(), DA2), 0)
        @Assert(countDynamicAnnotation(DC0.getAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotation(DC0.getAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotation(DC1.getAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotation(DC1.getAllAnnotations(), DA2), 0)
        @Assert(countDynamicAnnotation(DC1.getAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotation(DC1.getAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotation(DC2.getAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotation(DC2.getAllAnnotations(), DA2), 1)
        @Assert(countDynamicAnnotation(DC2.getAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotation(DC2.getAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotation(DC3.getAllAnnotations(), DA1), 1)
        @Assert(countDynamicAnnotation(DC3.getAllAnnotations(), DA2), 1)
        @Assert(countDynamicAnnotation(DC3.getAllAnnotations(), DA3), 1)
        @Assert(countDynamicAnnotation(DC3.getAllAnnotations(), DA4), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countDynamicAnnotationArray(DC0.findAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotationArray(DC0.findAllAnnotations(), DA2), 0)
        @Assert(countDynamicAnnotationArray(DC0.findAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotationArray(DC0.findAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotationArray(DC1.findAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotationArray(DC1.findAllAnnotations(), DA2), 0)
        @Assert(countDynamicAnnotationArray(DC1.findAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotationArray(DC1.findAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotationArray(DC2.findAllAnnotations(), DA1), 2)
        @Assert(countDynamicAnnotationArray(DC2.findAllAnnotations(), DA2), 1)
        @Assert(countDynamicAnnotationArray(DC2.findAllAnnotations(), DA3), 0)
        @Assert(countDynamicAnnotationArray(DC2.findAllAnnotations(), DA4), 0)

        @Assert(countDynamicAnnotationArray(DC3.findAllAnnotations(), DA1), 1)
        @Assert(countDynamicAnnotationArray(DC3.findAllAnnotations(), DA2), 1)
        @Assert(countDynamicAnnotationArray(DC3.findAllAnnotations(), DA3), 1)
        @Assert(countDynamicAnnotationArray(DC3.findAllAnnotations(), DA4), 0)

    }
}

@Test
class DynamicConstructAnnotationTest {
    @TestCase
    func testConstructorGetAllAnnotations() {
        @Assert(countAnnotation<A1>(StructTypeInfo.of<S0>().getConstructor([]).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S0>().getConstructor([]).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S0>().getConstructor([]).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S0>().getConstructor([]).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(StructTypeInfo.of<S1>().getConstructor([]).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S1>().getConstructor([]).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S1>().getConstructor([]).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S1>().getConstructor([]).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(StructTypeInfo.of<S2>().getConstructor([]).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S2>().getConstructor([]).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S2>().getConstructor([]).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S2>().getConstructor([]).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(StructTypeInfo.of<S3>().getConstructor([]).getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(StructTypeInfo.of<S3>().getConstructor([]).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(StructTypeInfo.of<S3>().getConstructor([]).getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(StructTypeInfo.of<S3>().getConstructor([]).getAllAnnotations()), 0)
    }

    @TestCase
    func testConstructorFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S0>().getConstructor([]).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S0>().getConstructor([]).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S0>().getConstructor([]).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S0>().getConstructor([]).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S1>().getConstructor([]).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S1>().getConstructor([]).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S1>().getConstructor([]).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S1>().getConstructor([]).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S2>().getConstructor([]).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S2>().getConstructor([]).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S2>().getConstructor([]).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S2>().getConstructor([]).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(StructTypeInfo.of<S3>().getConstructor([]).findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(StructTypeInfo.of<S3>().getConstructor([]).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(StructTypeInfo.of<S3>().getConstructor([]).findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(StructTypeInfo.of<S3>().getConstructor([]).findAllAnnotations<A4>()), 0)
    }
}

@Test
class DynamicInstanceFunctionAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAllAnnotations<A4>()), 0)
    }

    @TestCase
    func testFindAnnotation() {
        // check annotation num
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C0>().getInstanceFunction("instanceFunction", []).findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAnnotation<A2>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C1>().getInstanceFunction("instanceFunction", []).findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAnnotation<A1>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAnnotation<A3>().isNone())
        @Assert(ClassTypeInfo.of<C2>().getInstanceFunction("instanceFunction", []).findAnnotation<A4>().isNone())

        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAnnotation<A1>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAnnotation<A2>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAnnotation<A3>().isSome())
        @Assert(ClassTypeInfo.of<C3>().getInstanceFunction("instanceFunction", []).findAnnotation<A4>().isNone())
    }
}

@Test
class DynamicStaticFunctionAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getStaticFunction("staticFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getStaticFunction("staticFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getStaticFunction("staticFunction", []).findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getStaticFunction("staticFunction", []).findAllAnnotations<A4>()), 0)

    }

}

@Test
class DynamicInstanceVariableAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getInstanceVariable("instanceVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getInstanceVariable("instanceVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getInstanceVariable("instanceVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getInstanceVariable("instanceVariable").findAllAnnotations<A4>()), 0)

    }

}

@Test
class DynamicStaticVariableAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getStaticVariable("staticVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getStaticVariable("staticVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getStaticVariable("staticVariable").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getStaticVariable("staticVariable").findAllAnnotations<A4>()), 0)

    }

}

@Test
class DynamicInstancePropertyAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getInstanceProperty("instanceProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getInstanceProperty("instanceProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getInstanceProperty("instanceProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getInstanceProperty("instanceProperty").findAllAnnotations<A4>()), 0)


    }

}

@Test
class DynamicStaticPropertyAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getStaticProperty("staticProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getStaticProperty("staticProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getStaticProperty("staticProperty").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getStaticProperty("staticProperty").findAllAnnotations<A4>()), 0)


    }

}

@Test
class DynamicParameterAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C0>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C1>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C2>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(ClassTypeInfo.of<C3>().getInstanceFunction('parameterFunction', [TypeInfo.of<Int64>()]).parameters[0].findAllAnnotations<A4>()), 0)

    }

}

@Test
class DynamicGlobalVariableAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(PackageInfo.get("default").getVariable("globalVariable1").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getVariable("globalVariable1").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getVariable("globalVariable1").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getVariable("globalVariable1").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getVariable("globalVariable2").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getVariable("globalVariable2").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getVariable("globalVariable2").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getVariable("globalVariable2").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getVariable("globalVariable3").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getVariable("globalVariable3").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getVariable("globalVariable3").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getVariable("globalVariable3").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getVariable("globalVariable4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getVariable("globalVariable4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getVariable("globalVariable4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getVariable("globalVariable4").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable1").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getVariable("globalVariable1").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getVariable("globalVariable1").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getVariable("globalVariable1").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable2").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getVariable("globalVariable2").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getVariable("globalVariable2").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getVariable("globalVariable2").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable3").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getVariable("globalVariable3").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getVariable("globalVariable3").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getVariable("globalVariable3").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getVariable("globalVariable4").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getVariable("globalVariable4").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getVariable("globalVariable4").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getVariable("globalVariable4").findAllAnnotations<A4>()), 0)

    }
}

@Test
class DynamicGlobalFunctionAnnotationTest {
    @TestCase
    func testGetAllAnnotations() {
        @Assert(countAnnotation<A1>(PackageInfo.get("default").getFunction("globalFunction1").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getFunction("globalFunction1").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getFunction("globalFunction1").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getFunction("globalFunction1").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getFunction("globalFunction2").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getFunction("globalFunction2").getAllAnnotations()), 0)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getFunction("globalFunction2").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getFunction("globalFunction2").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getFunction("globalFunction3").getAllAnnotations()), 2)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getFunction("globalFunction3").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getFunction("globalFunction3").getAllAnnotations()), 0)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getFunction("globalFunction3").getAllAnnotations()), 0)

        @Assert(countAnnotation<A1>(PackageInfo.get("default").getFunction("globalFunction4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A2>(PackageInfo.get("default").getFunction("globalFunction4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A3>(PackageInfo.get("default").getFunction("globalFunction4").getAllAnnotations()), 1)
        @Assert(countAnnotation<A4>(PackageInfo.get("default").getFunction("globalFunction4").getAllAnnotations()), 0)
    }

    @TestCase
    func testFindAllAnnotations() {
        // check annotation num
        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction1").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getFunction("globalFunction1").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getFunction("globalFunction1").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getFunction("globalFunction1").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction2").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getFunction("globalFunction2").findAllAnnotations<A2>()), 0)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getFunction("globalFunction2").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getFunction("globalFunction2").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction3").findAllAnnotations<A1>()), 2)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getFunction("globalFunction3").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getFunction("globalFunction3").findAllAnnotations<A3>()), 0)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getFunction("globalFunction3").findAllAnnotations<A4>()), 0)

        @Assert(countAnnotationArray<A1>(PackageInfo.get("default").getFunction("globalFunction4").findAllAnnotations<A1>()), 1)
        @Assert(countAnnotationArray<A2>(PackageInfo.get("default").getFunction("globalFunction4").findAllAnnotations<A2>()), 1)
        @Assert(countAnnotationArray<A3>(PackageInfo.get("default").getFunction("globalFunction4").findAllAnnotations<A3>()), 1)
        @Assert(countAnnotationArray<A4>(PackageInfo.get("default").getFunction("globalFunction4").findAllAnnotations<A4>()), 0)
    }

}
