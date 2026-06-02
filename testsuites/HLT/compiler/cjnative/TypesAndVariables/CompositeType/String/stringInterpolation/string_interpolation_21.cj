/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

//brief：插值字符串中为各种定义和表达式
main() {
   var c = 1
   var a1 = "${()}" 
   var a2 = "${var a = 1}" 
   "${var a = 1}" 
   var a = 1 
   var a2_ = "${var a = 1;1}" 
   var a3 = "${func foo(){}}" 
   "${func foo(){}}" 
   func foo(){} 
   var a3_ = "${func foo(){};1}" 
   var a4 = "${{1}()}" 
   var a5 = "${{1}}" 
   var a6 = "${match (1){ case _ => 1}}"  
   var a7 = "${if(true){1}}"  
   var a8 = "${if(true){1}else{1}}" 

   var a9_ = "${class A{};1}" 
   var a9 = "${class A{}}" 

   return 0
}
// ASSERT: scan parse_expected_double_arrow_in_lambda
// ASSERT: scan parse_unexpected_declaration_in_scope
