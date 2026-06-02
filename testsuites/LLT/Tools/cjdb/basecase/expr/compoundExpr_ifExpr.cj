// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class clA {
   var a=1
   public func classMemberFunc(){ 0 }
}
struct strB {
   var b=1 
}
main(){ 
   if (clA().classMemberFunc() > strB().b) { "ok" }else { "error" }
   0
}