enum private<t1, t2>{
 | public(Float16)
 | private(t1, t2)
 func t3(){
    return 1
 }
}

main() {
   var open = private<Int64, Int64>.public(1.0)
   return open.t3() - 1
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
