// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output -Woff all

func foo(a: Int @local!) {
    exclave {
        3
    }
    8
}

class T {
    func bar(a: Int): Int @local! {
        if (a < 0) {
            return exclave {
                a
            }
        }
        exclave {
            a + 1
        }
    }
}
main() {}