/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a11_04

  @Level:         1

  @Assertion:   2.1.10(11) The struct types defined recursively or mutually recursively are illegal, 
                unless there is at least one struct type T_i is encapsulated within a class, 
                interface, enum or function type on each recursive chain T_1, T_2, ..., T_N.
                That is to say, a recursive (or mutually recursive) struct definition can be made 
                legal by using class, interface, enum or function types.

  @Description: Checks that the struct types cannot be defined mutually recursively without
                using proxy class, interface, enum or function types.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

struct Struct1 {
    var member: Int32;
    var member2: Struct2 = Struct2();

    public Struct1(par: Int32) {
       this.member = par;
    }
}

struct Struct2 {
    var member: Struct1;

    public Struct2() {
       this.member = Struct1(10);
    }
}

main() {
}

