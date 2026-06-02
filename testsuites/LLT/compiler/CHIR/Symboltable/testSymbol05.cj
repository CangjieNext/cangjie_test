// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj %compile_lib_opt

package pkg

public class Context<X> {
    public static func test<T>(a: T,
        b!: T = {
            =>
            func test1(c!: T = a) {
                return c
            }
            func test2(c: T): T {
                return c
            }
            test1();
            test2(a);
        }()): T {
        return b
    }
}
