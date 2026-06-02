/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a08_02

  @Level:         1

  @Assertion:   2.1.10(8) structs can implement interfaces.

  @Description: Checks that struct, implementing interface, defines function, which
                does not match function in the interface, causes compilation error.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

interface Interface {
    func f(): Int8 { 127i8 
    }
}

struct Struct <: Interface {
    public Struct() {
    }

    public func f(): Int32 { -128i32 
    }
}

main() {
}

