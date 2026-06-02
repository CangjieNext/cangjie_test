/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_04_a02_01

  @Level:         1
   @Assertion:   2.1.7.4(2) 
                  let tuplePIE = (3.14, "PIE") // The type of tuplePIE is inferred to be (Float64, String).
                  var pointOne = (2.4, 3.5) // The type of pointOne is inferred to be (Float64, Float64).
                  var pointTwo = (2, 3, 4) // The type of pointTwo is inferred to be (Int64, Int64, Int64).
                  var pointThree = ((2, 3), 4) // The type of pointThree is inferred to be ((Int64, Int64), Int64).
   @Description: Check example.
   @Mode:        run
   @Negative:    no
   @Structure:   single
 */

import utils.assert.Assert

main() {
    let tuplePIE = (3.14, "PIE") // The type of tuplePIE is inferred to be (Float64, String).
    var pointOne = (2.4, 3.5) // The type of pointOne is inferred to be (Float64, Float64).
    var pointTwo = (2, 3, 4) // The type of pointTwo is inferred to be (Int64, Int64, Int64).
    var pointThree = ((2, 3), 4) // The type of pointThree is inferred to be ((Int64, Int64), Int64).

    Assert.isTrue(tuplePIE is (Float64, String))
    Assert.isTrue(pointOne is (Float64, Float64))
    Assert.isTrue(pointTwo is (Int64, Int64, Int64))
    Assert.isTrue(pointThree is ((Int64, Int64), Int64))

    return 0
}
