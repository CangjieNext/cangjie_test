// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) RUN-EXEC-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %overflowOpt %import_objc_interop
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat ./objc-gen/A_foreign.h | compare %f

/* SCAN-IN
#import "Foo.h"
*/
/* SCAN-IN
#import "A_foreign.h"
*/
/* SCAN-IN
@interface A_foreign : M_foreign
*/

import objc.lang.*

@ObjC["M_foreign", importedFrom: "\"Foo.h\""]
public open foreign class M {
    init()
}

@ObjC["A_foreign"]
class A <: M {
    public init() {
    }
}
