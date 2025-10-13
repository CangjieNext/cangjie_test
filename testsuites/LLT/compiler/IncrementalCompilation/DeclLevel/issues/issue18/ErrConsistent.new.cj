class A{
    public init() { } 
    
    public var var_1695349046376_51: UInt
    public static mut prop var_1695349046376_56: UInt64 { 
        get() { 
            () 
            UInt64(123) 
            var_1695349046376_250 
        } 
        set(Value) { 
            Int64(40) 
            () 
            var_1695349046376_250 = Value 
        } } 
        static var var_1695349046376_250: UInt64
        static init() { } 
}

main(): Int64{
    1
}

// ASSERT: regex-not rollback
/* SCAN-IN
error: the static member variable 'var_1695349046376_250' is not initialized
  ==> inc.cj:16:9:
   | 
16 |         static var var_1695349046376_250: UInt64
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
   # note: you may add an initializer inline or initialize the variable in the 'static init'
note: static init defined here
  ==> inc.cj:17:16:
   | 
17 |         static init() { } 
   |                ^^^^ 
   | 

error: the uninitialized member variable 'var_1695349046376_51' is not initialized in the constructor of class or struct
 ==> inc.cj:2:5:
  | 
2 |     public init() { } 
  |     ^ 
  | 

2 errors generated, 2 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
