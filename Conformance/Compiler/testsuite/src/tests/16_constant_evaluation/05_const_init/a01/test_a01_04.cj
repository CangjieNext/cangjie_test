
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_05_a01_04

  @Level:         1

  @Assertion:   16.5(1) 1.If the current type is class, it cannot have instance member variables declared by var,
                otherwise it is not allowed to define const init. If the current type has a parent class, the current
                const init must call the const init of the parent class (either explicitly or implicitly without a
                const init), or error if the parent class does not have a const init.
  @Description: Check that a class with `var` instance member variables cannot have const init.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/
    
class G<T> {
    var v = 0

    const init() { }
}

main() { }
