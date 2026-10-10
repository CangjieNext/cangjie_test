// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Int64 {
    unsafe {
        unsafe {}
    }
    let f = {=> unsafe {}}
    if (true) {
        unsafe {}
    }
    match (true) {
        case true => unsafe {}
        case false => unsafe {}
    }
    0
}
