/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_03_a02_01

  @Level:         1
  @Assertion:       2.1.1.3(2) The operations for floating point may be performed with different accuracy from their
                    types.

  @Description:     Check that operators +, -, *, /, +=, -=, *=, /= may vary in accuracy.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    let addDoublePrecision = 0.000000000000000000001    + 0.123456789012345678901
    let addSinglePrecision = 0.000000000000000000001f32 + 0.123456789012345678901
    Assert.approxEquals(addDoublePrecision, Float64(addSinglePrecision))
    Assert.notEquals(0.0, addDoublePrecision - Float64(addSinglePrecision))
    let addDoublePrecision1 = 0.00001    + 0.12345
    let addHalfPrecision1 = 0.00001f16 + 0.12345
    Assert.approxEquals(addDoublePrecision1, Float64(addHalfPrecision1), 0.001)
    Assert.notEquals(0.0, addDoublePrecision1 - Float64(addHalfPrecision1))
    let addSinglePrecision2 = 0.00001f32 + 0.12345
    let addHalfPrecision2 = 0.00001f16 + 0.12345
    Assert.approxEquals(addSinglePrecision2, Float32(addHalfPrecision2))
    Assert.notEquals(0.0, addSinglePrecision2 - Float32(addHalfPrecision2))

    let subDoublePrecision = 0.000000000000000000001    - 0.123456789012345678901
    let subSinglePrecision = 0.000000000000000000001f32 - 0.123456789012345678901
    Assert.approxEquals(subDoublePrecision, Float64(subSinglePrecision))
    Assert.notEquals(0.0, subDoublePrecision - Float64(subSinglePrecision))
    let subDoublePrecision1 = 0.00001    - 0.12345
    let subHalfPrecision1 = 0.00001f16 - 0.12345
    Assert.approxEquals(subDoublePrecision1, Float64(subHalfPrecision1), 0.001)
    Assert.notEquals(0.0, subDoublePrecision1 - Float64(subHalfPrecision1))
    let subSinglePrecision2 = 0.00001f32 - 0.12345
    let subHalfPrecision2 = 0.00001f16 - 0.12345
    Assert.approxEquals(subSinglePrecision2, Float32(subHalfPrecision2))
    Assert.notEquals(0.0, subSinglePrecision2 - Float32(subHalfPrecision2))

    let mulDoublePrecision = 0.01    * 0.123456789012345678901
    let mulSinglePrecision = 0.01f32 * 0.123456789012345678901
    Assert.approxEquals(mulDoublePrecision, Float64(mulSinglePrecision))
    Assert.notEquals(0.0, mulDoublePrecision - Float64(mulSinglePrecision))
    let mulDoublePrecision1 = 0.01    * 0.12345
    let mulHalfPrecision1 = 0.01f16 * 0.12345
    Assert.approxEquals(mulDoublePrecision1, Float64(mulHalfPrecision1), 0.001)
    Assert.notEquals(0.0, mulDoublePrecision1 - Float64(mulHalfPrecision1))
    let mulSinglePrecision2 = 0.01f32 * 0.12345
    let mulHalfPrecision2 = 0.01f16 * 0.12345
    Assert.approxEquals(mulSinglePrecision2, Float32(mulHalfPrecision2))
    Assert.notEquals(0.0, mulSinglePrecision2 - Float32(mulHalfPrecision2))

    let divDoublePrecision = 0.01    / 0.123456789012345678901
    let divSinglePrecision = 0.01f32 / 0.123456789012345678901
    Assert.approxEquals(divDoublePrecision, Float64(divSinglePrecision))
    Assert.notEquals(0.0, divDoublePrecision - Float64(divSinglePrecision))
    let divDoublePrecision1 = 0.01    / 0.12345
    let divHalfPrecision1 = 0.01f16 / 0.12345
    Assert.approxEquals(divDoublePrecision1, Float64(divHalfPrecision1), 0.001)
    Assert.notEquals(0.0, divDoublePrecision1 - Float64(divHalfPrecision1))
    let divSinglePrecision2 = 0.01f32 / 0.12345
    let divHalfPrecision2 = 0.01f16 / 0.12345
    Assert.approxEquals(divSinglePrecision2, Float32(divHalfPrecision2))
    Assert.notEquals(0.0, divSinglePrecision2 - Float32(divHalfPrecision2))

    var addAssignmentDoublePrecision = 0.000000000000000000001
    addAssignmentDoublePrecision += 0.123456789012345678901
    var addAssignmentSinglePrecision = 0.000000000000000000001f32
    addAssignmentSinglePrecision += 0.123456789012345678901
    Assert.approxEquals(addAssignmentDoublePrecision, Float64(addAssignmentSinglePrecision))
    Assert.notEquals(0.0, addAssignmentDoublePrecision - Float64(addAssignmentSinglePrecision))
    var addAssignmentDoublePrecision1 = 0.00001
    addAssignmentDoublePrecision1 += 0.12345
    var addAssignmentHalfPrecision1 = 0.00001f16
    addAssignmentHalfPrecision1 += 0.12345
    Assert.approxEquals(addAssignmentDoublePrecision1, Float64(addAssignmentHalfPrecision1), 0.001)
    Assert.notEquals(0.0, addAssignmentDoublePrecision1 - Float64(addAssignmentHalfPrecision1))
    var addAssignmentSinglePrecision2 = 0.00001f32
    addAssignmentSinglePrecision2 += 0.12345
    var addAssignmentHalfPrecision2 = 0.00001f16
    addAssignmentHalfPrecision2 += 0.12345
    Assert.approxEquals(addAssignmentSinglePrecision2, Float32(addAssignmentHalfPrecision2))
    Assert.notEquals(0.0, addAssignmentSinglePrecision2 - Float32(addAssignmentHalfPrecision2))

    var subAssignmentDoublePrecision = 0.000000000000000000001
    subAssignmentDoublePrecision -= 0.123456789012345678901
    var subAssignmentSinglePrecision = 0.000000000000000000001f32
    subAssignmentSinglePrecision -= 0.123456789012345678901
    Assert.approxEquals(subAssignmentDoublePrecision, Float64(subAssignmentSinglePrecision))
    Assert.notEquals(0.0, subAssignmentDoublePrecision - Float64(subAssignmentSinglePrecision))
    var subAssignmentDoublePrecision1 = 0.00001
    subAssignmentDoublePrecision1 -= 0.12345
    var subAssignmentHalfPrecision1 = 0.00001f16
    subAssignmentHalfPrecision1 -= 0.12345
    Assert.approxEquals(subAssignmentDoublePrecision1, Float64(subAssignmentHalfPrecision1), 0.001)
    Assert.notEquals(0.0, subAssignmentDoublePrecision1 - Float64(subAssignmentHalfPrecision1))
    var subAssignmentSinglePrecision2 = 0.00001f32
    subAssignmentSinglePrecision2 -= 0.12345
    var subAssignmentHalfPrecision2 = 0.00001f16
    subAssignmentHalfPrecision2 -= 0.12345
    Assert.approxEquals(subAssignmentSinglePrecision2, Float32(subAssignmentHalfPrecision2))
    Assert.notEquals(0.0, subAssignmentSinglePrecision2 - Float32(subAssignmentHalfPrecision2))

    var mulAssignmentDoublePrecision = 0.01
    mulAssignmentDoublePrecision *= 0.123456789012345678901
    var mulAssignmentSinglePrecision = 0.01f32
    mulAssignmentSinglePrecision *= 0.123456789012345678901
    Assert.approxEquals(mulAssignmentDoublePrecision, Float64(mulAssignmentSinglePrecision))
    Assert.notEquals(0.0, mulAssignmentDoublePrecision - Float64(mulAssignmentSinglePrecision))
    var mulAssignmentDoublePrecision1 = 0.01
    mulAssignmentDoublePrecision1 *= 0.12345
    var mulAssignmentHalfPrecision1 = 0.01f16
    mulAssignmentHalfPrecision1 *= 0.12345
    Assert.approxEquals(mulAssignmentDoublePrecision1, Float64(mulAssignmentHalfPrecision1), 0.001)
    Assert.notEquals(0.0, mulAssignmentDoublePrecision1 - Float64(mulAssignmentHalfPrecision1))
    var mulAssignmentSinglePrecision2 = 0.01f32
    mulAssignmentSinglePrecision2 *= 0.12345
    var mulAssignmentHalfPrecision2 = 0.01f16
    mulAssignmentHalfPrecision2 *= 0.12345
    Assert.approxEquals(mulAssignmentSinglePrecision2, Float32(mulAssignmentHalfPrecision2))
    Assert.notEquals(0.0, mulAssignmentSinglePrecision2 - Float32(mulAssignmentHalfPrecision2))

    var divAssignmentDoublePrecision = 0.01
    divAssignmentDoublePrecision /= 0.123456789012345678901
    var divAssignmentSinglePrecision = 0.01f32
    divAssignmentSinglePrecision /= 0.123456789012345678901
    Assert.approxEquals(divAssignmentDoublePrecision, Float64(divAssignmentSinglePrecision))
    Assert.notEquals(0.0, divAssignmentDoublePrecision - Float64(divAssignmentSinglePrecision))
    var divAssignmentDoublePrecision1 = 0.01
    divAssignmentDoublePrecision1 /= 0.12345
    var divAssignmentHalfPrecision1 = 0.01f16
    divAssignmentHalfPrecision1 /= 0.12345
    Assert.approxEquals(divAssignmentDoublePrecision1, Float64(divAssignmentHalfPrecision1), 0.001)
    Assert.notEquals(0.0, divAssignmentDoublePrecision1 - Float64(divAssignmentHalfPrecision1))
    var divAssignmentSinglePrecision2 = 0.01f32
    divAssignmentSinglePrecision2 /= 0.12345
    var divAssignmentHalfPrecision2 = 0.01f16
    divAssignmentHalfPrecision2 /= 0.12345
    Assert.approxEquals(divAssignmentSinglePrecision2, Float32(divAssignmentHalfPrecision2))
    Assert.notEquals(0.0, divAssignmentSinglePrecision2 - Float32(divAssignmentHalfPrecision2))
}
