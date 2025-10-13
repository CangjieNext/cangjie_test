// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func nothing() {
	var n : Int64
	do { n = break } while(false)
	return n
}

main() {
	println("hello")
	nothing()
	println("bye")
}

/* SCAN
error: variable 'n' is used before initialization
 ==> do_while5.cj:7:9:
  | 
7 |     return n
  |            ^ 
  | 

1 error generated, 1 error printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
