/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a06_03

  @Level:         1

  @Assertion:    13.1.2.1(6)  Under @C modifier, the foreign keyword only allows
                 modify non-generic functions in the top-level scope.

  @Description:  @C + foreign + struct type.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

@C foreign
struct ABC {
    var x : Int32
    var y : Int32
    init(x : Int32, y : Int32) {
        this.x = x
        this.y = y
    }
}

main() {
    var i : ABC = ABC(0, 0);
}
