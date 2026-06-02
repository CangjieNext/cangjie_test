// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan @_CN7default1aE
// (CJNATIVE) ASSERT: scan @_CN7default5arrayE
// (CJNATIVE) ASSERT: scan @_CN7default1yE
// (CJNATIVE) ASSERT: scan @_CN7default1yL_1xK_E

let a: Int64 = 20
let array = [(1, 2), (3, 4), (5, 6)]
let y = {
    => const x = 1
}
