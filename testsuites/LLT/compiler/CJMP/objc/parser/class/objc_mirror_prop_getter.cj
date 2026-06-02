// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@ObjCMirror
class M {
    public prop x: Int64 {
        get() { 0 }
    }
}

/* SCAN-IN
error: @ObjCMirror declaration property 'x' cannot have getter
  ==> objc_mirror_prop_getter.cj:11:5:
   | 
11 |       public prop x: Int64 {
   |  _____^
12 | |         get() { 0 }
13 | |     }
   | |_____^ @ObjCMirror declaration property cannot have getter
   | 

1 error generated, 1 error printed.
*/
