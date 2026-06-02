
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a11_02

  @Level:         1

  @Assertion:   16.1(11)
                const a = 0 // ok

                class C {
                    const b = 0 // ok
                    static const c = 0 //ok

                    var v: Int64
                    init () {
                        const d = 0 // ok
                        v = b + c + d
                    }
                }

                extend C {
                    const e = 0 // error, const cannot be defined in extend
                }
  @Description: Checks that the extension in the example causes a compile error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

const a = 0 // ok

class C {
    const b = 0 // ok
    static const c = 0 //ok

    var v: Int64
    init () {
        const d = 0 // ok
        v = b + c + d
    }
}

extend C {
    const e = 0 // error, const cannot be defined in extend
}

main() { }
