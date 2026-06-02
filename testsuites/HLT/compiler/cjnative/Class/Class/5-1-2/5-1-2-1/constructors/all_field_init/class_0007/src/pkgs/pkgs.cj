/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgs

class Data {
    public var a : Int32 
    public let b : Int32  

    public let b1 : Array<Int32>  
    public let b2 : List<Int32>[]  

    public let b3 : Data  
}

// ASSERT: regex :4:.* the uninitialized member variable 'a' is not initialized in the constructor of class or struct

// ASSERT: regex :5:.* the uninitialized member variable 'b' is not initialized in the constructor of class or struct

// ASSERT: regex :7:.* the uninitialized member variable 'b1' is not initialized in the constructor of class or struct

// ASSERT: regex :8:.* the uninitialized member variable 'b2' is not initialized in the constructor of class or struct

// ASSERT: regex :10:.* the uninitialized member variable 'b3' is not initialized in the constructor of class or struct
