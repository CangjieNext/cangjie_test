package package1

import objc.lang.*
// It is important to not use the wildcard import
import package0.I

@ObjCMirror
open class M {
    public init()
    public open func boo(): I
}
