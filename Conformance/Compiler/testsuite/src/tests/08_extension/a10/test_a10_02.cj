/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a10_02

  @Level:         1

  @Assertion:   8(10) Extensions cannot add fields.

  @Description: Checks that extensions of struct cannot add fields.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

struct Foo {
    private var x: Int64 = 0
    
    init (a: Int64) {
        x = a
    }
}

extend Foo {
    var y: Int64 = 0
}

main() { }
