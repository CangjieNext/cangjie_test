// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class clA{
   func classMemberFunc(){ 0 }
}
struct strB{
    var a=0
    public func memberFunc(){
       return clA()
    }
}
main(){
   strB().memberFunc().classMemberFunc()
   0
}