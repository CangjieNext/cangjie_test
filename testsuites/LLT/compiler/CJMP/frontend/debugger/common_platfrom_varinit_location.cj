// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c -g
package cmp

public common struct A {
    public var a: Int64 = 1
    public common A(a: Int64)
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler -j1  --apc=1 %noColor  --save-temps . --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p -g
// (CJNATIVE) EXEC: %llvmDissembler cmp.bc -o cmp.ll
// (CJNATIVE) EXEC: %cat cmp.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: regex define void @"_CN3cmp1A6<init>Hl"\(%"record.cmp:A" addrspace\(1\)\* noalias %this, i8 addrspace\(1\)\* %"\$BP", i64 %a, %TypeInfo\* %outerTI\) #\d+ gc "cangjie" personality i32 \(...\)\* @"__cj_personality_v0\$" !dbg !(?P<num1>\d+)
// (CJNATIVE) ASSERT: regex call void @"_CN3cmp1AE\$varInit"\(%Unit.Type\* noalias sret\(%Unit.Type\) %0, %"record.cmp:A" addrspace\(1\)\* %this, i8 addrspace\(1\)\* %"\$BP", %TypeInfo\* @"cmp:A.ti"\), !dbg !(?P<num2>\d+)
// (CJNATIVE) ASSERT: regex !(?P=num1) = distinct !DISubprogram\(name: "init", linkageName: "_CN3cmp1A6<init>Hl",
// (CJNATIVE) ASSERT: regex !(?P=num2) = !DILocation\(line: 0, scope: !(?P=num1)\)

package cmp

public platform struct A {
    public platform A(a: Int64) {
        this.a = a
    }
}

