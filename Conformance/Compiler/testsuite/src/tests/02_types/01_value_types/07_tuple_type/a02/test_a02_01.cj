/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_a02_01

  @Level:         1
   @Assertion:   2.1.7(2) The Tuple type has the syntax as (Type1, Type2, ..., TypeN),
                 where N is the dimension of the tuple, and it is explained as follows:
   @Description: Check Tuple type syntax
   @Mode:        run
   @Negative:    no
   @Structure:   single
 */

import utils.assert.Assert

main() {
    var t1: (Int64, String, Float16) = (123, "qwe", 2.3)
    Assert.isTrue(t1 is (Int64, String, Float16))
    return 0
}
