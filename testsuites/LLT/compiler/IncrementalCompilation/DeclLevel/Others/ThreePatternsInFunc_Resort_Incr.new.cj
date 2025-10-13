var ctv: Int64 = 0
func ctr(): Int64 {
    ctv++
    return ctv
}

func f(){
    let (c, d):(Int64, Int64) = (ctr(), ctr())  // c = 1, d = 2
    let (a, b):(Int64, Int64) = (ctr(), ctr())  // a = 3, b = 4
    return a + c * 2  // 5
}
main(): Int64 {
    return f()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
