/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (not MAC) EXEC: cd ./MyType && %compiler %cmp_opt --output-type=dylib --module-name=MyType ./src/myType/*.cj -o libMyType_myType.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f --import-path . -L ./MyType -lMyType_myType %cmp_utest_opt
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args

import std.reflect.*
import MyType.myType.*

@Annotation
public class MyAnnotation {
    public let id: Int64
    public let data: String

    public const init(id!: Int64, data!: String) {
        this.id = id
        this.data = data
    }
    public const init(id: Int64) {
        this.id = id
        this.data = ""
    }
    public const init(data!: String) {
        this.id = 0
        this.data = data
    }
}

@MyAnnotation[data: "datas"]
public class Foo {}

@MyAnnotation[50]
public class Bar {}

@MyAnnotation[data: "hundred", id: 100]
public class Doe {
    public const init() {}
}

public enum E {
    A | B | C
}

@Annotation
public class MyAnnotation2 {
    public let a: Int64
    public let b: Int32
    public let c: Int16
    public let d: Int8
    public let e: Float64
    public let f: Float32
    public let g: Float16
    public let h: E
    public let j: Doe
    public let k: Int64
    public let l: Int64
    public let m: Int64
    public let n: Int64

    const init(a: Int64, b: Int32, c: Int16, d: Int8, e: Float64, f: Float32, g: Float16, h: E, j: Doe, k: Int64,
        l: Int64, m: Int64, n: Int64) {
        this.a = a
        this.b = b
        this.c = c
        this.d = d
        this.e = e
        this.f = f
        this.g = g
        this.h = h
        this.j = j
        this.k = k
        this.l = l
        this.m = m
        this.n = n
    }

    const init(extra: Int64, a!: Int64, b!: Int32, c!: Int16, d!: Int8, e!: Float64, f!: Float32, g!: Float16, h!: E,
        j!: Doe, k!: Int64, l!: Int64, m!: Int64, n!: Int64) {
        this.a = a
        this.b = b
        this.c = c
        this.d = d
        this.e = e
        this.f = f
        this.g = g
        this.h = h
        this.j = j
        this.k = k
        this.l = l
        this.m = m
        this.n = n
    }
}

const d = Doe()

@MyAnnotation2[1, 2, 3, 4, 5.0, 6.0, 7.0, B, d, 10, 11, 12, 13]
public class Yol {}

@MyAnnotation2[233, a: 1, b: 2, c: 3, d: 4, e: 5.0, f: 6.0, g: 7.0, h: B, j: d, k: 10, l: 11, m: 12, n: 13]
public class Geb {}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect((TypeInfo.of<Foo>().findAnnotation<MyAnnotation>().getOrThrow() as MyAnnotation).getOrThrow().id, 0)
        @Expect((TypeInfo.of<Foo>().findAnnotation<MyAnnotation>().getOrThrow() as MyAnnotation).getOrThrow().data, "datas")

        @Expect((TypeInfo.of<Bar>().findAnnotation<MyAnnotation>().getOrThrow() as MyAnnotation).getOrThrow().id, 50)
        @Expect((TypeInfo.of<Bar>().findAnnotation<MyAnnotation>().getOrThrow() as MyAnnotation).getOrThrow().data, "")

        @Expect((TypeInfo.of<Doe>().findAnnotation<MyAnnotation>().getOrThrow() as MyAnnotation).getOrThrow().id, 100)
        @Expect((TypeInfo.of<Doe>().findAnnotation<MyAnnotation>().getOrThrow() as MyAnnotation).getOrThrow().data, "hundred")

        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().a, 1)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().b, 2)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().c, 3)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().d, 4)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().e, 5.0)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().f, 6.0)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().g, 7.0)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().h is E, true)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().j is Doe, true)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().k, 10)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().l, 11)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().m, 12)
        @Expect((TypeInfo.of<Yol>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().n, 13)

        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().a, 1)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().b, 2)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().c, 3)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().d, 4)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().e, 5.0)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().f, 6.0)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().g, 7.0)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().h is E, true)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().j is Doe, true)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().k, 10)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().l, 11)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().m, 12)
        @Expect((TypeInfo.of<Geb>().findAnnotation<MyAnnotation2>().getOrThrow() as MyAnnotation2).getOrThrow().n, 13)
    }
}
