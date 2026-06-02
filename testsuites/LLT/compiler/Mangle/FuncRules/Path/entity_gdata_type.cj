// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan @_CN17entity_gdata_type1AIG_E1xE
package entity_gdata_type

class A<T> {
    static var x = 1
}

main() {
    // A<T>.x 会在当前包被实例化，实例化版本 x 的 mangle 名为：_CN17entity_gdata_type1AIG_E1xE
    let a = A<Int32>()
    0
}
