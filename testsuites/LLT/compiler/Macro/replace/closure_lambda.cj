// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: scan expected declaration here

internal import test.*

func test(x:()->Int8):Int64 {return Int64(x()-127)}

main() {
    // Trailing Closure
    var res = test {
        var x : Int8 = 100
        return x
    }
    print("res="+res.toString()+"\n")

    // Trailing Closure
    var res1 = test @callTest {
        var x : Int8 = 100
        return x
    }

    var res3 = test @callTest[xxx] {
        var x : Int8 = 100
        return x
    }

    var tes = 0
    // Not Trailing Closure
    var res5 = tes
    @callTest[xxx]
    {
        var x : Int8 = 100
        return x
    }
    print("success\n")

    return 0
}
