// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public var t0: Int32 = 0
}

class TestWithRef {
    public var t0: Test = Test()
}

struct RcdWithRef {
    public var t: Test = Test()
}

struct RcdWithoutRef {
    public var t: Int32 = 1
}

main(): Int64 {
    var a1 = Test()
    var a2 = TestWithRef()
    var a5: Array<Int64> = [1, 2]

    var array2 = [[1, 2], [3, 4]]
    var array3 = [Test()]
    var array4 = [RcdWithRef()]
    var array5 = [RcdWithoutRef()]
    if (a5[1] == 2) {
        return 0
    }
    return 1
}
