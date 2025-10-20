// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

let MAX = "string max"
let MIN = "str min"
main(): Int64 {
    var a = "string max"
    if (MAX == a ) {
        return 0
    } else if (a < MAX){
        return -1
    } else {
        return 1
    }
}