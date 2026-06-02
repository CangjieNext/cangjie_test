/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_05_a03_28

  @Level:         1

  @Assertion:    13.1.3.5(3)  Structs modified by @C must follow a few restrictions:
                 - their member fields’ type must conform to CType constraint

  @Description:  Rune is not allowed for field in @C struct.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:        0006348

  @Comment:      

*/
@C
struct S1 {
    var f1: Rune = 'A'
}

main() {
}
