var ctv: Int64 = 0
func ctr(): Int64 {
    ctv++
    return ctv
}
let c: Int64 = ctr()
let b: Int64 = ctr()
let a: Int64 = ctr()
main(): Int64 {
    return a + b * 2 + c * 3
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
