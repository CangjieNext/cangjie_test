// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test(): Unit {
    match (Some(1)) {
        case Some(_) => 2
        case None => ()
    }
}

main(): Unit {
    test()
}
