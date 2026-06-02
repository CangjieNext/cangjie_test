// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj -o %output
// EXEC: %run %output
// ASSERT: scan hello world
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

main() {
    var arr = [1, 2, 3]
    var c: Collection<Int64> = arr

    match (c) {
        case arr2: Array<Int64> =>
            arr2.clone();
            print("hello world");
            ()
        case _ => ()
    }
}
