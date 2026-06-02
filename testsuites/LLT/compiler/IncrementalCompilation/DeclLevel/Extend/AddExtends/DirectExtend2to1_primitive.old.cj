extend String {
    func foo() { size }
}

extend String {
    func bar() { size-1 }
}

main() {
    let a = "woowoowoo"
    a.bar() - a.foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
