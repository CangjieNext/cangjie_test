/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import A.*

// Mangle generic function with different constraints
class I64 <: Integer<I64> {}

class F64 <: Float<F64> {}

class M128 <: Integer<M128> & Float<M128> {}

main(): Int64 {
    sum([I64()])
    sum([F64()])
    sum([M128()])
    return 0
}
