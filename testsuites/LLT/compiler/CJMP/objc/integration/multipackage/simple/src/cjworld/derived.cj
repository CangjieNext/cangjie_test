package cjworld

import objc.lang.*
import cjbase.*

@ObjCImpl
public class Derived <: Base {
    public init() {}
    public func foo(): Int64 { 2 }
}
