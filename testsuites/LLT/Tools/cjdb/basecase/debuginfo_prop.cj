// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public interface Test{
    mut prop i:Int64
}

public class cls<:Test{
    private var x = 50;
    public mut prop i:Int64{
        get(){1}
        set(v){ 
            x = v 
        }
    }
}

main(){
    var t:cls = cls()
    t.i = 50
    if(t.i == 2){
        return 0
    }
    return 1
}