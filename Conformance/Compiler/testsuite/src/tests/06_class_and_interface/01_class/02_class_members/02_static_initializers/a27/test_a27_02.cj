/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a27_02

  @Level:         1

  @Assertion:   6.1.2.2(27) •Static properties still should be declared in a full way, including getter and setter;
  @Description: Checks that static property setter cannot be added in the static initializer.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6124

*/

class C {
    static mut prop p : Int64 {
        get {
            1
        }
    }

    static init() {
        p.set = { x : Int64 => }
    }
}

main() { }
