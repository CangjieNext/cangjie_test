/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var lit01 = -0b1000000000_00000000000_0000000000000_00000000000000000000000000_0000_
    var lit02 = 0B111_______________________11_________________________________________________________________________________________________111111_____________________11111111____________________111111______________________________111111111111__________________________________________1111111111_______________________________111111111________1111111_
    let lit03 = -0o1000000__000000____000000000_
    let lit04 = 0O7_7777_7777_7777_7777_7777
    let lit05 = -2_4_
    var lit06 = -0x8000_0000_0000_0000_
    var lit07 = 0X7f__________________________ff_____________________________________ff________fffffff_______________fff
    var lit08 = -9223_37_2_0368_5477_5808
    var lit09 = 9_2_2_3_3_7_2_0_3_6_8_5_4_7_7_5_8_0_7

    if (lit01 != -9223_37_2_0368_5477_5808) {
        return 1
    }
    if (lit02 != 9223372036854775807) {
        return 1
    }
    if (lit03 != -9223_37_2_0368_5477_5808) {
        return 1
    }
    if (lit04 != 9223372036854775807) {
        return 1
    }
    if (lit05 != -2_4) {
        return 1
    }
    if (lit06 != -9223_37_2_0368_5477_5808) {
        return 1
    }
    if (lit07 != 9_2_2_3_3_7_2_0_3_6_8_5_4_7_7_5_8_0_7) {
        return 1
    }
    return 0
}
