// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

var a: b = b()

class b {
    var g: Option<UInt16> = None
    var d = b()
}

main(): Int64 {
    b()
    0
}

/* SCAN
error: recursive constructor calling detected
  ==> OOM.cj:13:13:
   | 
13 |     var d = b()
   |             ^ 
   | 
note: depends on
  ==> OOM.cj:11:7:
   | 
11 | class b {
   |       ^ 
   | 
note: depends on
  ==> OOM.cj:13:13:
   | 
13 |     var d = b()
   |             ^ 
   | 

1 error generated, 1 error printed.
*/
