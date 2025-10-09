/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords
main(): Int64 {
    print("hello world\n")
    return 0
}


var (public2, private2, protected2) = (1,2,3)

class open_2{}
func public_2():open_2{
    return open_2()
}

func name<T>() {
    
}
