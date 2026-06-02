// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    if (f(namedParam7034: [A()]) == 2 && C().f(namedParam7034: [A()]) == 2) {
        return 0
    }
    return 1
}

class A {}

func f(namedParam7034!: Array<A>, optionalParam7035!: Bool = true) {
    return 2
}

class C {
    public func f(namedParam7034!: Array<A>, optionalParam7035!: Bool = true) {
        return 2
    }
}
