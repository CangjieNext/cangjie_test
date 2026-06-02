// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func cj_foo(ptr1: CPointer<Int64>, ptr2: CPointer<Byte>, len: UInt32): Int32 {
    unsafe {
        var data = Data()
        let res = c_foo(ptr1, ptr2, len, inout data)
        return res
    }
}

main() {
    var ptr1 = CPointer<Int64>()
    var ptr2 = CPointer<Byte>()
    cj_foo(ptr1, ptr2, 0)
}

@C
struct Data {}

foreign func c_foo(ptr1: CPointer<Int64>, ptr2: CPointer<Byte>, len: UInt32, data: CPointer<Data>): Int32

/* SCAN-IN
error: the expression qualified by 'inout' cannot be of zero-sized type
 ==> inout_e34.cj:6:42:
  | 
6 |         let res = c_foo(ptr1, ptr2, len, inout data)
  |                                          ^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
