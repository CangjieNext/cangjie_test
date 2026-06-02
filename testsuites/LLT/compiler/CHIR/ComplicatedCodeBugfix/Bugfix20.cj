// LEVEL: 0
// EXEC-PIPE-1: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt %n.cj 2>&1 | compare %f



internal import stdx.encoding.json.*

func encodeValue(tag: String, input: Bool) {
    mapv(tag, false)
    ()
}

func mappingv(tag: String, f: () -> Unit) {
    () 
}

func mapv(tag: String, input: Bool) {
    mappingv(tag, {
             =>
                encodeValue("", input)  // cyclic invocation: mapv --> encodeValue --> mapv
        })
}
main() {
    0
}

/* SCAN
error: unable to infer return type, please add type annotation
 ==> Bugfix20.cj:8:6:
  | 
8 | func encodeValue(tag: String, input: Bool) {
  |      ^^^^^^^^^^^ 
  | 
note: with recursive usage from
  ==> Bugfix20.cj:20:17:
   | 
20 |                 encodeValue("", input)  // cyclic invocation: mapv --> encodeValue --> mapv
   |                 ^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
