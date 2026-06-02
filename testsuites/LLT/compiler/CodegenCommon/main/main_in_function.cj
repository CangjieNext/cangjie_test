// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1:: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func test() {
    main()
    private main(): Int64 {
        return 0
    }
}

/* SCAN
error: unexpected main function in function body
  ==> main_in_function.cj:11:5:
   | 
10 | func test() {
   | ~~~~ in function
11 |     main()
   |     ^^^^ unexpected main function
   | 

error: body of main function is missing
  ==> main_in_function.cj:11:11:
   | 
11 |     main()
   |           ^ missing main function body here
   | 

error: unexpected main function in function body
  ==> main_in_function.cj:12:13:
   | 
10 | func test() {
   | ~~~~ in function
11 |     main()
12 |     private main(): Int64 {
   |             ^^^^ unexpected main function
   | 

3 errors generated, 3 errors printed.
*/
