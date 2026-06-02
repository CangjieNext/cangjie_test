/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_05_a08_01

  @Level:         1

  @Assertion:    13.1.3.5(8)  Structs modified by @C must follow a few
                 restrictions:
                 - it cannot have generic parameters.

  @Description:  @C struct with type parameter.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

@C
struct ABC<T> {
}

main() {
}