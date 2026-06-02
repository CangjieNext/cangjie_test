let (a, b, c) : (Int64, (Int64, Float64), Int64) = (3, (-7, 2.0), 4)
main(): Int64 {
    return a - c * 2 - b[0] - Int64(b[1])
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
