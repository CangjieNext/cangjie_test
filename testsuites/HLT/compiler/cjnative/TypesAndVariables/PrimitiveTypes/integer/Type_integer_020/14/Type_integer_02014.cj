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
    let int32_let_A: Int32 = -2_1__4___7____4_____8______3_______6________4_________8
    let int32_let_B: Int32 = 2__________1_________4________7_______4______8_____3____6___4__7_

    if (int32_let_A != -2147483648) {
        return 1
    }

    if (int32_let_B != 2147483647) {
        return 1
    }

    return 0
}
