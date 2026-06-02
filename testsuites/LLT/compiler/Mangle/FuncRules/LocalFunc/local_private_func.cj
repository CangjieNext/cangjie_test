// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal void @_CN18local_private_funcU000000046z7IS3fooHb
// (CJNATIVE) ASSERT: scan define internal void @_CN18local_private_func2R13gooHl

package local_private_func

private func foo(x: Bool) {}

public struct R1 {
    private func goo(x: Int64) {}
    func h() {
        foo(true)
        goo(3)
    }
}

main() {
    let r1 = R1()
    r1.h()
    0
}
