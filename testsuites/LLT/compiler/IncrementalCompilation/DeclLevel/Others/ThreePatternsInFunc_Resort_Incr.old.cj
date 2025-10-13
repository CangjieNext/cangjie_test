var ctv: Int64 = 0
func ctr(): Int64 {
    ctv++
    return ctv
}

func f(){
    let (a, b):(Int64, Int64) = (ctr(), ctr())   // a = 1, b = 2
    let (c, d):(Int64, Int64) = (ctr(), ctr())   // c = 3, d = 4
    return a + c * 2
}
main(): Int64 {
    return f()  // 7
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
