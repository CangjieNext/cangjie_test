/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import pkg_1.*

main(){
    while(true){
        let cla_ins:Clazz =Clazz(23)
        var data = cla_ins.getBaseType()
        var v1 :(Int8,Int16,Int32,Int64) = data[0]
        var vm1 :Int32 = v1[2]
        var vm2 :Array<Int32> = [vm1,23,45]
        vm1 = Int32(vm2.size)
    }

    return 0
}
