/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_extend_check_sequence_cannot_decide

interface I1 {}

interface I2 <: I1 {}

interface I3 <: I2 {}

class A {}

extend A <: I2 {}

extend A <: I1 & I3 {}

main(): Int64 {
    0
}
