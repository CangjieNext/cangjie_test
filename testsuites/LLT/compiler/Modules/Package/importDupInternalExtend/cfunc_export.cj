// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-0: %compiler %cmp_opt %n.cj --output-type=staticlib

func foo(): Unit {}

foreign func goo(): Unit

func f1(): Option<() -> Unit> {
    return foo
}

func f2(): Option<CFunc<() -> Unit>> {
    return goo
}
