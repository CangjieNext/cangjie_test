// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class clA {
   public func classMemberFunc(){ 5 }
}
struct strB {
   var b=1 
}

main() { 
   var a=0
   while( clA().classMemberFunc() > a + strB().b ) {
      a+=1
   }
   0
}
