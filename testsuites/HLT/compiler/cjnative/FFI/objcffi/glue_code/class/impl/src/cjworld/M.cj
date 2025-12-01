
 package cjworld
import objc.lang.*

@C
public struct S  {
public var x: Int32 = 0i32

public var y: Int32 = 0i32

}
@ObjCMirror
public open class M {
public init() 
public open func goo(): S  

}
