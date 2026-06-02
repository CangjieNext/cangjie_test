/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a06_03

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

  @Description:     Check that if non-generic function with specific return value type will be invoked with other type 
                    in context - an error will be raised. 

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

type myTypeInt64 = Int64

class myClass {
    func f0(a: Int32, b: Int32): Int32 { a + b}
}

main() {

    var myTypeInt64Var: myTypeInt64
    var myInt32Var: Int32 = 12

    var myClassImpl = myClass()
    myTypeInt64Var = myClassImpl.f0(myInt32Var, myInt32Var)
}
