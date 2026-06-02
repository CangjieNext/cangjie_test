/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a06_01

  @Level:         1

  @Comment:         Assume that the function is defined as: 
                        𝑓𝑖 < 𝑇𝑖1 , ..., 𝑇𝑖𝑝 > (𝐴𝑖1 , ..., 𝐴𝑖𝑘 ) ∶ 𝑅𝑖 𝑤ℎ𝑒𝑟𝑒 𝐶𝑖1 , ..., 𝐶𝑖𝑞𝑖 

  @Assertion:       5.3.2(6) 2) If the calling expression does not contain any type argument f(A1, ..., An), the type 
                    checking rules for the function fi are as follows: 
                        a) If `fi` is a non-generic function, check the type according to the following rules: 
                            i. Parameter type checking: The argument type `(A1, ..., Ak)` is the subtype of the 
                            parameter type. 
                                Δ ⊢ (𝐴1, ..., 𝐴𝑘) <∶ (𝐴𝑖1 , ..., 𝐴𝑖𝑘 ) 
                            ii. Check the type of the return type: If the context of the calling expression has a 
                            specific type requirement R, check whether the return type Ri of the function fi is a 
                            subtype of R. 
                                Δ ⊢ 𝑅𝑖 <∶ 𝑅 

  @Description:     Check that if invoked non-generic function with arguments types as subtypes of parameters types 
                    and return value type is subtype of specific type requirement R from context - no error will be 
                    raised. 

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

type myTypeInt32 = Int32
type myTypeBool = Bool

extend myTypeInt32 {
    func doubled() {
        this * 2
    }
}

class myClass {
    func f0(a: Int32, b: Int32): myTypeInt32 { a + b}
    func f1(a: Rune, b: Bool): String {"${b} ${a}"}
}

struct myStruct {
    func f0(a: Int32, b: Int32): myTypeInt32 { a + b}
    func f1(a: Rune, b: Bool): String {"${b} ${a}"}
}

enum myEnum {
    H

    func f0(a: Int32, b: Int32): myTypeInt32 { a + b}
    func f1(a: Rune, b: Bool): String {"${b} ${a}"}
}

func f0(a: Int32, b: Int32): myTypeInt32 { a + b}
func f1(a: Rune, b: Bool): String {"${b} ${a}"}

main() {
    var myInt32Var: Int32 = 12
    var myTypeInt32Var: myTypeInt32 = 3
    var myCharVar: Rune = 'c'
    var myTypeBoolVar: myTypeBool = true


    Assert.isTrue(myInt32Var is Int32)
    Assert.isTrue(myTypeInt32Var is Int32)
    Assert.isTrue(myTypeInt32Var is myTypeInt32)
    Assert.isTrue(f0 is (Int32, Int32) -> Int32)
    Assert.isTrue(f0 is (myTypeInt32, myTypeInt32) -> Int32)
    Assert.isTrue(f0 is (myTypeInt32, myTypeInt32) -> myTypeInt32)
    Assert.isTrue(f0 is (Int32, Int32) -> myTypeInt32)
    Assert.isTrue(f0(myInt32Var, myTypeInt32Var) is myTypeInt32)
    Assert.isTrue(f0(myInt32Var, myTypeInt32Var) is Int32)
    Assert.equals(15, f0(myInt32Var, myTypeInt32Var))

    Assert.isTrue(myCharVar is Rune)
    Assert.isTrue(myTypeBoolVar is Bool)
    Assert.isTrue(myTypeBoolVar is myTypeBool)
    Assert.isTrue(f1 is (Rune, Bool) -> String)
    Assert.isTrue(f1 is (Rune, myTypeBool) -> String)
    Assert.isTrue(f1(myCharVar, myTypeBoolVar) is String)
    Assert.equals("true c", f1(myCharVar, myTypeBoolVar))

    var myClassImpl = myClass()
    Assert.isTrue(myClassImpl.f0 is (Int32, Int32) -> Int32)
    Assert.isTrue(myClassImpl.f0 is (myTypeInt32, myTypeInt32) -> Int32)
    Assert.isTrue(myClassImpl.f0 is (myTypeInt32, myTypeInt32) -> myTypeInt32)
    Assert.isTrue(myClassImpl.f0 is (Int32, Int32) -> myTypeInt32)
    Assert.isTrue(myClassImpl.f0(myInt32Var, myTypeInt32Var) is myTypeInt32)
    Assert.isTrue(myClassImpl.f0(myInt32Var, myTypeInt32Var) is Int32)
    Assert.equals(15, myClassImpl.f0(myInt32Var, myTypeInt32Var))

    Assert.isTrue(myClassImpl.f1 is (Rune, Bool) -> String)
    Assert.isTrue(myClassImpl.f1 is (Rune, myTypeBool) -> String)
    Assert.isTrue(myClassImpl.f1(myCharVar, myTypeBoolVar) is String)
    Assert.equals("true c", myClassImpl.f1(myCharVar, myTypeBoolVar))

    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.f0 is (Int32, Int32) -> Int32)
    Assert.isTrue(myStructImpl.f0 is (myTypeInt32, myTypeInt32) -> Int32)
    Assert.isTrue(myStructImpl.f0 is (myTypeInt32, myTypeInt32) -> myTypeInt32)
    Assert.isTrue(myStructImpl.f0 is (Int32, Int32) -> myTypeInt32)
    Assert.isTrue(myStructImpl.f0(myInt32Var, myTypeInt32Var) is myTypeInt32)
    Assert.isTrue(myStructImpl.f0(myInt32Var, myTypeInt32Var) is Int32)
    Assert.equals(15, myStructImpl.f0(myInt32Var, myTypeInt32Var))

    Assert.isTrue(myStructImpl.f1 is (Rune, Bool) -> String)
    Assert.isTrue(myStructImpl.f1 is (Rune, myTypeBool) -> String)
    Assert.isTrue(myStructImpl.f1(myCharVar, myTypeBoolVar) is String)
    Assert.equals("true c", myStructImpl.f1(myCharVar, myTypeBoolVar))

    Assert.isTrue(myEnum.H.f0 is (Int32, Int32) -> Int32)
    Assert.isTrue(myEnum.H.f0 is (myTypeInt32, myTypeInt32) -> Int32)
    Assert.isTrue(myEnum.H.f0 is (myTypeInt32, myTypeInt32) -> myTypeInt32)
    Assert.isTrue(myEnum.H.f0 is (Int32, Int32) -> myTypeInt32)
    Assert.isTrue(myEnum.H.f0(myInt32Var, myTypeInt32Var) is myTypeInt32)
    Assert.isTrue(myEnum.H.f0(myInt32Var, myTypeInt32Var) is Int32)
    Assert.equals(15, myEnum.H.f0(myInt32Var, myTypeInt32Var))

    Assert.isTrue(myEnum.H.f1 is (Rune, Bool) -> String)
    Assert.isTrue(myEnum.H.f1 is (Rune, myTypeBool) -> String)
    Assert.isTrue(myEnum.H.f1(myCharVar, myTypeBoolVar) is String)
    Assert.equals("true c", myEnum.H.f1(myCharVar, myTypeBoolVar))

}
