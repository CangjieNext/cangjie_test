
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_05_a01_06

  @Level:         1

  @Assertion:   16.5(1) 1.If the current type is class, it cannot have instance member variables declared by var,
                otherwise it is not allowed to define const init. If the current type has a parent class, the current
                const init must call the const init of the parent class (either explicitly or implicitly without a
                const init), or error if the parent class does not have a const init.
  @Description: Check that if a parent class has both const and non-const init, the const init of the child class
                cannot explicitly call the non-const one.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/
    
open class A {
    const init() { }

    init(x: Int64) { }
}

class B <: A {
    const init() {
        super(1)
    }
}

main() { }
