/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         07_02_a13_03

  @Level:         1

  @Mode:         compileonly
  @Negative:     no
  @Structure:    complex-aux

*/

package test

public class AuxTestA1303 {
  static var x: Int64 = 0
  public static prop var prop_x: Int64 {
    get() {
      x
    }
    set(v) {
      x = v
    }
  }
}
