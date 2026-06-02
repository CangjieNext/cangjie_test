/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a16_01

  @Level:         1

  @Assertion:    3.2.3.2(16) The scope of T in a generic type definition class C<T> {} starts from T 
                 to the end of the declaration of class C.

  @Description:  Checks that the class generic type is inaccesible after class declaration end.  

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

open class Test<T> {
    public func foo(a : T) : T {
        return a
    }
}

main() {
    let a : T
}
