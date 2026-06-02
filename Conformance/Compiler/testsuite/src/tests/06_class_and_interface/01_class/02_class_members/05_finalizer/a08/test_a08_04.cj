

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_05_a08_04

  @Level:         1

  @Assertion:   6.1.2.5(8) Some examples are given below:
                class SomeType0 {
                    ~init() {} // OK
                }
                class SomeType1 {
                    ~init(x: Int64) {} // Error, finalizer cannot have parameters
                }
                class SomeType2 {
                    private ~init() {} // Error, finalizer cannot have accessibility modifiers
                }
                class SomeType3 {
                    open ~init () {} // Error, finalizer cannot have open modifier
                }
                open class SomeType4 {
                    ~init () {} // Error, open class can't have a finalizer
                }

                var GlobalVar: SomeType5 = SomeType5()
                class SomeType5 {
                    ~init () {
                        GlobalVar = this // do not escape `this` out of finalizer, otherwise, unexpected behavior
                    may happen. ↪
                    }
                }

  @Description: Checks that the declaration of SomeType3 is invalid.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6593

*/

class SomeType3 {
    open ~init () {} // Error, finalizer cannot have open modifier
}

main() { }
