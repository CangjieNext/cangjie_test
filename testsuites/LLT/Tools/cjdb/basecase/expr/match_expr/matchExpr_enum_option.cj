// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    let v1 = Option<Int64>.Some(100)
    let v2 = Option<UInt64>.Some(100)
    let v3 = Option<Float64>.Some(1.2)
    let v7 = Option<Int64>.None
    let r1 = match (v1) {
        case Some(v) => v 
        case None => 0
    }
    let r2 = match (v2) {
        case Some(v) => v 
        case None => UInt64(0)
    }
    let r3 = match (v3) {
        case Some(v) => v 
        case None => 1.1
    }
    let r7 = match (v7) {
        case Some(v) => v  
        case None => 2
    }
    0
}