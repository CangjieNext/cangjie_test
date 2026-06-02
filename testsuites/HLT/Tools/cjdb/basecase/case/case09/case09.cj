/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class ClassViaExtend {
    public var width: Int32 = 10
    public var length: Int32 = 20
    public init (par_1: Int32, par_2: Int32) {
      this.width = par_1
      this.length = par_2
    }

}

extend  ClassViaExtend{
    public static prop v1: Int64 { //静态成员属性
        get() { 1 }
    }
    public prop v2: Int64 { //实例成员属性
        get() { 2 }
    }
}

main() {
    let claIns_1:ClassViaExtend = ClassViaExtend(12,32)
    var varCE3 = claIns_1.v2 //实例成员属性 (Int64) :2
}
