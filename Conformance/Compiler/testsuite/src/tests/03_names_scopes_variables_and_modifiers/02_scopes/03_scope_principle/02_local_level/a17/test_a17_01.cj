/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a17_01

  @Level:         1

  @Assertion:    3.2.3.2(17) The scope of T in the extension extend C<T> {} is from the occurrence of T 
                 to the end of extension definition.

  @Description:  Checks that the generic type for class extension is accesible before the end of extension definition.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

open class Test<T> {}

extend Test<T> {
    func foo<T>(a : T) : T {
        let b : T = a
        return b
    }
}

main() {
    let a : T
}
