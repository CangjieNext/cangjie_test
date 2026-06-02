// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f --cfg="cond=False" --cfg="tar=Mul"
// ERRCHECK : %compiler %f --cfg="cond=True" --cfg="tar=Mul" %noColor

@When[cond == "False" && tar == "Mul"]
func A() {
    return 0
}

main() {
    return A()
}

/* SCAN
error: undeclared identifier 'A'
  ==> test_multiple.cj:16:12:
   | 
16 |     return A()
   |            ^ 
   | 

1 error generated, 1 error printed.
*/
