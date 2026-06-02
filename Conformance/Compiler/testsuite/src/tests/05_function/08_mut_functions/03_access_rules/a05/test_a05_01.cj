/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_03_a05_01

  @Level:         1

  @Assertion:       5.8.3(5) Non-mut instance member functions (including lambda expressions) cannot access mut 
                    functions of this, and vice versa. 

  @Description:     Check that non-mut instance member functions are accessible from mut instance member.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

interface myI { 
    mut func funcMut0(): String { 
        "AAA ${funcNotMut()} ${funcMut1()}"
    } 
    mut func funcMut1(): String { 
        "BBB ${funcNotMut()} ${funcMut2()}"
    } 
    mut func funcMut2(): Int64 { 12 }
    func funcNotMut(): Bool { true } 
} 

struct myStruct0 <: myI {
    mut func funcMut10(a: Int64): Int64 {a + funcMut2()}
    func funcNotMut10(a: Int64): Int64 {a + 5} 
}

struct myStruct {
    mut func funcMut0(a: Int64): Int64 {a + funcNotMut0(a)}
    func funcNotMut0(a: Int64): Int64 {a + 5} 
}

extend myStruct {
    mut func funcMut1(a: Int64): Int64 {a + funcNotMut0(a) + funcNotMut1(a)}
    func funcNotMut1(a: Int64): Int64 {a + 6} 
}

main() {
    var myStructImpl = myStruct()
    Assert.equals(21, myStructImpl.funcNotMut0(16))
    Assert.equals(22, myStructImpl.funcNotMut1(16))
    Assert.equals(37, myStructImpl.funcMut0(16))
    Assert.equals(59, myStructImpl.funcMut1(16))

    var myStruct0Impl = myStruct0()
    Assert.equals(28, myStruct0Impl.funcMut10(16))
    Assert.equals(true, myStruct0Impl.funcNotMut())
    Assert.equals(12, myStruct0Impl.funcMut2())
    Assert.equals("AAA true BBB true 12", myStruct0Impl.funcMut0())
    Assert.equals("BBB true 12", myStruct0Impl.funcMut1())
}
