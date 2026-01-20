/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func h1<T>(x: T): T{
    x
}

func h2<T>(x: T): T{
    x
}                    

main() {
    var hh = h1<Int64> ~> h2<Int64>
    var hh2 = h1<Int64> ~> h1<Int64>
    var hh3 = h2<Float64> ~> h2<Float64>
    var hh4 = h2<Int32> ~> h2<Int32>
    0
}
