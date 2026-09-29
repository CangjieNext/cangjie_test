
package upstream

open class InheritedStaticVarBase {
    public static var inheritedVar: Int64 = 1
}

public class InheritedStaticVarChild <: InheritedStaticVarBase {
    public static var ownVar: Int64 = 2
}
