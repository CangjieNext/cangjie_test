package d

import a.A
import b.I
import c.Type

public func test(typeNum: Type): Unit {
    match (typeNum) {
        case TypeA(a) => a.testFunc()
    }
}

main(): Unit {
    
}