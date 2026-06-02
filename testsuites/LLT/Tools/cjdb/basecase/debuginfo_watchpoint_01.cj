// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    var a = 30
    var test_aa: Int64 = 300
    var test0: Float32 = 3.1
    var int200: UIntNative = 200
    var tuple_int16: (Int16, Int16) = (1, 2)
    var varay01: VArray<Int8, $3> = [1, 2, 3]
    a = 40
    test_aa = 100
    test0 = 10.01
    int200 = 10
    var test32 = test_aa
    var test33 = int200
    var test34 = tuple_int16[1]
    var test35 = a
    return 1
}
