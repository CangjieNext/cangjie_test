// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public class S <: I
{
    @OverflowThrowing // Annotation
    open
    public // Modifier
    func get  // Identifier
    (b  // Param name
    !  // is named
    :Int64  // param type
    ) 
    :Int64 // RetType
    {
        0   // a) body change with type, b) body change without type
    }
}

public interface I{
    func get(b!:Int64) : Int64
}

main() {}