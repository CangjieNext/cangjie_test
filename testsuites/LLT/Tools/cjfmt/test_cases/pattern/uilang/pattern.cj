// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Int64 {
    let x = Some(true)
    match (x) {
        case Some(true) | Some(false) => 0 // Ok
        case _ => 1
    }

    let y = (true, true)
        match (y) {
            case (true, true) | (false, false) => 0
            case (true, false) | (false, true) => 1
        }
}