
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a03_04

  @Level:         1

  @Assertion:    12.1.1(3) 1. A try block starts with the keyword try and is followed by a block consisting
                              of expressions and declarations (defined in a pair of braces) which creating
                              a new local scope and can contain any expression   and declaration).

  @Description:  Checks local scope out of the try expression.

  @Mode:         compileonly 

  @Negative:     yes

  @Structure:    single

*/
main() {
    try {
        let a = 0
    } catch (_) { 
    } finally {
    }

    print(a)
}
