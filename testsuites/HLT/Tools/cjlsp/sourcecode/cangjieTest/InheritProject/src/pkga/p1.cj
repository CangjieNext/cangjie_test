/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkga


public abstract open class A1{
    open public mut prop  ii_1:Int64
}

public open class A2{
    static public mut prop ii_1:Int64{
        get(){1}
        set(v){}
    }

}



public open class A3{
    open public mut prop  ii_1:Int64{
        get(){1}
        set(v){}
    }

}

public abstract open class A4{
    public open func f1_2():Unit
}

public open class A5{
    public open func name_1() :Unit{}
}


public open class A6<T>{
    public static func name_1<T>() :Unit{}
}

public open class A7{
    public static func name1() :Unit{}
}


public open class A8{
    public static func name_2() :Unit{}
    public open func name2() :Unit{}
}

public class B8 <: A8{
    public static func name_2() :Unit{}
}

public open class A11<T>{
    public open func name_1() :Unit{}
}

public open class A18{
    public open func name_1():Unit{}
}

public open class A17{
    public static func name_1() :Unit{}
}


public interface AInterface1 {
    func ffff(): Unit
}

public open class BAClass <: AInterface1 {
    public func ffff(): Unit {
        return
    }
}

public open class A20{
    public static func name() :Unit{}
}

public open class A21{
    public open func name2(bias:Float16):Float16{
        return bias
    }
}



public open class A22{
    public open func size1_1(a:Int64,b!:Float16):Unit {}
}

public abstract open class A23{
    open public mut prop  ii1:Int64
}

public open class A24{
    open public func gg_1():Unit{}
}

