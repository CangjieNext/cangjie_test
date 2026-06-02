// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


class AA{}
struct BB{}
enum CC{ Red}

func f1(){ AA() }
func f2(){ BB() }
func f3(){ CC.Red }

main(){
  f1()
  f2()
  f3()
  0
}