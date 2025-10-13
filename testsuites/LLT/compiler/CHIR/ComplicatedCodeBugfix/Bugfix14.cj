// LEVEL: 0
// EXEC-PIPE-0: %compiler -g %debugCHIROpt %enableO2 %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace



func a(input:Bool):Bool{input}
class A{
    public var y = a~>a
}


main(): Int64 {
    
    
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
