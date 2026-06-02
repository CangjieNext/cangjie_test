/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a05_02

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

  @Description:     Check that if arguments types doesn't meet the function definition - an error will be raised.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

type myType = (Int32, Bool)

class myClass {
    func f0<X>(a: X): X where X <: ToString {a}
}

main(): Unit {
    var myVar = (1, false)
    var myClassImpl = myClass()
    myClassImpl.f0<myType>(myVar)
}
