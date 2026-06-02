/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I1 {}

interface I2 {}

open class C1 <: I1 & I2 {}

class C2 <: C1 {}

class C3 <: I1 & I2 {}

main() {
    var a = [C1(), C2(), C3()]
    return 0
}
// ASSERT: scan sema_inconsistency_elemType
