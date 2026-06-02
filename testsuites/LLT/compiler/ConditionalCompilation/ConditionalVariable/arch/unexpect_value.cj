// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %n.cj -o %output %noColor
// ASSERT: scan builtin condition 'arch' do not support 'asd', supported listed: 'x86_64 aarch64 arm'
// ASSERT: scan builtin condition 'arch' do not support 'ARM', supported listed: 'x86_64 aarch64 arm'

@When[arch == "asd"]
func sayHi() {}

@When[arch == "ARM"]
func sayHi() {}

main(): Int64 {
    sayHi()
}

