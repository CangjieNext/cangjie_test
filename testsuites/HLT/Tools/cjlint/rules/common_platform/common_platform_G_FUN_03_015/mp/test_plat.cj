/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific extend<T> Container<T>{
    specific func setItem(newItem:T){
        item = newItem
    }
    specific func getItem():?T{
        item
    }
}
