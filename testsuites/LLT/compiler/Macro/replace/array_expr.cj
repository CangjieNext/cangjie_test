// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_parallel %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

func array_access(): Int64 {
    // test ArrayLit children call macro
    @callTest var array: Array<Int32> = [60, 70, @callTest(80)]
    if (array[2] != 80) {
        print("test ArrayLit children call macro failed\n")
        return 1
    }

    // test ArrayAccess expr call macro
    let id = 1
    let member = @callTest(array)[@callTest(id)]
    if (member != array[id]) {
        print("test ArrayAccess call macro failed\n")
        return 1
    }
    print("test ArrayLit Access call macro success\n")
    return 0
}

func array_sizedlit(): Int64 {
    // test ArraySizedLit call macro
    var initsize = 5
    var initvalue = 3
    var array = Array<Int64>(@callTest(initsize), repeat: @callTest(initvalue))

    if (array[initsize - 1] != initvalue) {
        print("test ArraySizedLit call macro failed\n")
        return 1
    }
    print("test ArraySizedLit call macro success\n")
    return 0
}

main(): Int64 {
    if (array_access() != 0) {
        return 1
    }
    if (array_sizedlit() != 0) {
        return 2
    }

    let myArray: Array<Int32> = @callTest(Array<Int32>(10, repeat: 1))
    var sum: Int32 = 0
    for (a in myArray) {
        sum = sum + a
    }
    if (sum != 10) {
        return 3
    }
    return 0
}
