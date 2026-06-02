/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_03_a01_02

  @Level:         1

  @Assertion:       8.3(1) If the type being extended is a generic type, the type variables at the type being extended 
                    does not need to have the same name as the type variables at the original type definition.

  @Description:     Check that type extensions must use generic type parameters to match the type declaration.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class MyClass<T> where T <: ToString {
}

extend MyClass {
    func myFunc(): Int32 { 12 }
}

main() { 
} 
