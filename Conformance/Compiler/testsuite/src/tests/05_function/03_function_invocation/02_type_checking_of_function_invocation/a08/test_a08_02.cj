/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a08_02

  @Level:         1

  @Comment:         Assume that the function is defined as: 
                        𝑓𝑖 < 𝑇𝑖1 , ..., 𝑇𝑖𝑝 > (𝐴𝑖1 , ..., 𝐴𝑖𝑘 ) ∶ 𝑅𝑖 𝑤ℎ𝑒𝑟𝑒 𝐶𝑖1 , ..., 𝐶𝑖𝑞𝑖

  @Assertion:       5.3.2(8)  b) If `fi` is a generic function, check the type according to the following rules: 
                        i. Parameter type check: there is substitution exists so that argument type `(A1, ...,Ak)` 
                            is the subtype of the type after the parameter type  is replaced substituted. 
                                𝜎 = [𝑇1 ↦ 𝑇𝑖1 , ..., 𝑇𝑝 ↦ 𝑇𝑖𝑝]Δ ⊢ (𝐴1, ..., 𝐴𝑘) <∶ 𝜎(𝐴𝑖1 , ..., 𝐴𝑖𝑘 ) 
                        ii. Check the type of the return type: If the context of the calling expression has a specific 
                            type requirement R. Replace i) with the return type Ri of the function fi, the return type 
                            after substitution is a subtype of R. 
                                𝜎 = [𝑇1 ↦ 𝑇𝑖1 , ..., 𝑇𝑝 ↦ 𝑇𝑖𝑝]Δ ⊢ 𝜎𝑅𝑖 <∶ 𝑅 

  @Description:     Check that if generic function will be invoked with arguments types as not subtypes of parameters 
                    types - an error will be raised. 

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

type myTypeInt64 = Int64

class myClass {
    func f0<T>(a: T): T where T <: Int32 { a }
}

main() {

    var myTypeInt64Var: myTypeInt64 = 12

    var myClassImpl = myClass()
    myClassImpl.f0(myTypeInt64Var)
}
