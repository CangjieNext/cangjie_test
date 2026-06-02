/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a05_16

  @Level:         1

  @Assertion: 6.2.2.2(5)
              The default implementation, like the non-abstract member functions,
              has access to all accessible elements in the current scope

  @Description: Check that mutable instance properties without default implementation are not accessible
                in the setter of static mutable properties of the interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

interface I {
    mut prop p: Int64
    
    static mut prop q: Unit {
        get() {
            ()
        }
        set(v) {
            p
            ()
        }
    }
}

main() {
}