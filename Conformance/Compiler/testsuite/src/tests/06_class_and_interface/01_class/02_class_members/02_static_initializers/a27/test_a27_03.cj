/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a27_03

  @Level:         1

  @Assertion:   6.1.2.2(27) •Static properties still should be declared in a full way, including getter and setter;
  @Description: Checks that static immutable property cannot be assigned in the class static initializer.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6124

*/

class C {
    static prop p : Int64

    static init() {
        p = {
            get() {
                1
            }
        }
    }
}

main() { }
