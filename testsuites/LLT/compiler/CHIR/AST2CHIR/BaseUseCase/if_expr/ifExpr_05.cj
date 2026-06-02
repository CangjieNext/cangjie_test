// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disableReflection %f -o %output
// EXEC-3: %run %run_opt %output

public func test(): Int64 {
    if ((return 1) || false) {
        var a = 1
    } else {
        return 2
    }
    return 3
}

public func test1(): Int64 {
    if (return 1) {
        var a = 1
    } else {
        return 2
    }
    return 3
}

public func test2(): Int64 {
    if (return 1) {
        var a = 1
    } else {
        return 2
        var c = 2 // no warning
    }
    return 3
}

main(): Int64 {
    return test() + test1() + test2()
}
