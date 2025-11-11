/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface A{}
class B <: A{
    public func location() {
        unsafe {
            var file = UInt32(0)
        }
    }
}

extend B{
    public func test() {
        unsafe {
            var file = UInt32(0)
        }
    }
}
main(){

}

