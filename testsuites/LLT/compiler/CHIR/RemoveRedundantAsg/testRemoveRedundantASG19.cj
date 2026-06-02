// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %enableRedundantAssignRemoval %n.cj
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func decrementRecursive(x: Int64): Int64 {
    if (x == 0) {
        return x;
    }
    decrementRecursive2(x - 1);
}

func decrementRecursive2(x: Int64): Int64 {
    if (x == 0) {
        return x;
    }
    decrementRecursive(x - 1);
}

main() {
    var x = 5;
    x = decrementRecursive(x)
    print(x.toString());
    x = 7
    x = decrementRecursive(x)
    print(x.toString());
    return 0;
}
