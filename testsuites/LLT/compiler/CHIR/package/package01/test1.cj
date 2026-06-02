// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: p1
// EXEC:%compiler p1/test0.cj %compile_lib_opt -o test0.%middle
// EXEC:%compiler test0.%middle test1.cj -o %output
// EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import test0.*

public func Add(x: Tensor) {
    if (x.getHandleOrThrow().getType()) {
        x
    } else {
        x
    }
}

main() {
    Add(Tensor(1.0))
    0
}
