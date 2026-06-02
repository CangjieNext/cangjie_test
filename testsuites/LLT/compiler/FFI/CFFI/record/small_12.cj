// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %frontendCompiler %cmp_opt %n.cj

@C
struct SomeThing {
    SomeThing(
        let a: Int64,
        let b: Int64
    ) {}
}

foreign func doSomeThing(some: SomeThing): Unit
foreign func getSomeThing(): SomeThing

func doSomeElse() {
    unsafe {
        let some = getSomeThing()
        doSomeThing(some)
    }
}

main() {
    doSomeElse()
}
