class A{
    var  a :Int64 = 2
}

struct B {
    var b: Int64 = 1
    init() {}
}

main() {
    return A().a + B().b
}

// ASSERT: scan incremental compilation triggered
// ASSERT: scan the changed decl after Spreading is:b in file ChangeInitAndChangeBack_Incr.old.cj in line 6 in column 9
// ASSERT: scan the changed decl after Spreading is:a in file ChangeInitAndChangeBack_Incr.old.cj in line 2 in column 10


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
