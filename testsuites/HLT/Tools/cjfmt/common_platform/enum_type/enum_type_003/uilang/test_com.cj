/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common enum E1{
    AB
    public common prop p:Int64
}

protected common enum E3<T,R>{
    AB | AB(T,R)
    public common prop p:Int64
}
