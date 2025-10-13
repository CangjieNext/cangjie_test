// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo1(a!: String = "123") {
    return 1
}

func foo2(a!: String = unsafe {"123"}) {
    return 2
}

main() {
    foo1()
    foo2()
}
