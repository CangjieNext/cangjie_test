// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -g --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan $ClN25entity_anonymous_variable0_L_3gooHv

package entity_anonymous_variable

public class C {
    public func f() {}
}

// 此处的 lambda mangle 名为：_CN25entity_anonymous_variable0_L_3gooHv
public let _ = {
    =>
    func goo() {}
    goo
}

main() {
    0
}
