// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan The function call to f1 in the line 1 and the column 0 was an apply call

class A{
    func f1(){
      return 0
    }

}
main() {   
    var a = A()
    a.f1;()
} 

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
