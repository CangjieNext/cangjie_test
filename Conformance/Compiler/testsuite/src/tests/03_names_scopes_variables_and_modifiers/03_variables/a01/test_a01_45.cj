/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a01_45

  @Level:         1

  @Assertion:    3.3(1) As a statically typed language, the Cangjie programming language requires that the type of each
                  variable must be determined during compilation.

  @Description:  Check that public class member variable declaration  w/o keywords 'let' or 'var' and with type and not
                  initialized will produce error on compilation.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

class MyClass {
    public classPublic: UInt8
}

main() {
}