// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// comment
@a.b.c.c.d.Y[123]
// comment
class A {
    // comment
    func g() { /*comment*/}
    let y = @a.b.c.c.d.Y[123]("asd") + 
        10
    let z = @a.b.c.c.d.Y[123]("asd")
    @a.b.c.c.d.Y[123]
    func test(){ // comment
        @a.b.c.d.Y[123](0)
    } // comment
} // comment
