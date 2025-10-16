// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public class Foo{
    var x = 4
    public init(){}
}
common public interface I1{
     
}

common extend Foo <:I1 {
    common prop i:Int64 
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 2>&1 | compare %f

package cmp
platform public interface I1{
}

platform extend Foo <:I1{
    platform mut prop i:Int64 {
        get(){x}
        set(value) {x=value}
    }
}
extend Foo{
 
}
main(){

}

/* SCAN
error: property 'i' should be immutable
  ==> c/c.cj:25:5:

error: 'platform' property 'i' can not find 'common' match
  ==> p/p.cj:8:5:
   | 
8  |       platform mut prop i:Int64 {
   |  _____^
9  | |         get(){x}
   | | ...
11 | |     }
   | |_____^
   | 

2 errors generated, 2 errors printed.
*/
