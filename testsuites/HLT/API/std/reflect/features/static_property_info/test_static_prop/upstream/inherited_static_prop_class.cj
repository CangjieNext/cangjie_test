
package upstream

open class InheritedStaticPropBase {
    public static prop inheritedProp: Int64 {
        get() {
            1
        }
    }
}

public class InheritedStaticPropChild <: InheritedStaticPropBase {
    public static prop ownProp: Int64 {
        get() {
            2
        }
    }
}
