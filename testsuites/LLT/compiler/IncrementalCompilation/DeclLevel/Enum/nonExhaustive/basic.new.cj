enum A {
    B|C(Int64)|D|...
}

let a = B 
main() {
    match(a) {
        case B => 0
        case _ => 1
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
