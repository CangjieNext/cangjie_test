

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_05_a02_01

  @Level:         1

  @Assertion:   6.1.2.5(2)
                class C {
                    // below is a finalizer
                    ~init() {}
                }
  @Description: Checks the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

class C {
    // below is a finalizer
    ~init() {}
}

main() {
    C()
    0
}
