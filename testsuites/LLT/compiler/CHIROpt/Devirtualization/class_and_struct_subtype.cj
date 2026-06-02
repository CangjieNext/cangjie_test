// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %output %run_args

interface mySize {
    func getMySize(): Int64
}

class CA<T> <: mySize {
    public func getMySize(): Int64 {
        return 8
    }
}

struct CB<T> <: mySize {
    public func getMySize(): Int64 {
        return 10
    }
}

func doTest(args: CB<Any>) {
    if (let Some(list) <- (args as mySize)) {
        return list.getMySize()
    }
    return 0;
}

func doTest2(args: CA<Any>) {
    if (let Some(list) <- (args as mySize)) {
        return list.getMySize()
    }
    return 0;
}

main() {
    // no devirtualization happens
    if (doTest(CB<Any>()) != 10 || doTest2(CA<Any>()) != 8 ) {
        return 1
    }
    return 0
}