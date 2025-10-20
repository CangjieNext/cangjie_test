// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f

import interoplib.objc.*

class Foo {}

@ObjCMirror
class M {
   @ForeignName["initWithA:"]
   init(a: Foo)
}

/* SCAN-IN
error: param type of Objective-C mirror constructor must be Objective-C compatible
  ==> objc_mirror_ctor_type_mismatch.cj:10:9:
   | 
10 |    init(a: Foo)
   |         ^^^^^^ 
   | 

1 error generated, 1 error printed.
*/