// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func NonExist(ptr: CPointer<Int64>): Unit

struct Data {
    var a: Int64 = 0

    func set1() {
        unsafe { NonExist(inout a) }      // ERROR
        unsafe { NonExist(inout this.a) } // ERROR
    }
}

extend Data {
    func set2() {
        unsafe { NonExist(inout a) }      // ERROR
        unsafe { NonExist(inout this.a) } // ERROR
    }
}

main() {
    let d = Data()
    d.set1()
    d.set2()
    Data().set1()
    Data().set2()
}

/* SCAN
error: instance member variable 'a' cannot be modified in immutable function
 ==> inout_e25.cj:9:33:
  | 
9 |         unsafe { NonExist(inout a) }      // ERROR
  |                                 ^ 
  | 

error: instance member variable 'a' cannot be modified in immutable function
  ==> inout_e25.cj:10:33:
   | 
10 |         unsafe { NonExist(inout this.a) } // ERROR
   |                                 ^ 
   | 

error: instance member variable 'a' cannot be modified in immutable function
  ==> inout_e25.cj:16:33:
   | 
16 |         unsafe { NonExist(inout a) }      // ERROR
   |                                 ^ 
   | 

error: instance member variable 'a' cannot be modified in immutable function
  ==> inout_e25.cj:17:33:
   | 
17 |         unsafe { NonExist(inout this.a) } // ERROR
   |                                 ^ 
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
