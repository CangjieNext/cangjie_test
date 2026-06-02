/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a10_01

  @Level:         1

  @Assertion: 6.2.1.2(10)
              The type that inherits or implements the sealed interface does not need to be modified by public.

  @Description: Check that types that inherit or implement a sealed interface
                may have the modifier 'public' or may omit it

  @Mode: run

  @Negative: no

  @CompileWarning:yes

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

sealed interface I1 {}
sealed interface I2<T> {}
public sealed interface I3 {}
public sealed interface I4<T> {}

// Inheriting interfaces
interface J1 <: I1 {}
interface J2 <: I2<Bool> {}
interface J3 <: I3 {}
interface J4 <: I4<Rune> {}

public interface J5 <: I1 {}
public interface J6 <: I2<Bool> {}
public interface J7 <: I3 {}
public interface J8 <: I4<Rune> {}

// Implementing classes
class C1 <: I1 {}
class C2 <: I2<Int64> {}
class C3 <: I3 {}
class C4 <: I4<Float32> {}

public class C5 <: I1 {}
public class C6 <: I2<Int32> {}
public class C7 <: I3 {}
public class C8 <: I4<Float64> {}

// Implementing structs
struct S1 <: I1 {}
struct S2 <: I2<UInt16> {}
struct S3 <: I3 {}
struct S4 <: I4<Int16> {}

public struct S5 <: I1 {}
public struct S6 <: I2<UInt8> {}
public struct S7 <: I3 {}
public struct S8 <: I4<Int8> {}

// Implementing enums
enum E1 <: I1 {
    E(String) | Na
}
enum E2 <: I2<Object> {
    E(String) | Na
}
enum E3 <: I3 {
    E(String) | Na
}
enum E4 <: I4<Any> {
    E(String) | Na
}

public enum E5 <: I1 {
    E(String) | Na
}
public enum E6 <: I2<Rune> {
    E(String) | Na
}
public enum E7 <: I3 {
    E(String) | Na
}
public enum E8 <: I4<Unit> {
    E(String) | Na
}

class Check1<T> where T <: I1 {}
class Check2<T> where T <: I2<Bool> {}
class Check3<T> where T <: I3 {}
class Check4<T> where T <: I4<Rune> {}

main() {
    let t1 = Check1<J1>()
    Assert.isTrue(t1 is Check1<J1>)

    let t2 = Check2<J2>()
    Assert.isTrue(t2 is Check2<J2>)

    let t3 = Check3<J3>()
    Assert.isTrue(t3 is Check3<J3>)

    let t4 = Check4<J4>()
    Assert.isTrue(t4 is Check4<J4>)

    let t5 = Check1<J5>()
    Assert.isTrue(t5 is Check1<J5>)

    let t6 = Check2<J6>()
    Assert.isTrue(t6 is Check2<J6>)

    let t7 = Check3<J7>()
    Assert.isTrue(t7 is Check3<J7>)

    let t8 = Check4<J8>()
    Assert.isTrue(t8 is Check4<J8>)

    let c1 = C1()
    Assert.isTrue(c1 is I1)

    let c2 = C2()
    Assert.isTrue(c2 is I2<Int64>)

    let c3 = C3()
    Assert.isTrue(c3 is I3)

    let c4 = C4()
    Assert.isTrue(c4 is I4<Float32>)

    let c5 = C5()
    Assert.isTrue(c5 is I1)

    let c6 = C6()
    Assert.isTrue(c6 is I2<Int32>)

    let c7 = C7()
    Assert.isTrue(c7 is I3)

    let c8 = C8()
    Assert.isTrue(c8 is I4<Float64>)

    let s1 = S1()
    Assert.isTrue(s1 is I1)

    let s2 = S2()
    Assert.isTrue(s2 is I2<UInt16>)

    let s3 = S3()
    Assert.isTrue(s3 is I3)

    let s4 = S4()
    Assert.isTrue(s4 is I4<Int16>)

    let s5 = S5()
    Assert.isTrue(s5 is I1)

    let s6 = S6()
    Assert.isTrue(s6 is I2<UInt8>)

    let s7 = S7()
    Assert.isTrue(s7 is I3)

    let s8 = S8()
    Assert.isTrue(s8 is I4<Int8>)

    let e1 = E1.E("")
    Assert.isTrue(e1 is I1)

    let e2 = E2.E("")
    Assert.isTrue(e2 is I2<Object>)

    let e3 = E3.E("")
    Assert.isTrue(e3 is I3)

    let e4 = E4.E("")
    Assert.isTrue(e4 is I4<Any>)

    let e5 = E5.E("")
    Assert.isTrue(e5 is I1)

    let e6 = E6.E("")
    Assert.isTrue(e6 is I2<Rune>)

    let e7 = E7.E("")
    Assert.isTrue(e7 is I3)

    let e8 = E8.E("")
    Assert.isTrue(e8 is I4<Unit>)
}
