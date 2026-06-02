// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC : %compiler %f --cfg="hello=true"
// ERRCHECK : %compiler %f --cfg="bello=true" %noColor

@When[hello == "true"]
func Hello() {
    println("Hello")
}

main() {
    Hello()
}

/* SCAN
error: conditional compilation have not supported this condition: 'hello'
  ==> test_names.cj:10:7:
   | 
10 | @When[hello == "true"]
   |       ^ 
   | 

1 error generated, 1 error printed.
*/
