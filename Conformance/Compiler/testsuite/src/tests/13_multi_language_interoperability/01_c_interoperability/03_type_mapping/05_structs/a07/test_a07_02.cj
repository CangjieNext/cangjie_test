/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_05_a07_02

  @Level:         1

  @Assertion:    13.1.3.5(7)  Structs modified by @C must follow a few
                 restrictions:
                 - it cannot be captured by lambdas.

  @Description:  Check using immutable @C struct in lambda.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

@C
struct ABC {
    var x: Int32
    init() { x = 0 }
}

func func_01(x: Int32, y: Int32) {
    let z: ABC = ABC(x);
    var lam: ()->ABC = { =>z }
}

main() {
}