// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


class clA{
   func classMemberFunc(){ 0 }
}
struct strB{
    var b=("abcd",1,2,3)
    public func memberFunc(){
       return 1
    }
}
main(){
   var a=["ab","bc","cd"]
   a[strB().b[1] + strB().memberFunc()]
   0
}