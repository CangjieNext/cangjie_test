/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_01_a02_01

  @Level:         1
   @Assertion:   2.1.7.1(2) Some examples of Tuple literals:
                  (3.14, "PIE")
                  (2.4, 3.5)
                  (2, 3, 4)
                  ((2, 3), 4)
   @Description: Check example.
   @Mode:        run
   @Negative:    no
   @Structure:   single
 */

import utils.assert.Assert

main() {
    Assert.isTrue((3.14, "PIE") is (Float64, String))
    Assert.isTrue((2.4, 3.5) is (Float64, Float64))
    Assert.isTrue((2, 3, 4) is (Int64, Int64, Int64))
    Assert.isTrue(((2, 3), 4) is ((Int64, Int64), Int64))

    return 0
}
