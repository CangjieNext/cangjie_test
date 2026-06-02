// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix

func myfunc(_: () -> Unit) {}

public open class RgfCore {
    func initialize() {
        let _: CFunc<() -> Unit> = {
            => myfunc({=>})
        }
    }
}

main() {}
