/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_02_a08_02

  @Level:         1

  @Assertion:       2.1.11.2(8) As long as there are enum constructor and functions 
  that pass the type check, they just cannot be resolved.


  @Description:     Checks that conflicting function and constructor w/ generic parameters 
  produce compilation error

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single

  @Comment:

*/

enum E2<T1,T2> {
    F
    | F1(T1)
    | F2(T1, T2)
}

func F2<T1, T2>(c:T1, i:T2) { (c,i) }

let c = F2('z', 8_i8)

main() {
}