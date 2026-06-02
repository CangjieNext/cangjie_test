/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public Test(var a1: Range<Int8>, var a2: Range<UInt8>, var a3: Range<Int16>, var a4: Range<UInt16>,
        var a5: Range<Int32>, var a6: Range<UInt32>, var a7: Range<Int64>, var a8: Range<UInt64>) {
    }
}

main(): Int64 {
    return 0
}
