/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a02_02

  @Level:         1

  @Assertion:       5.3.2(2) 1 If type arguments are specified in the function call expression, only functions whose 
                    type parameters quantity is the same as specified type arguments may pass the type checking. For 
                    example, assuming that function call expression is f<T1, ..., Tm>(A1, ..., An), and m type 
                    arguments are specified, the function who pass the type checking must have m type parameters.

  @Description:     Check that if compiler can't recognize requred function by name and set of arguments - will be 
                    raised an error.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class myClass {
    func myFunc1(a!: Int32, b!: Int64) {"myClass.myFunc1(a!: Int32, b!: Int64)"}
    func myFunc1(a!: Int64, b!: Int32) {"myClass.myFunc1(a!: Int64, b!: Int32)"}
}

main() {
    var myClassImpl = myClass()
    myClassImpl.myFunc1(a: 32, b: 64)
}
