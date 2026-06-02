// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

    func x() : A { // c
            /*11*/while (true) {
                x; // 2
                ""; // 1
            /*12*/}
        };

/*14*/class A {
    func b() {}
    func c() {}
    func g() {}
}