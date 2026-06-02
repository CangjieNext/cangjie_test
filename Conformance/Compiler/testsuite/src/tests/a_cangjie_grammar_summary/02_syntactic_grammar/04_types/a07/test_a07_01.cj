/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a07_01

  @Level:         1
  @Assertion:   A.2.4(7)
                numericTypes
                    : INT8
                    | INT16
                    | INT32
                    | INT64
                    | INTNATIVE
                    | UINT8
                    | UINT16
                    | UINT32
                    | UINT64
                    | UINTNATIVE
                    | FLOAT16
                    | FLOAT32
                    | FLOAT64
                    ;
  @Description: Check various numeric types as variable type
  @Comment:     Auto-generated tests by gen_types_tests_a07.py with seed = 1
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
import utils.assert.Assert

main() {

    var `redef`: Int8 = 0i8
    Assert.equals(0i8, `redef`)

    var get: Int16 = 6116i16
    Assert.equals(6116i16, get)

    var C3_ubP_: Int32 = 987661162i32
    Assert.equals(987661162i32, C3_ubP_)

    var `b_W7_wR`: Int64 = 0xFA4CE8702A39DCi64
    Assert.equals(0xFA4CE8702A39DCi64, `b_W7_wR`)

    var J_l__1_8: IntNative = 0b11_111
    Assert.equals(0b11_111, J_l__1_8)

    var `F_9E`: UInt8 = 0b11111111_u8
    Assert.equals(0b11111111_u8, `F_9E`)

    var J___18X: UInt16 = 0b1011111100100_u16
    Assert.equals(0b1011111100100_u16, J___18X)

    var `b09__2G`: UInt32 = 0b101111000110000110100100100_u32
    Assert.equals(0b101111000110000110100100100_u32, `b09__2G`)

    var G: UInt64 = 0O3722316416012434734u64
    Assert.equals(0O3722316416012434734u64, G)

    var `J__y__`: UIntNative = 0b11111111
    Assert.equals(0b11111111, `J__y__`)

    var x__G: Float16 = 6.5504e4f16
    Assert.equals(6.5504e4f16, x__G)

    var `a____7_Z`: Float32 = 3.402_8234664e38
    Assert.equals(3.402_8234664e38, `a____7_Z`)

    var Z0_: Float64 = 0x12a.1p2
    Assert.equals(0x12a.1p2, Z0_)

    return 0
}
