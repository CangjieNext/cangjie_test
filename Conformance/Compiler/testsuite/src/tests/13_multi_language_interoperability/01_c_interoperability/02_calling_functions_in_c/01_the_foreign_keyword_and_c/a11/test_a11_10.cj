/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a11_10

  @Level:         1

  @Assertion:    13.1.2.1(11) The foreign block can only contain function
                 declarations.

  @Description:  Macro definition inside foreign block.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

macro package test_a11_10

foreign {
    public macro PlusOne(input: Tokens): Tokens {
        quote(($input + 1))
    }
}

main() {
}