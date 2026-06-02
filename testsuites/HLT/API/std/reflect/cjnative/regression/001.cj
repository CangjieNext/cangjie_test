/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// interface 类型，包括Any拥有的bug，runtime bug

interface I {}

class CC <: I {}

main() {
    let i: I = CC()
    TypeInfo.of(i) |> println
}
