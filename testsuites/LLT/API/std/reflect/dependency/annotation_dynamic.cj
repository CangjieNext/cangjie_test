/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package AnnotationTestDynamic

import annotation_macro.*

@Annotation
@ConstructAnnotation
public class DA1 {}

@Annotation
@ConstructAnnotation
public class DA2 {}

@Annotation
@ConstructAnnotation
public class DA3 {}

@Annotation
@ConstructAnnotation
public class DA4 {}


/**********************************************************/

/******************************************************************/
@DA1["Annotation1"]
@DA1["Annotation1"]
public let globalVariable1: Int64 = 1

@DA1["Annotation1_0"]
@DA1["Annotation1_1"]
public let globalVariable2: Int64 = 1

@DA1["Annotation1_0"]
@DA1["Annotation1_1"]
@DA2["Annotation2"]
public let globalVariable3: Int64 = 1

@DA1["Annotation1"]
@DA2["Annotation2"]
@DA3["Annotation3"]
public let globalVariable4: Int64 = 1

@DA1["Annotation1"]
@DA1["Annotation1"]
public func globalFunction1() {}

@DA1["Annotation1_0"]
@DA1["Annotation1_1"]
public func globalFunction2() {}

@DA1["Annotation1_0"]
@DA1["Annotation1_1"]
@DA2["Annotation2"]
public func globalFunction3() {}

@DA1["Annotation1"]
@DA2["Annotation2"]
@DA3["Annotation3"]
public func globalFunction4() {}
/******************************************************************/
@DA1["Annotation1"]
@DA1["Annotation1"]
public struct DS0 {
    @DA1["Annotation1"]
    @DA1["Annotation1"]
    public init() {}
}

@DA1["Annotation1_0"]
@DA1["Annotation1_1"]
public struct DS1 {
    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    public init() {}
}

@DA1["Annotation1_0"]
@DA1["Annotation1_1"]
@DA2["Annotation2"]
public struct DS2 {
    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    @DA2["Annotation2"]
    public init() {}
}

@DA1["Annotation1"]
@DA2["Annotation2"]
@DA3["Annotation3"]
public struct DS3 {
    @DA1["Annotation1"]
    @DA2["Annotation2"]
    @DA3["Annotation3"]
    public init() {}
}
/******************************************************************/
@DA1["Annotation1"]
@DA1["Annotation1"]
public class DC0 {
    @DA1["Annotation1"]
    @DA1["Annotation1"]
    public prop instanceProperty: Int64 {
        get() {
            1
        }
    }

    @DA1["Annotation1"]
    @DA1["Annotation1"]
    public static prop staticProperty: Int64 {
        get() {
            2
        }
    }

    @DA1["Annotation1"]
    @DA1["Annotation1"]
    public let instanceVariable: Int64 = 3

    @DA1["Annotation1"]
    @DA1["Annotation1"]
    public static let staticVariable: Int64 = 4

    @DA1["Annotation1"]
    @DA1["Annotation1"]
    public func instanceFunction() {
    }

    @DA1["Annotation1"]
    @DA1["Annotation1"]
    public static func staticFunction() {
    }

    public func parameterFunction(@DA1["Annotation1"]@DA1["Annotation1"]para: Int64) {}
}

@DA1["Annotation1_0"]
@DA1["Annotation1_1"]
public class DC1 {
    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    public prop instanceProperty: Int64 {
        get() {
            1
        }
    }

    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    public static prop staticProperty: Int64 {
        get() {
            2
        }
    }

    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    public let instanceVariable: Int64 = 3

    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    public static let staticVariable: Int64 = 4

    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    public func instanceFunction() {
    }

    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    public static func staticFunction() {
    }

    public func parameterFunction(@DA1["Annotation1_0"]@DA1["Annotation1_1"]para: Int64) {}

}

@DA1["Annotation1_0"]
@DA1["Annotation1_1"]
@DA2["Annotation2"]
public class DC2 {
    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    @DA2["Annotation2"]
    public prop instanceProperty: Int64 {
        get() {
            1
        }
    }

    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    @DA2["Annotation2"]
    public static prop staticProperty: Int64 {
        get() {
            2
        }
    }

    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    @DA2["Annotation2"]
    public let instanceVariable: Int64 = 3

    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    @DA2["Annotation2"]
    public static let staticVariable: Int64 = 4

    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    @DA2["Annotation2"]
    public func instanceFunction() {
    }

    @DA1["Annotation1_0"]
    @DA1["Annotation1_1"]
    @DA2["Annotation2"]
    public static func staticFunction() {
    }

    public func parameterFunction(@DA1["Annotation1_0"]@DA1["Annotation1_1"]@DA2["Annotation2"]para: Int64) {}

}

@DA1["Annotation1"]
@DA2["Annotation2"]
@DA3["Annotation3"]
public class DC3 {
    @DA1["Annotation1"]
    @DA2["Annotation2"]
    @DA3["Annotation3"]
    public prop instanceProperty: Int64 {
        get() {
            1
        }
    }

    @DA1["Annotation1"]
    @DA2["Annotation2"]
    @DA3["Annotation3"]
    public static prop staticProperty: Int64 {
        get() {
            2
        }
    }

    @DA1["Annotation1"]
    @DA2["Annotation2"]
    @DA3["Annotation3"]
    public let instanceVariable: Int64 = 3

    @DA1["Annotation1"]
    @DA2["Annotation2"]
    @DA3["Annotation3"]
    public static let staticVariable: Int64 = 4

    @DA1["Annotation1"]
    @DA2["Annotation2"]
    @DA3["Annotation3"]
    public func instanceFunction() {
    }

    @DA1["Annotation1"]
    @DA2["Annotation2"]
    @DA3["Annotation3"]
    public static func staticFunction() {
    }
    public func parameterFunction(@DA1["Annotation1"]@DA2["Annotation2"]@DA3["Annotation3"]para: Int64) {}

}