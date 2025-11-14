// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    let v4 = Option<Bool>.Some(false)
    let v5 = Option<Rune>.Some(r'a')
    let v6 = Option<Unit>.Some(())
    let r4 = match (v4) {
        case Some(v) => v 
        case None => true
    }
    let r5 = match (v5) {
        case Some(v) => v 
        case None => r'b'
    }
    let r6 = match (v6) {
        case Some(v) => v  
        case None => ()
    }
    0
}