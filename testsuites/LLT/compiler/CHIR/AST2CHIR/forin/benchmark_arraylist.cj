// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %f -o %output --save-temps . --apc=1 --test --no-sub-pkg -O2 --int-overflow wrapping
// (Linux and CJNATIVE) EXEC: %llvmDissembler %n.opt.bc
// (Linux and CJNATIVE) EXEC: sed -r -n '/define internal fastcc double @_CN7default20Test_ArrayList_Equal11asTestSuiteHvEL3_L0_E_500(/,/^}$/p' | compare %f

import std.time.*
import std.collection.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_ArrayList_Equal {
    static var int_32 = ArrayList<Int64>(32, {index: Int64 => index})
    static var int_32_equal = ArrayList<Int64>(32, {index: Int64 => index})
    var res = false

    @Bench
    func BenchmarkArrayListEqual_Int64_N32(): Unit {
        res = int_32 == int_32_equal
    }
}

// ASSERT: regex-not zext i1 %.* to i64
