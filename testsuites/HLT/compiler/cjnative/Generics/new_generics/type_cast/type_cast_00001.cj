/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I<T> {}

struct S1<T> {}

struct S2 {}

struct S3<T> {}

extend<T> S1<T> <: I<T> {}

extend S2 <: I<Int64> {}

extend<T> S3<T> <: I<Int64> {}

main() {
    var x1: I<Int64> = S1<Int64>()
    var x2: I<Int64> = S2()
    var x3: I<Int64> = S3<Int32>()
    var v1 = match (x1) {
        case v: S1<Int64> => true
        case v: S1<Int32> => false
        case v: S2 => false
        case v: S3<Int64> => false
        case v: S3<Int32> => false
        case _ => false
    }
    var v2 = match (x2) {
        case v: S1<Int64> => false
        case v: S1<Int32> => false
        case v: S2 => true
        case v: S3<Int64> => false
        case v: S3<Int32> => false
        case _ => false
    }
    var v3 = match (x3) {
        case v: S1<Int64> => false
        case v: S1<Int32> => false
        case v: S2 => false
        case v: S3<Int64> => false
        case v: S3<Int32> => true
        case _ => false
    }
    if (v1 && v2 && v3) {
        return 0
    }
    return 1
}
