/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_05_a03_38

  @Level:         1

  @Assertion:    13.1.3.5(3)  Structs modified by @C must follow a few restrictions:
                 - their member fields’ type must conform to CType constraint

  @Description:  Interface is not allowed for field in @C struct.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

interface I0 {}

class ABC <: I0 {}

@C
struct S1 {
    var f1: I0 = ABC()
}

main() {
}
