/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_01_a04_03

  @Level:         1
  @Assertion:    3.3.2.1(4) Immutable variables can be assigned only once for initialization.
                 If an immutable variable is assigned multiple times, a compilation error is reported.

  @Description:  Checks that String immutable variable can't be re-assigned

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

*/

main() {
    let a: String = "1_000_000"
    print("${a}")

    a = "2" // compilation error
}
