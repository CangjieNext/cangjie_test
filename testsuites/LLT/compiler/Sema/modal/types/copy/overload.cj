// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f -o %output
func foo(a: CFunc<()->Int>) {
    unsafe { println(a().toString()) }
}
func foo(a: CFunc<()->Int> @local!) {
    unsafe { println(a().toString()) }
}

@C foreign func rand(): Int
main() {
    foo(rand)
}