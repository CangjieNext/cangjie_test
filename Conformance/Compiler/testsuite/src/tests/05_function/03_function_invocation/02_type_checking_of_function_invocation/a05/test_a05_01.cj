/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a05_01

  @Level:         1

  @Assertion:       5.3.2(5) Assume that the function is defined as: 
                        𝑓𝑖 < 𝑇𝑖1 , ..., 𝑇𝑖𝑝 > (𝐴𝑖1 , ..., 𝐴𝑖𝑘 ) ∶ 𝑅𝑖 𝑤ℎ𝑒𝑟𝑒 𝐶𝑖1 , ..., 𝐶𝑖𝑞𝑖 
                    1) If the invoking expression contains the type argument fi<T1, ..., Tp>(A1, ..., Ak), the rule 
                    for checking the type of the fi function is as follows: 
                        a) First, check constraints of the type parameters: the type arguments `<T1, ..., Tp>` must 
                        meet the type constraints of the `fi` function. 
                            𝜎 = [𝑇1 ↦ 𝑇𝑖1 , ..., 𝑇𝑝 ↦ 𝑇𝑖𝑝]Δ ⊢ 𝜎 𝑠𝑜𝑙𝑣𝑒𝑠 𝐶𝑖1 , ..., 𝐶𝑖𝑞𝑖 
                        b) Parameter type checking: after the type arguments are substituted into the parameters of 
                        the function fi, the argument types (A1, ..., Ak) is the subtype of the type after the type 
                        arguments are substituted into the parameters. 
                            𝜎 = [𝑇1 ↦ 𝑇𝑖1 , ..., 𝑇𝑝 ↦ 𝑇𝑖𝑝]Δ ⊢ (𝐴1, ..., 𝐴𝑘) <∶ 𝜎(𝐴𝑖1 , ..., 𝐴𝑖𝑘 ) 

                        c) Check the type of the return type : If the context of the calling expression has a specific 
                        type requirement R, after the type arguments are substituted into the return type Ri of the 
                        function fi, the return type after substituted is the subtype of R. 
                            𝜎 = [𝑇1 ↦ 𝑇𝑖1 , ..., 𝑇𝑝 ↦ 𝑇𝑖𝑝]Δ ⊢ 𝜎𝑅𝑖 <∶ 𝑅

  @Description:     Check that if arguments types and return type meet the function definition - no error will be 
                    raised.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func f0<X>(a: X): X where X <: ToString {a}
    func f1<X, Y>(a: X, b: Y): String where X <: ToString, Y <: ToString {"${a} ${b}"}
}

struct myStruct {
    func f0<X>(a: X): X where X <: ToString {a}
    func f1<X, Y>(a: X, b: Y): String where X <: ToString, Y <: ToString {"${a} ${b}"}
}

enum myEnum {
    R

    func f0<X>(a: X): X where X <: ToString {a}
    func f1<X, Y>(a: X, b: Y): String where X <: ToString, Y <: ToString {"${a} ${b}"}
}

func f0<X>(a: X): X where X <: ToString {a}
func f1<X, Y>(a: X, b: Y): String where X <: ToString, Y <: ToString {"${a} ${b}"}

main(): Unit {
    var myInt32: Int32 = 10
    var myBool: Bool = true

    Assert.isTrue(myInt32 is ToString)
    Assert.isTrue(f0<Int32> is (Int32) -> Int32)
    Assert.equals(myInt32, f0<Int32>(myInt32))
    Assert.isTrue(f0<Int32>(myInt32) is Int32)

    Assert.isTrue(myInt32 is ToString)
    Assert.isTrue(myBool is ToString)
    Assert.isTrue(f1<Int32, Bool> is (Int32, Bool) -> String)
    Assert.equals("10 true", f1<Int32, Bool>(myInt32, myBool))
    Assert.isTrue(f1<Int32, Bool>(myInt32, myBool) is String)

    var myClassImpl = myClass()
    Assert.isTrue(myInt32 is ToString)
    Assert.isTrue(myClassImpl.f0<Int32> is (Int32) -> Int32)
    Assert.equals(myInt32, myClassImpl.f0<Int32>(myInt32))
    Assert.isTrue(myClassImpl.f0<Int32>(myInt32) is Int32)

    Assert.isTrue(myInt32 is ToString)
    Assert.isTrue(myBool is ToString)
    Assert.isTrue(myClassImpl.f1<Int32, Bool> is (Int32, Bool) -> String)
    Assert.equals("10 true", myClassImpl.f1<Int32, Bool>(myInt32, myBool))
    Assert.isTrue(myClassImpl.f1<Int32, Bool>(myInt32, myBool) is String)

    var myStructImpl = myStruct()
    Assert.isTrue(myInt32 is ToString)
    Assert.isTrue(myStructImpl.f0<Int32> is (Int32) -> Int32)
    Assert.equals(myInt32, myStructImpl.f0<Int32>(myInt32))
    Assert.isTrue(myStructImpl.f0<Int32>(myInt32) is Int32)

    Assert.isTrue(myInt32 is ToString)
    Assert.isTrue(myBool is ToString)
    Assert.isTrue(myStructImpl.f1<Int32, Bool> is (Int32, Bool) -> String)
    Assert.equals("10 true", myStructImpl.f1<Int32, Bool>(myInt32, myBool))
    Assert.isTrue(myStructImpl.f1<Int32, Bool>(myInt32, myBool) is String)

    Assert.isTrue(myInt32 is ToString)
    Assert.isTrue(myEnum.R.f0<Int32> is (Int32) -> Int32)
    Assert.equals(myInt32, myEnum.R.f0<Int32>(myInt32))
    Assert.isTrue(myEnum.R.f0<Int32>(myInt32) is Int32)

    Assert.isTrue(myInt32 is ToString)
    Assert.isTrue(myBool is ToString)
    Assert.isTrue(myEnum.R.f1<Int32, Bool> is (Int32, Bool) -> String)
    Assert.equals("10 true", myEnum.R.f1<Int32, Bool>(myInt32, myBool))
    Assert.isTrue(myEnum.R.f1<Int32, Bool>(myInt32, myBool) is String)
}
