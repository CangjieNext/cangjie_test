/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a09_01

  @Level:         1

  @Assertion: 2.1.10.2(9)
              The member variable parameter is introduced to reduce code redundancy.
              Defines a member variable parmeter, including the definitions of both a parameter
              and a member variable.

  @Description: Check that member variable parameters behave like ordinary function parameters
                and introduce a struct member variable, namely:
                1. parameters are initialized with arguments of corresponding types
                   during the primary constructor invocation
                2. parameters are visible inside the primary constructor and contain values
                   that were passed through arguments during the constructor invocation
                3. parameters could be unnamed or named
                4. arguments for unnamed parameters are passed as values
                5. arguments for named parameters are passed as names plus values
                6. the ordering of arguments for named parameters is not fixed
                7. named parameters can have default values
                8. the new variable with the same name is created in the struct scope

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006183

*/

import utils.assert.Assert

struct S {
    var a = 15
    init(x: Int64) {
        a = x
    }
    init() {}
}

class A {
    var a = 15
    init(x: Int64) {
        a = x
    }
    init() {}
}

enum E {
    M(Int64) | D(Float64)
}

struct UnnamedParams {
    UnnamedParams(
                  public let p1: Int64,
                  public var p2: Int32,
                  public let p3: Int16,
                  private var p4: Int8,
                  private let p5: Float16,
                  private var p6: Float32,
                  let p7: Float64,
                  var p8: Unit,
                  public let p9: Rune,
                  public var p10: String,
                  public let p11: (Int64, Int64, Int64),
                  private var p12: Range<Int64>,
                  private let p13: (Int64, Int64) -> Int64,
                  private var p14: Array<Int64>,
                  let p15: S,
                  var p16: A,
                  let p17: E) {
        Assert.equals(10, p1)
        Assert.equals(10, this.p1)
        Assert.equals(11i32, p2)
        Assert.equals(11i32, this.p2)
        Assert.equals(12i16, p3)
        Assert.equals(12i16, this.p3)
        Assert.equals(13i8, p4)
        Assert.equals(13i8, this.p4)
        Assert.approxEquals(0.11f16, p5)
        Assert.approxEquals(0.11f16, this.p5)
        Assert.approxEquals(0.11e-10f32, p6)
        Assert.approxEquals(0.11e-10f32, this.p6)
        Assert.approxEquals(0.11e-100, p7)
        Assert.approxEquals(0.11e-100, this.p7)
        Assert.isTrue(p8 is Unit)
        Assert.isTrue(this.p8 is Unit)
        Assert.equals(r'a', p9)
        Assert.equals(r'a', this.p9)
        Assert.equals("A", p10)
        Assert.equals("A", this.p10)
        Assert.equals(1, p11[0])
        Assert.equals(2, p11[1])
        Assert.equals(3, p11[2])
        Assert.equals(1, this.p11[0])
        Assert.equals(2, this.p11[1])
        Assert.equals(3, this. p11[2])
        Assert.equals(-100..100:2, p12)
        Assert.equals(-100..100:2, this.p12)
        Assert.equals(-1, p13(-100, 99))
        Assert.equals(-1, this.p13(-100, 99))
        Assert.equals([1, 2, 3, 4, 5], p14)
        Assert.equals([1, 2, 3, 4, 5], this.p14)
        Assert.equals(-7, p15.a)
        Assert.equals(-7, this.p15.a)
        Assert.equals(7, p16.a)
        Assert.equals(7, this.p16.a)
        let t1 = match(p17) {
            case D(a) => a
            case _ => 0.0
        }
        Assert.approxEquals(1.76, t1)
        let t2 = match(this.p17) {
            case D(a) => a
            case _ => 0.0
        }
        Assert.approxEquals(1.76, t2)
    }
}

struct NamedParams {
    NamedParams(
                public let p1!: Int64,
                public var p2!: Int32,
                public let p3!: Int16,
                private var p4!: Int8,
                private let p5!: Float16,
                private var p6!: Float32,
                let p7!: Float64,
                var p8!: Unit,
                public let p9!: Rune,
                public var p10!: String,
                public let p11!: (Int64, Int64),
                private var p12!: Range<Int64>,
                private let p13!: (Int64, Int64) -> Int64,
                private var p14!: Array<Int64>,
                let p15!: S,
                var p16!: A,
                let p17!: E) {
        Assert.equals(100, p1)
        Assert.equals(100, this.p1)
        Assert.equals(50i32, p2)
        Assert.equals(50i32, this.p2)
        Assert.equals(25i16, p3)
        Assert.equals(25i16, this.p3)
        Assert.equals(12i8, p4)
        Assert.equals(12i8, this.p4)
        Assert.approxEquals(-.416841f16, p5)
        Assert.approxEquals(-.416841f16, this.p5)
        Assert.approxEquals(-.04419f32, p6)
        Assert.approxEquals(-.04419f32, this.p6)
        Assert.approxEquals(-.419841, p7)
        Assert.approxEquals(-.419841, this.p7)
        Assert.isTrue(p8 is Unit)
        Assert.isTrue(this.p8 is Unit)
        Assert.equals(r'b', p9)
        Assert.equals(r'b', this.p9)
        Assert.equals("B", p10)
        Assert.equals("B", this.p10)
        Assert.equals(10, p11[0])
        Assert.equals(20, p11[1])
        Assert.equals(10, this.p11[0])
        Assert.equals(20, this.p11[1])
        Assert.equals(1..4:1, p12)
        Assert.equals(1..4:1, this.p12)
        Assert.equals(1, p13(100, 99))
        Assert.equals(1, this.p13(100, 99))
        Assert.equals([1, 2], p14)
        Assert.equals([1, 2], this.p14)
        Assert.equals(10, p15.a)
        Assert.equals(10, this.p15.a)
        Assert.equals(9, p16.a)
        Assert.equals(9, this.p16.a)
        let t1 = match(p17) {
            case M(a) => a
            case _ => 0
        }
        Assert.equals(2, t1)
        let t2 = match(this.p17) {
            case M(a) => a
            case _ => 0
        }
        Assert.equals(2, t2)
    }
}

struct MixedParams {
    MixedParams(
                let a: Int64,
                var b: Float64,
                public let c!: Rune,
                private var d!: String,
                let e!: Bool) {
        Assert.equals(1, a)
        Assert.approxEquals(-7.7, b)
        Assert.equals(r'c', c)
        Assert.equals("x", d)
        Assert.equals(false, e)

        Assert.equals(1, this.a)
        Assert.approxEquals(-7.7, this.b)
        Assert.equals(r'c', this.c)
        Assert.equals("x", this.d)
        Assert.equals(false, this.e)
    }
}

struct MixedParamsRegular {
    MixedParamsRegular(a: Int64, b: Float64, private let c: Rune, let d!: String, public let e!: Bool) {
        Assert.equals(1, a)
        Assert.approxEquals(-7.7, b)
        Assert.equals(r'c', c)
        Assert.equals(r'c', this.c)
        Assert.equals("x", d)
        Assert.equals("x", this.d)
        Assert.equals(false, e)
        Assert.equals(false, this.e)
    }
}

struct Ordering {
    Ordering(
             private let a!: Int64,
             public var b!: Int64,
             var c!: Int64) {
        Assert.equals(1, a)
        Assert.equals(2, b)
        Assert.equals(3, c)

        Assert.equals(1, this.a)
        Assert.equals(2, this.b)
        Assert.equals(3, this.c)
    }
}

struct Default {
    Default(
            public let p1!: Int64 = 0,
            public var p2!: Int32 = 1i32,
            public let p3!: Int16 = 2i16,
            private var p4!: Int8 = 3i8,
            private let p5!: Float16 = 0.1f16,
            private var p6!: Float32 = 0.01f32,
            let p7!: Float64 = 0.001,
            var p8!: Unit = (),
            public let p9!: Rune = r'o',
            public var p10!: String = "s",
            public let p11!: (Int64, Int64) = (-1, -1),
            private var p12!: Range<Int64> = 1..10:1,
            private let p13!: (Int64, Int64) -> Int64 = {x: Int64, y: Int64 => x * y},
            private var p14!: Array<Int64> = [1, 1, 1],
            let p15!: S = S(17),
            var p16!: A = A(99),
            let p17!: E = E.M(35)) {
        Assert.equals(0, p1)
        Assert.equals(0, this.p1)
        Assert.equals(1i32, p2)
        Assert.equals(1i32, this.p2)
        Assert.equals(2i16, p3)
        Assert.equals(2i16, this.p3)
        Assert.equals(3i8, p4)
        Assert.equals(3i8, this.p4)
        Assert.approxEquals(0.1f16, p5)
        Assert.approxEquals(0.1f16, this.p5)
        Assert.approxEquals(0.01f32, p6)
        Assert.approxEquals(0.01f32, this.p6)
        Assert.approxEquals(0.001, p7)
        Assert.approxEquals(0.001, this.p7)
        Assert.isTrue(p8 is Unit)
        Assert.isTrue(this.p8 is Unit)
        Assert.equals(r'o', p9)
        Assert.equals(r'o', this.p9)
        Assert.equals("s", p10)
        Assert.equals("s", this.p10)
        Assert.equals(-1, p11[0])
        Assert.equals(-1, p11[1])
        Assert.equals(-1, this.p11[0])
        Assert.equals(-1, this.p11[1])
        Assert.equals(1..10:1, p12)
        Assert.equals(1..10:1, this.p12)
        Assert.equals(9900, p13(100, 99))
        Assert.equals(9900, this.p13(100, 99))
        Assert.equals([1, 1, 1], p14)
        Assert.equals([1, 1, 1], this.p14)
        Assert.equals(17, p15.a)
        Assert.equals(17, this.p15.a)
        Assert.equals(99, p16.a)
        Assert.equals(99, this.p16.a)
        let t1 = match(p17) {
            case M(a) => a
            case _ => 0
        }
        Assert.equals(35, t1)
        let t2 = match(this.p17) {
            case M(a) => a
            case _ => 0
        }
        Assert.equals(35, t2)
    }
}

struct DefaultOverwritten {
    DefaultOverwritten(
                        public let p1!: Int64 = 0,
                        public var p2!: Int32 = 1i32,
                        public let p3!: Int16 = 2i16,
                        private var p4!: Int8 = 3i8,
                        private let p5!: Float16 = 0.1f16,
                        private var p6!: Float32 = 0.01f32,
                        let p7!: Float64 = 0.001,
                        var p8!: Unit = (),
                        public let p9!: Rune = r'o',
                        public var p10!: String = "s",
                        public let p11!: (Int64, Int64) = (-1, -1),
                        private var p12!: Range<Int64> = 1..10:1,
                        private let p13!: (Int64, Int64) -> Int64 = {x: Int64, y: Int64 => x * y},
                        private var p14!: Array<Int64> = [1, 1, 1],
                        let p15!: S = S(17),
                        var p16!: A = A(99),
                        let p17!: E = E.M(35)) {
        Assert.equals(100, p1)
        Assert.equals(100, this.p1)
        Assert.equals(50i32, p2)
        Assert.equals(50i32, this.p2)
        Assert.equals(25i16, p3)
        Assert.equals(25i16, this.p3)
        Assert.equals(12i8, p4)
        Assert.equals(12i8, this.p4)
        Assert.approxEquals(-.416841f16, p5)
        Assert.approxEquals(-.416841f16, this.p5)
        Assert.approxEquals(-.04419f32, p6)
        Assert.approxEquals(-.04419f32, this.p6)
        Assert.approxEquals(-.419841, p7)
        Assert.approxEquals(-.419841, this.p7)
        Assert.isTrue(p8 is Unit)
        Assert.isTrue(this.p8 is Unit)
        Assert.equals(r'b', p9)
        Assert.equals(r'b', this.p9)
        Assert.equals("B", p10)
        Assert.equals("B", this.p10)
        Assert.equals(10, p11[0])
        Assert.equals(20, p11[1])
        Assert.equals(10, this.p11[0])
        Assert.equals(20, this.p11[1])
        Assert.equals(1..4:1, p12)
        Assert.equals(1..4:1, this.p12)
        Assert.equals(1, p13(100, 99))
        Assert.equals(1, this.p13(100, 99))
        Assert.equals([1, 2], p14)
        Assert.equals([1, 2], this.p14)
        Assert.equals(-1, p15.a)
        Assert.equals(-1, this.p15.a)
        Assert.equals(-2, p16.a)
        Assert.equals(-2, this.p16.a)
        let t1 = match(p17) {
            case M(a) => a
            case _ => 0
        }
        Assert.equals(-3, t1)
        let t2 = match(this.p17) {
            case M(a) => a
            case _ => 0
        }
        Assert.equals(-3, t2)
    }
}

main() {
    var a = A()
    a.a = 7
    var s = S()
    s.a = -7
    var e = E.D(1.76)
    // Check various types for unnamed parameters
    let case1 = UnnamedParams(10, 11i32, 12i16, 13i8, 0.11f16, 0.11e-10f32, 0.11e-100, (), r'a', "A", 
                              (1, 2, 3), -100..100:2, {x: Int64, y: Int64 => x + y}, [1, 2, 3, 4, 5],
                              s, a, e)

    a.a = 9
    s.a = 10
    e = E.M(2)
    // Check various types for named parameters
    let case2 = NamedParams(
        p1: 100,
        p2: 50i32,
        p3: 25i16,
        p4: 12i8,
        p5: -.416841f16,
        p6: -.04419f32,
        p7: -.419841,
        p8: (),
        p9: r'b',
        p10: "B",
        p11: (10, 20),
        p12: 1..4:1,
        p13: {x: Int64, y: Int64 => x - y },
        p14: [1, 2],
        p15: s,
        p16: a,
        p17: e
    )

    // Check the mix of parameters
    let case3 = MixedParams(1, -7.7, c: r'c', d: "x", e: false)

    // Check the mix of regular and struct members parameters
    let case4 = MixedParamsRegular(1, -7.7, r'c', d: "x", e: false)

    // Check the ordering of arguments for named parameters
    let case5 = Ordering(c: 3, b: 2, a: 1)

    // Check the default values
    let case6 = Default()

    // Check the default values but overwritten
    let case7 = DefaultOverwritten(
        p1: 100,
        p2: 50i32,
        p3: 25i16,
        p4: 12i8,
        p5: -.416841f16,
        p6: -.04419f32,
        p7: -.419841,
        p8: (),
        p9: r'b',
        p10: "B",
        p11: (10, 20),
        p12: 1..4:1,
        p13: {x: Int64, y: Int64 => x - y },
        p14: [1, 2],
        p15: S(-1),
        p16: A(-2),
        p17: E.M(-3)
    )
}