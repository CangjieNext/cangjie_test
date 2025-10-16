var a = 1
var b = a + 1
let (c, d) = (b - a, b + a)


@Test class MyTest {
    @TestCase func f1() {
        @Expect(b == 2)
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
