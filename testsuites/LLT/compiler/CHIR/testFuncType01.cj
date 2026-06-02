// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj %compile_lib_opt
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A<T> {
    public operator func !(): Bool {
        true
    }
}

main(): Int64 {
    var a: A<(Int32) -> Int32> = A<(Int32) -> Int32>()
    var c = !(a)
    return 0
}
