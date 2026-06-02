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
interface A<X> {}

interface A2 <: A<UInt8> {}

class B<X> <: A<X> {}

class C <: A<UInt8> {}

main() {
    var i: A<UInt8> = B<UInt8>()
    var j: A<UInt8> = C()
    var k: A2
    return 0
}
