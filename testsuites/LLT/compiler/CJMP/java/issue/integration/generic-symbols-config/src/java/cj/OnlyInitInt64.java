package issue;


import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

final public class OnlyInitInt64 {
    static {
        loadLibrary("issue");
    }

    long self;

    public OnlyInitInt64(long v) {
        self = initCJObjectG_(v);
    }

    private OnlyInitInt64(long v, $$NativeConstructorMarker __init__) {
    }

    public native long initCJObjectG_(long v);

    @Override
    public boolean equals(Object obj) {
        throw new UnsupportedOperationException("equals is not supported for java proxy object.");
    }

    @Override
    public int hashCode() {
        throw new UnsupportedOperationException("hashCode is not supported for java proxy object.");
    }

    @Override
    public String toString() {
        throw new UnsupportedOperationException("toString is not supported for java proxy object.");
    }

    public native void deleteCJObject(long self);

    @Override
    public void finalize() {
        deleteCJObject(this.self);
    }
}
