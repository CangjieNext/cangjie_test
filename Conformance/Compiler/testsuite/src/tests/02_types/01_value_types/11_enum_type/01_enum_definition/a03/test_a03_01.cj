/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_01_a03_01

  @Level:         1

  @Assertion:       2.1.11.1(3) After enumBody you can define other members of enum, including member functions, 
  operator overloading functions, member properties.

  @Description:     Checks that enum can have multiple member functions, 
  operator overloading functions and member properties

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Issue: 0006124

*/

struct St {
    var i = 575
}

interface I2 {}
open class A2{}

class B2 <: A2 & I2 {}

type Tada = Option<(Int64, I2)>

enum En {
    A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W |X | Y | Z
    | A(Int8) | B(UInt8) | C(Int16) | D(UInt16) | E(Int32) | F(UInt32) | G(Int64) | H(UInt64) | I(Bool) | 
    J(Rune) | K(IntNative) | L(UIntNative) | M(Float16) | N(Float32) | O(Float64) | P(Unit) | Q(String) 
    | R(Rune, Int64) | S(Range<Int64>) | T((Rune)->String) | U(St) | V(Option<St>) | W(Array<St>) |X(I2) 
    | Y(A2) | Z(Int8, Int16, Int32, Int64, IntNative, UInt8, UInt16, UInt32, UInt64, UIntNative, Float16,
      Float32, Float64, Bool, Rune, Unit, String, (Int8, Int16, Int32, Int64, IntNative), Range<UInt64>, 
      (Float32) -> Int64, St, Option<I2>, Array<A2>, I2, A2, B2/**/)

    prop x: Int64 {
        get() { 42 }
    }
    prop y: Int64 {
        get() { 56742 }
    }
    static prop z: Int64 {
        get() { 4254 }
    }

    func foo1() {}
    operator func+(x: Int64) { 42 }
    static func buzz() {}
    operator func+(x: En) { 4453 }
    operator func+(x: Tada) { (x?[0]).getOrThrow()+64243 }
}
 

main() {
    var a = A
    var b = B
    var c = C
    var d = D
    var e = E
    var f = F
    var g = G
    var h = H(23059325u64)
    var s = S((23..5767))
    var z = Z(0i8, -35i16, -4545i32, -325632487348, IntNative(1282736), 55u8, 345u16, 3764545545u32, 
      3259474326432644u64, UIntNative(233432434), 24.434f16, 23442334.34435454f32, 5543543566.323423423,
      true, r'd', (), "asaskhehi", (21i8, 555i16, 5634534i32, 34534545, IntNative(25324324)), (343..34454),
      { f: Float32 => Int64(f) - 2234667 }, St(), Some(B2()), [A2(), B2(), A2()], B2(), A2(), B2()/**/)
    
    var aha = z + (4361, B2()) + 56241
    b.foo1()
    En.buzz()
    var fin = s + a + d.x + e.y
    En.z - 4254
}
