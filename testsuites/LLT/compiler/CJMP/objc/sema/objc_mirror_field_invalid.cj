// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %frontendCompiler %dump-parse %cmp_opt %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f
// ASSERT: scan-6 error: Objective-C mirror property type must be Objective-C compatible
// ASSERT: scan 6 errors generated, 6 errors printed

import objc.lang.*

class A {}

@ObjCMirror["M1"]
class M {
   init()
   public let a: String
   public let b: Array<Int64>
   public let c: A

   public var aMut: String
   public var bMut: Array<Int64>
   public var cMut: A
}
