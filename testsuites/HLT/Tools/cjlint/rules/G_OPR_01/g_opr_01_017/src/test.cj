/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

extend Int64 {
    operator func +(right: Float64): Float64 {
        return Float64(this) + right
    }
}

main() {
    println(1 + 2.0)
}
