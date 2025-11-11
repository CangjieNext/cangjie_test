/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface A{
  func i________(b: Int32, a!: Int64){
  	a
  	b
  }
  func i123(b: Int32, a!: Int64){
  	a
  	b
  }
  func iFunc(b: Int32, a!: Int64){
  	a
  	b
  }
}

class C <: A{

}

main(){
  C().i________(1, a: 2)
  C().i123(1, a: 2)
  C().iFunc(1, a: 2)
  1
}



