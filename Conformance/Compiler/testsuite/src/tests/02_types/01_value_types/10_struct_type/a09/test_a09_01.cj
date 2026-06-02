/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a09_01

  @Level:         1

  @Assertion:   2.1.10(9) A struct type is said to be recursive, if at least one of its non-static member 
                variable’s type contains the struct type itself.

  @Description: Checks that when non-static member variable of struct can have type, containing 
                reference to this struct itself using proxy class type, no compilation error.

  @Comment:   2.1.10(11) The struct types defined recursively or mutually recursively are illegal, 
                unless there is at least one struct type T_i is encapsulated within a class, 
                interface, enum or function type on each recursive chain T_1, T_2, ..., T_N.
                That is to say, a recursive (or mutually recursive) struct definition can be made 
                legal by using class, interface, enum or function types.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

class Class<T> {
    var classMember: T;

    public Class(par: T) {
        this.classMember = par;
    }
}

struct Struct {
    var structMember: Class<Struct> = Class(Struct());
}

main() {
}

