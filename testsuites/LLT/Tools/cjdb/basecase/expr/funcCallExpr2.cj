// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class AA{}
struct BB{}
enum CC{ Red}

func f1(x:AA){ 0 }
func f2(x:BB){ 0 }
func f3(x:CC){ 0 }

var a = AA()
var b = BB()
var c = Red
main(){
  f1(a)
  f2(b)
  f3(c)
   0
}