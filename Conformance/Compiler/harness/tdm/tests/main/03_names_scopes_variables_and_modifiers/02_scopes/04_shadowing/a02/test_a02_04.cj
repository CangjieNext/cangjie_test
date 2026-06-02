/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a02_04

  @Assertion:    3.2.4(2) Note that shadowing ends when the lower-scope ends.

  @Description:  Demo for compilation error

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/

let idLet = "global_var"

struct Type {
    static let idFunc: Int32 = 100

    let idLet: Bool
}

main() {
    //no-op
}