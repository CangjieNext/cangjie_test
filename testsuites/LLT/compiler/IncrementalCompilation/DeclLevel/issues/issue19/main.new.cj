class A<T> {
    public static const a: Int64 = 3
}

func foo(): Int64 { A<Int64>.a  }

main() {
    A<Int32>.a - foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
