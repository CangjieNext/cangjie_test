package testissue;


import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

final public class HBool {
    static {
        loadLibrary("testissue");
    }

    long self;

    public HBool() {
        self = initCJObject();
    }

    private HBool($$NativeConstructorMarker __init__) {
    }

    public native long initCJObject();

    private HBool (long id, $$NativeConstructorMarker __init__) {
        self = id;
    }

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
