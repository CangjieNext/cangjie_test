/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a07_01

  @Level:         1

  @Assertion:   2.1.10(7) structs can not be inherited.

  @Description: Checks that it is not possible to inherit struct (compilation error).

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

struct Struct1 {
    public Struct1() {
    }
}

struct Struct2 <: Struct1 {
    public Struct2() {
    }
}

main() {
}

