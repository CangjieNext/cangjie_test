// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal void @_CN23entity_generic_function3fooIG_HiE1hHv
package entity_generic_function

func foo<T>(a: Int32) {
    func h() {}
    const x = 1
    h
}

main() {
    // foo<T>.x 会在当前包被实例化，实例化版本 x 的 mangle 名为：_CN23entity_generic_function3fooIG_HiE1hHv
    foo<Int32>(1)
    0
}
