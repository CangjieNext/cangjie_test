/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

foreign func strcmp(str1: CString, str2: CString): Int32

class CallSign {
    var value: String
    
    init(value: String) {
        this.value = value
    }
    
    func compareTo(other: CallSign): Int64 {
        match (this.value.compare(other.value)) {
            case Ordering.EQ => return 0
            case Ordering.GT => return 1
            case _ => return -1
        }
    }
}

extend CallSign <: ToString {
    public func toString(): String {
        return value
    }
}