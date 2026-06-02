/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        03_02_03_a01_04

  @Level:         1
  @Assertion:   3.2.3(1) Based on where the names are declared or defined,
                we distinguish three types of scopes: top-level, local-level, and type-internal.
  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
*/

main() {
    var y = 5
}

var x = y
