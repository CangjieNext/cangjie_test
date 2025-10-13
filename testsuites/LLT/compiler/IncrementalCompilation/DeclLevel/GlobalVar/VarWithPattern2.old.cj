var (a, (b, c)) = (1, (2, 3))

func useA(): Int64 { a }
func useB(): Int64 { b }
func useC(): Int64 { c }

main() {
    useA() + useB() + useC()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
