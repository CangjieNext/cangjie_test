/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_06_a05_01

  @Level:         1

  @Assertion:       5.1.6(5) Two generic functions constitute redefinitions if the following holds: there exists a 
                    renaming such that after we rename one function’s generic type parameters, the two functions’ 
                    non-generic parts constitute redefinitions.  

  @Description:     Check that generic functions of the same name with the same parameter, that differ only in names, 
                    are considered to be redefined: interface member functions.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

interface myInterface {
    static func myFunc<A>(a: A, b!: A): A
    static func myFunc<B>(a: B, b!: B): B
}

main() {
}
