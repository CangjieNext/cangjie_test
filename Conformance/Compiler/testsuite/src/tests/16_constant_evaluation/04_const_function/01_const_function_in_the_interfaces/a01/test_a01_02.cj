
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_01_a01_02

  @Level:         1

  @Assertion:   16.4.1(1) 1.const function in the interface, the implementation type must also use const function to be
                considered to implement the interface.
  @Description: Check that an interface implementation cannot use a non-const function if the corresponding instance
                member function in the interface is const.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

interface I {
    const func f(): Int64
}

class C <: I {
    public func f() { 1 }

    const init() { }
}

main() { }
