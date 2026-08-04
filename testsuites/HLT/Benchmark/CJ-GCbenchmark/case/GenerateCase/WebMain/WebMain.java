/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.ArrayList;
import java.util.concurrent.*;
import java.io.*;
import java.time.Duration;
import java.time.LocalDateTime;
class java_lang_Object {

}
class java_io_Serializable extends Object {

}
class java_lang_Comparable extends Object {

}
class java_lang_CharSequence extends Object {

}
class java_lang_constant_Constable extends Object {

}
class java_lang_constant_ConstantDesc extends Object {

}
class java_lang_String extends Object {
public byte[] value;
public byte coder;
public int hash;
public boolean hashIsZero;
public static long serialVersionUID;
public static boolean COMPACT_STRINGS;
public static java_io_ObjectStreamField[] serialPersistentFields;
public static char REPL;
public static Object CASE_INSENSITIVE_ORDER;
public static byte LATIN1;
public static byte UTF16;
}
class java_lang_reflect_AnnotatedElement extends Object {

}
class java_lang_reflect_GenericDeclaration extends Object {

}
class java_lang_reflect_Type extends Object {

}
class java_lang_invoke_TypeDescriptor extends Object {

}
class java_lang_invoke_TypeDescriptor$OfField extends Object {

}
class java_lang_Class extends Object {
public static int ANNOTATION;
public static int ENUM;
public static int SYNTHETIC;
public java_lang_reflect_Constructor cachedConstructor;
public java_lang_String name;
public java_lang_Module module;
public java_lang_ClassLoader classLoader;
public Object classData;
public java_lang_String packageName;
public java_lang_Class componentType;
public static java_security_ProtectionDomain allPermDomain;
public java_lang_ref_SoftReference reflectionData;
public int classRedefinedCount;
public Object genericInfo;
public static java_lang_Class[] EMPTY_CLASS_ARRAY;
public static long serialVersionUID;
public static java_io_ObjectStreamField[] serialPersistentFields;
public static jdk_internal_reflect_ReflectionFactory reflectionFactory;
public Object[] enumConstants;
public Object enumConstantDirectory;
public Object annotationData;
public Object annotationType;
public Object classValueMap;
}
class java_lang_Cloneable extends Object {

}
class java_lang_ClassLoader extends Object {
public java_lang_ClassLoader parent;
public java_lang_String name;
public java_lang_Module unnamedModule;
public java_lang_String nameAndId;
public java_util_concurrent_ConcurrentHashMap parallelLockMap;
public java_util_concurrent_ConcurrentHashMap package2certs;
public static java_security_cert_Certificate[] nocerts;
public java_util_ArrayList classes;
public java_security_ProtectionDomain defaultDomain;
public java_util_concurrent_ConcurrentHashMap packages;
public static java_lang_ClassLoader scl;
public jdk_internal_loader_NativeLibraries libraries;
public Object assertionLock;
public boolean defaultAssertionStatus;
public Object packageAssertionStatus;
public Object classAssertionStatus;
public java_util_concurrent_ConcurrentHashMap classLoaderValueMap;
public static boolean $assertionsDisabled;
}
class java_lang_System extends Object {
public static java_io_InputStream in;
public static java_io_PrintStream out;
public static java_io_PrintStream err;
public static int NEVER;
public static int MAYBE;
public static int allowSecurityManager;
public static java_lang_SecurityManager security;
public static Object cons;
public static java_io_PrintStream initialErrStream;
public static java_util_Properties props;
public static java_lang_String lineSeparator;
public static java_lang_ModuleLayer bootLayer;
}
class java_lang_Throwable extends Object {
public static long serialVersionUID;
public Object backtrace;
public java_lang_String detailMessage;
public static java_lang_StackTraceElement[] UNASSIGNED_STACK;
public java_lang_Throwable cause;
public java_lang_StackTraceElement[] stackTrace;
public int depth;
public static Object SUPPRESSED_SENTINEL;
public Object suppressedExceptions;
public static java_lang_String NULL_CAUSE_MESSAGE;
public static java_lang_String SELF_SUPPRESSION_MESSAGE;
public static java_lang_String CAUSE_CAPTION;
public static java_lang_String SUPPRESSED_CAPTION;
public static java_lang_Throwable[] EMPTY_THROWABLE_ARRAY;
public static boolean $assertionsDisabled;
}
class java_lang_Error extends java_lang_Throwable {
public static long serialVersionUID;
}
class java_lang_ThreadDeath extends java_lang_Error {
public static long serialVersionUID;
}
class java_lang_Exception extends java_lang_Throwable {
public static long serialVersionUID;
}
class java_lang_RuntimeException extends java_lang_Exception {
public static long serialVersionUID;
}
class java_lang_SecurityManager extends Object {
public boolean initialized;
public static java_lang_ThreadGroup rootGroup;
public static boolean packageAccessValid;
public static java_lang_String[] packageAccess;
public static Object packageAccessLock;
public static boolean packageDefinitionValid;
public static java_lang_String[] packageDefinition;
public static Object packageDefinitionLock;
public static Object nonExportedPkgs;
}
class java_security_ProtectionDomain extends Object {
public static boolean filePermCompatInPD;
public java_security_CodeSource codesource;
public java_lang_ClassLoader classloader;
public Object[] principals;
public java_security_PermissionCollection permissions;
public boolean hasAllPerm;
public boolean staticPermissions;
public java_security_ProtectionDomain$Key key;
}
class java_security_AccessControlContext extends Object {
public java_security_ProtectionDomain[] context;
public boolean isPrivileged;
public boolean isAuthorized;
public java_security_AccessControlContext privilegedContext;
public Object combiner;
public java_security_Permission[] permissions;
public java_security_AccessControlContext parent;
public boolean isWrapped;
public boolean isLimited;
public java_security_ProtectionDomain[] limitedContext;
public static boolean debugInit;
public static sun_security_util_Debug debug;
}
class java_security_AccessController extends Object {
public static boolean $assertionsDisabled;
}
class java_security_SecureClassLoader extends java_lang_ClassLoader {
public Object pdcache;
}
class java_lang_ReflectiveOperationException extends java_lang_Exception {
public static long serialVersionUID;
}
class java_lang_ClassNotFoundException extends java_lang_ReflectiveOperationException {
public static long serialVersionUID;
public static java_io_ObjectStreamField[] serialPersistentFields;
}
class java_lang_Record extends Object {

}
class java_lang_LinkageError extends java_lang_Error {
public static long serialVersionUID;
}
class java_lang_NoClassDefFoundError extends java_lang_LinkageError {
public static long serialVersionUID;
}
class java_lang_ClassCastException extends java_lang_RuntimeException {
public static long serialVersionUID;
}
class java_lang_ArrayStoreException extends java_lang_RuntimeException {
public static long serialVersionUID;
}
class java_lang_VirtualMachineError extends java_lang_Error {
public static long serialVersionUID;
}
class java_lang_InternalError extends java_lang_VirtualMachineError {
public static long serialVersionUID;
}
class java_lang_OutOfMemoryError extends java_lang_VirtualMachineError {
public static long serialVersionUID;
}
class java_lang_StackOverflowError extends java_lang_VirtualMachineError {
public static long serialVersionUID;
}
class java_lang_IllegalMonitorStateException extends java_lang_RuntimeException {
public static long serialVersionUID;
}
class java_lang_ref_Reference extends Object {
public Object referent;
public java_lang_ref_ReferenceQueue queue;
public java_lang_ref_Reference next;
public java_lang_ref_Reference discovered;
public static Object processPendingLock;
public static boolean processPendingActive;
public static boolean $assertionsDisabled;
}
class java_lang_ref_SoftReference extends java_lang_ref_Reference {
public static long clock;
public long timestamp;
}
class java_lang_ref_WeakReference extends java_lang_ref_Reference {

}
class java_lang_ref_FinalReference extends java_lang_ref_Reference {

}
class java_lang_ref_PhantomReference extends java_lang_ref_Reference {

}
class java_lang_ref_Finalizer extends java_lang_ref_FinalReference {
public static java_lang_ref_ReferenceQueue queue;
public static java_lang_ref_Finalizer unfinalized;
public static Object lock;
public java_lang_ref_Finalizer next;
public java_lang_ref_Finalizer prev;
public static boolean $assertionsDisabled;
}
class java_lang_Runnable extends Object {

}
class java_lang_Thread extends Object {
public java_lang_String name;
public int priority;
public boolean daemon;
public boolean interrupted;
public boolean stillborn;
public long eetop;
public Object target;
public java_lang_ThreadGroup group;
public java_lang_ClassLoader contextClassLoader;
public java_security_AccessControlContext inheritedAccessControlContext;
public static int threadInitNumber;
public java_lang_ThreadLocal$ThreadLocalMap threadLocals;
public java_lang_ThreadLocal$ThreadLocalMap inheritableThreadLocals;
public long stackSize;
public long tid;
public static long threadSeqNumber;
public int threadStatus;
public Object parkBlocker;
public Object blocker;
public Object blockerLock;
public static int MIN_PRIORITY;
public static int NORM_PRIORITY;
public static int MAX_PRIORITY;
public static java_lang_StackTraceElement[] EMPTY_STACK_TRACE;
public Object uncaughtExceptionHandler;
public static Object defaultUncaughtExceptionHandler;
public long threadLocalRandomSeed;
public int threadLocalRandomProbe;
public int threadLocalRandomSecondarySeed;
}
class java_lang_Thread$UncaughtExceptionHandler extends Object {

}
class java_lang_ThreadGroup extends Object {
public java_lang_ThreadGroup parent;
public java_lang_String name;
public int maxPriority;
public boolean destroyed;
public boolean daemon;
public int nUnstartedThreads;
public int nthreads;
public java_lang_Thread[] threads;
public int ngroups;
public java_lang_ThreadGroup[] groups;
}
class java_util_Map extends Object {

}
class java_util_Dictionary extends Object {

}
class java_util_Hashtable extends java_util_Dictionary {
public java_util_Hashtable$Entry[] table;
public int count;
public int threshold;
public float loadFactor;
public int modCount;
public static long serialVersionUID;
public static int MAX_ARRAY_SIZE;
public Object keySet;
public Object entrySet;
public Object values;
public static int KEYS;
public static int VALUES;
public static int ENTRIES;
}
class java_util_Properties extends java_util_Hashtable {
public static long serialVersionUID;
public static jdk_internal_misc_Unsafe UNSAFE;
public java_util_Properties defaults;
public java_util_concurrent_ConcurrentHashMap map;
}
class java_lang_Module extends Object {
public java_lang_ModuleLayer layer;
public java_lang_String name;
public java_lang_ClassLoader loader;
public java_lang_module_ModuleDescriptor descriptor;
public boolean enableNativeAccess;
public static java_lang_Module ALL_UNNAMED_MODULE;
public static Object ALL_UNNAMED_MODULE_SET;
public static java_lang_Module EVERYONE_MODULE;
public static Object EVERYONE_SET;
public Object reads;
public Object openPackages;
public Object exportedPackages;
public java_lang_Class moduleInfoClass;
public static boolean $assertionsDisabled;
}
class java_lang_reflect_AccessibleObject extends Object {
public boolean override;
public static jdk_internal_reflect_ReflectionFactory reflectionFactory;
public Object accessCheckCache;
public static boolean printStackWhenAccessFails;
public static boolean printStackPropertiesSet;
}
class java_lang_reflect_Member extends Object {
public static int PUBLIC;
public static int DECLARED;
}
class java_lang_reflect_Field extends java_lang_reflect_AccessibleObject {
public java_lang_Class clazz;
public int slot;
public java_lang_String name;
public java_lang_Class type;
public int modifiers;
public boolean trustedFinal;
public java_lang_String signature;
public Object genericInfo;
public byte[] annotations;
public Object fieldAccessor;
public Object overrideFieldAccessor;
public java_lang_reflect_Field root;
public Object declaredAnnotations;
public static int PUBLIC;
public static int DECLARED;
}
class java_lang_reflect_Parameter extends Object {
public java_lang_String name;
public int modifiers;
public java_lang_reflect_Executable executable;
public int index;
public Object parameterTypeCache;
public java_lang_Class parameterClassCache;
public Object declaredAnnotations;
}
class java_lang_reflect_Executable extends java_lang_reflect_AccessibleObject {
public boolean hasRealParameterData;
public java_lang_reflect_Parameter[] parameters;
public Object declaredAnnotations;
public static int PUBLIC;
public static int DECLARED;
}
class java_lang_reflect_Method extends java_lang_reflect_Executable {
public java_lang_Class clazz;
public int slot;
public java_lang_String name;
public java_lang_Class returnType;
public java_lang_Class[] parameterTypes;
public java_lang_Class[] exceptionTypes;
public int modifiers;
public java_lang_String signature;
public Object genericInfo;
public byte[] annotations;
public byte[] parameterAnnotations;
public byte[] annotationDefault;
public Object methodAccessor;
public java_lang_reflect_Method root;
}
class java_lang_reflect_Constructor extends java_lang_reflect_Executable {
public java_lang_Class clazz;
public int slot;
public java_lang_Class[] parameterTypes;
public java_lang_Class[] exceptionTypes;
public int modifiers;
public java_lang_String signature;
public Object genericInfo;
public byte[] annotations;
public byte[] parameterAnnotations;
public Object constructorAccessor;
public java_lang_reflect_Constructor root;
}
class jdk_internal_reflect_MagicAccessorImpl extends Object {

}
class jdk_internal_reflect_MethodAccessor extends Object {

}
class jdk_internal_reflect_MethodAccessorImpl extends jdk_internal_reflect_MagicAccessorImpl {

}
class jdk_internal_reflect_ConstructorAccessor extends Object {

}
class jdk_internal_reflect_ConstructorAccessorImpl extends jdk_internal_reflect_MagicAccessorImpl {

}
class jdk_internal_reflect_DelegatingClassLoader extends java_lang_ClassLoader {

}
class jdk_internal_reflect_ConstantPool extends Object {
public Object constantPoolOop;
}
class jdk_internal_reflect_FieldAccessor extends Object {

}
class jdk_internal_reflect_FieldAccessorImpl extends jdk_internal_reflect_MagicAccessorImpl {

}
class jdk_internal_reflect_UnsafeFieldAccessorImpl extends jdk_internal_reflect_FieldAccessorImpl {
public static jdk_internal_misc_Unsafe unsafe;
public java_lang_reflect_Field field;
public long fieldOffset;
public boolean isFinal;
}
class jdk_internal_reflect_UnsafeStaticFieldAccessorImpl extends jdk_internal_reflect_UnsafeFieldAccessorImpl {
public Object base;
}
class java_lang_annotation_Annotation extends Object {

}
class jdk_internal_reflect_CallerSensitive extends Object {

}
class jdk_internal_reflect_NativeConstructorAccessorImpl extends jdk_internal_reflect_ConstructorAccessorImpl {
public static jdk_internal_misc_Unsafe U;
public static long GENERATED_OFFSET;
public java_lang_reflect_Constructor c;
public jdk_internal_reflect_DelegatingConstructorAccessorImpl parent;
public int numInvocations;
public int generated;
}
class java_lang_invoke_MethodHandle extends Object {
public java_lang_invoke_MethodType type;
public java_lang_invoke_LambdaForm form;
public java_lang_invoke_MethodHandle asTypeCache;
public byte customizationCount;
public boolean updateInProgress;
public static long FORM_OFFSET;
public static long UPDATE_OFFSET;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_DirectMethodHandle extends java_lang_invoke_MethodHandle {
public java_lang_invoke_MemberName member;
public boolean crackable;
public static java_lang_invoke_MemberName$Factory IMPL_NAMES;
public static byte AF_GETFIELD;
public static byte AF_PUTFIELD;
public static byte AF_GETSTATIC;
public static byte AF_PUTSTATIC;
public static byte AF_GETSTATIC_INIT;
public static byte AF_PUTSTATIC_INIT;
public static byte AF_LIMIT;
public static int FT_LAST_WRAPPER;
public static int FT_UNCHECKED_REF;
public static int FT_CHECKED_REF;
public static int FT_LIMIT;
public static java_lang_invoke_LambdaForm[] ACCESSOR_FORMS;
public static sun_invoke_util_Wrapper[] ALL_WRAPPERS;
public static byte NF_internalMemberName;
public static byte NF_internalMemberNameEnsureInit;
public static byte NF_ensureInitialized;
public static byte NF_fieldOffset;
public static byte NF_checkBase;
public static byte NF_staticBase;
public static byte NF_staticOffset;
public static byte NF_checkCast;
public static byte NF_allocateInstance;
public static byte NF_constructorMethod;
public static byte NF_UNSAFE;
public static byte NF_checkReceiver;
public static byte NF_LIMIT;
public static java_lang_invoke_LambdaForm$NamedFunction[] NFS;
public static java_lang_invoke_MethodType OBJ_OBJ_TYPE;
public static java_lang_invoke_MethodType LONG_OBJ_TYPE;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_VarHandle extends Object {
public Object vform;
public boolean exact;
public Object typesAndInvokers;
public static Object AIOOBE_SUPPLIER;
public static long VFORM_OFFSET;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_MemberName extends Object {
public java_lang_Class clazz;
public java_lang_String name;
public Object type;
public int flags;
public java_lang_invoke_ResolvedMethodName method;
public Object resolution;
public static int MH_INVOKE_MODS;
public static int BRIDGE;
public static int VARARGS;
public static int SYNTHETIC;
public static int ANNOTATION;
public static int ENUM;
public static java_lang_String CONSTRUCTOR_NAME;
public static int RECOGNIZED_MODIFIERS;
public static int IS_METHOD;
public static int IS_CONSTRUCTOR;
public static int IS_FIELD;
public static int IS_TYPE;
public static int CALLER_SENSITIVE;
public static int TRUSTED_FINAL;
public static int ALL_ACCESS;
public static int ALL_KINDS;
public static int IS_INVOCABLE;
public static int IS_FIELD_OR_METHOD;
public static int SEARCH_ALL_SUPERS;
public static boolean $assertionsDisabled;
public static int PUBLIC;
public static int DECLARED;
}
class java_lang_invoke_ResolvedMethodName extends Object {

}
class java_lang_invoke_MethodHandleNatives extends Object {
public static Object JLA;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_LambdaForm extends Object {
public int arity;
public int result;
public boolean forceInline;
public java_lang_invoke_MethodHandle customized;
public java_lang_invoke_LambdaForm$Name[] names;
public java_lang_invoke_LambdaForm$Kind kind;
public java_lang_invoke_MemberName vmentry;
public boolean isCompiled;
public Object transformCache;
public static int VOID_RESULT;
public static int LAST_RESULT;
public static jdk_internal_perf_PerfCounter LF_FAILED;
public static int COMPILE_THRESHOLD;
public int invocationCounter;
public static int INTERNED_ARGUMENT_LIMIT;
public static java_lang_invoke_LambdaForm$Name[][] INTERNED_ARGUMENTS;
public static java_lang_invoke_MemberName$Factory IMPL_NAMES;
public static java_lang_invoke_LambdaForm[] LF_identity;
public static java_lang_invoke_LambdaForm[] LF_zero;
public static java_lang_invoke_LambdaForm$NamedFunction[] NF_identity;
public static java_lang_invoke_LambdaForm$NamedFunction[] NF_zero;
public static Object createFormsLock;
public static java_util_HashMap DEBUG_NAME_COUNTERS;
public static java_util_HashMap DEBUG_NAMES;
public static boolean TRACE_INTERPRETER;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_TypeDescriptor$OfMethod extends Object {

}
class java_lang_invoke_MethodType extends Object {
public static long serialVersionUID;
public java_lang_Class rtype;
public java_lang_Class[] ptypes;
public java_lang_invoke_MethodTypeForm form;
public Object wrapAlt;
public java_lang_invoke_Invokers invokers;
public java_lang_String methodDescriptor;
public static int MAX_JVM_ARITY;
public static int MAX_MH_ARITY;
public static int MAX_MH_INVOKER_ARITY;
public static java_lang_invoke_MethodType$ConcurrentWeakInternSet internTable;
public static java_lang_Class[] NO_PTYPES;
public static java_lang_invoke_MethodType[] objectOnlyTypes;
public static java_lang_Class[] METHOD_HANDLE_ARRAY;
public static java_io_ObjectStreamField[] serialPersistentFields;
public static boolean $assertionsDisabled;
}
class java_lang_BootstrapMethodError extends java_lang_LinkageError {
public static long serialVersionUID;
}
class java_lang_invoke_CallSite extends Object {
public java_lang_invoke_MethodHandle target;
public java_lang_invoke_MethodHandleNatives$CallSiteContext context;
public static java_lang_invoke_MethodHandle GET_TARGET;
public static java_lang_invoke_MethodHandle THROW_UCS;
public static long TARGET_OFFSET;
public static boolean $assertionsDisabled;
}
class jdk_internal_invoke_NativeEntryPoint extends Object {
public int shadowSpace;
public long[] argMoves;
public long[] returnMoves;
public boolean needTransition;
public java_lang_invoke_MethodType methodType;
public java_lang_String name;
}
class java_lang_invoke_MethodHandleNatives$CallSiteContext extends Object {

}
class java_lang_invoke_ConstantCallSite extends java_lang_invoke_CallSite {
public static jdk_internal_misc_Unsafe UNSAFE;
public boolean isFrozen;
}
class java_lang_invoke_MutableCallSite extends java_lang_invoke_CallSite {
public static java_util_concurrent_atomic_AtomicInteger STORE_BARRIER;
}
class java_lang_invoke_VolatileCallSite extends java_lang_invoke_CallSite {

}
class java_lang_AssertionStatusDirectives extends Object {
public java_lang_String[] classes;
public boolean[] classEnabled;
public java_lang_String[] packages;
public boolean[] packageEnabled;
public boolean deflt;
}
class java_lang_Appendable extends Object {

}
class java_lang_AbstractStringBuilder extends Object {
public byte[] value;
public byte coder;
public int count;
public static byte[] EMPTYVALUE;
public static int MAX_ARRAY_SIZE;
}
class java_lang_StringBuffer extends java_lang_AbstractStringBuilder {
public java_lang_String toStringCache;
public static long serialVersionUID;
public static java_io_ObjectStreamField[] serialPersistentFields;
}
class java_lang_StringBuilder extends java_lang_AbstractStringBuilder {
public static long serialVersionUID;
}
class jdk_internal_misc_UnsafeConstants extends Object {
public static int ADDRESS_SIZE0;
public static int PAGE_SIZE;
public static boolean BIG_ENDIAN;
public static boolean UNALIGNED_ACCESS;
public static int DATA_CACHE_LINE_FLUSH_SIZE;
}
class jdk_internal_misc_Unsafe extends Object {
public static jdk_internal_misc_Unsafe theUnsafe;
public static int INVALID_FIELD_OFFSET;
public static int ARRAY_BOOLEAN_BASE_OFFSET;
public static int ARRAY_BYTE_BASE_OFFSET;
public static int ARRAY_SHORT_BASE_OFFSET;
public static int ARRAY_CHAR_BASE_OFFSET;
public static int ARRAY_INT_BASE_OFFSET;
public static int ARRAY_LONG_BASE_OFFSET;
public static int ARRAY_FLOAT_BASE_OFFSET;
public static int ARRAY_DOUBLE_BASE_OFFSET;
public static int ARRAY_OBJECT_BASE_OFFSET;
public static int ARRAY_BOOLEAN_INDEX_SCALE;
public static int ARRAY_BYTE_INDEX_SCALE;
public static int ARRAY_SHORT_INDEX_SCALE;
public static int ARRAY_CHAR_INDEX_SCALE;
public static int ARRAY_INT_INDEX_SCALE;
public static int ARRAY_LONG_INDEX_SCALE;
public static int ARRAY_FLOAT_INDEX_SCALE;
public static int ARRAY_DOUBLE_INDEX_SCALE;
public static int ARRAY_OBJECT_INDEX_SCALE;
public static int ADDRESS_SIZE;
}
class jdk_internal_module_Modules extends Object {
public static Object JLA;
public static Object JLMA;
public static java_lang_ModuleLayer topLayer;
public static boolean $assertionsDisabled;
}
class java_lang_AutoCloseable extends Object {

}
class java_io_Closeable extends Object {

}
class java_io_InputStream extends Object {
public static int MAX_SKIP_BUFFER_SIZE;
public static int DEFAULT_BUFFER_SIZE;
public static int MAX_BUFFER_SIZE;
}
class java_io_ByteArrayInputStream extends java_io_InputStream {
public byte[] buf;
public int pos;
public int mark;
public int count;
}
class java_net_URL extends Object {
public static java_lang_String BUILTIN_HANDLERS_PREFIX;
public static long serialVersionUID;
public static java_lang_String protocolPathProp;
public java_lang_String protocol;
public java_lang_String host;
public int port;
public java_lang_String file;
public java_lang_String query;
public java_lang_String authority;
public java_lang_String path;
public java_lang_String userInfo;
public java_lang_String ref;
public Object hostAddress;
public java_net_URLStreamHandler handler;
public int hashCode;
public Object tempState;
public static Object factory;
public static Object defaultFactory;
public static java_lang_ThreadLocal gate;
public static java_util_Hashtable handlers;
public static Object streamHandlerLock;
public static java_io_ObjectStreamField[] serialPersistentFields;
}
class java_util_jar_Manifest extends Object {
public Object attr;
public Object entries;
public Object jv;
}
class jdk_internal_loader_BuiltinClassLoader extends java_security_SecureClassLoader {
public jdk_internal_loader_BuiltinClassLoader parent;
public jdk_internal_loader_URLClassPath ucp;
public static Object packageToModule;
public Object nameToModule;
public Object moduleToReader;
public java_lang_ref_SoftReference resourceCache;
public static boolean $assertionsDisabled;
}
class jdk_internal_loader_ClassLoaders extends Object {
public static Object JLA;
public static jdk_internal_loader_ClassLoaders$BootClassLoader BOOT_LOADER;
public static jdk_internal_loader_ClassLoaders$PlatformClassLoader PLATFORM_LOADER;
public static jdk_internal_loader_ClassLoaders$AppClassLoader APP_LOADER;
}
class jdk_internal_loader_ClassLoaders$AppClassLoader extends jdk_internal_loader_BuiltinClassLoader {

}
class jdk_internal_loader_ClassLoaders$PlatformClassLoader extends jdk_internal_loader_BuiltinClassLoader {

}
class java_security_CodeSource extends Object {
public static long serialVersionUID;
public java_net_URL location;
public Object[] signers;
public java_security_cert_Certificate[] certs;
public Object sp;
public Object factory;
public java_lang_String locationNoFragString;
}
class java_util_concurrent_ConcurrentMap extends Object {

}
class java_util_AbstractMap extends Object {
public Object keySet;
public Object values;
}
class java_util_concurrent_ConcurrentHashMap extends java_util_AbstractMap {
public static long serialVersionUID;
public static int MAXIMUM_CAPACITY;
public static int DEFAULT_CAPACITY;
public static int MAX_ARRAY_SIZE;
public static int DEFAULT_CONCURRENCY_LEVEL;
public static float LOAD_FACTOR;
public static int TREEIFY_THRESHOLD;
public static int UNTREEIFY_THRESHOLD;
public static int MIN_TREEIFY_CAPACITY;
public static int MIN_TRANSFER_STRIDE;
public static int RESIZE_STAMP_BITS;
public static int MAX_RESIZERS;
public static int RESIZE_STAMP_SHIFT;
public static int MOVED;
public static int TREEBIN;
public static int RESERVED;
public static int HASH_BITS;
public static int NCPU;
public static java_io_ObjectStreamField[] serialPersistentFields;
public java_util_concurrent_ConcurrentHashMap$Node[] table;
public java_util_concurrent_ConcurrentHashMap$Node[] nextTable;
public long baseCount;
public int sizeCtl;
public int transferIndex;
public int cellsBusy;
public java_util_concurrent_ConcurrentHashMap$CounterCell[] counterCells;
public Object keySet;
public java_util_concurrent_ConcurrentHashMap$ValuesView values;
public Object entrySet;
public static jdk_internal_misc_Unsafe U;
public static long SIZECTL;
public static long TRANSFERINDEX;
public static long BASECOUNT;
public static long CELLSBUSY;
public static long CELLVALUE;
public static int ABASE;
public static int ASHIFT;
}
class java_lang_Iterable extends Object {

}
class java_util_Collection extends Object {

}
class java_util_List extends Object {

}
class java_util_RandomAccess extends Object {

}
class java_util_AbstractCollection extends Object {

}
class java_util_AbstractList extends java_util_AbstractCollection {
public int modCount;
}
class java_util_ArrayList extends java_util_AbstractList {
public static long serialVersionUID;
public static int DEFAULT_CAPACITY;
public static Object[] EMPTY_ELEMENTDATA;
public static Object[] DEFAULTCAPACITY_EMPTY_ELEMENTDATA;
public Object[] elementData;
public int size;
}
class java_lang_StackTraceElement extends Object {
public java_lang_Class declaringClassObject;
public java_lang_String classLoaderName;
public java_lang_String moduleName;
public java_lang_String moduleVersion;
public java_lang_String declaringClass;
public java_lang_String methodName;
public java_lang_String fileName;
public int lineNumber;
public byte format;
public static byte BUILTIN_CLASS_LOADER;
public static byte JDK_NON_UPGRADEABLE_MODULE;
public static long serialVersionUID;
}
class java_nio_Buffer extends Object {
public static jdk_internal_misc_Unsafe UNSAFE;
public static jdk_internal_misc_ScopedMemoryAccess SCOPED_MEMORY_ACCESS;
public static int SPLITERATOR_CHARACTERISTICS;
public int mark;
public int position;
public int limit;
public int capacity;
public long address;
public Object segment;
public static boolean $assertionsDisabled;
}
class java_lang_StackWalker extends Object {
public static java_util_EnumSet DEFAULT_EMPTY_OPTION;
public static java_lang_StackWalker DEFAULT_WALKER;
public Object options;
public Object extendedOption;
public int estimateDepth;
public boolean retainClassRef;
}
class java_lang_StackStreamFactory$AbstractStackWalker extends Object {
public java_lang_StackWalker walker;
public java_lang_Thread thread;
public int maxDepth;
public long mode;
public int depth;
public Object frameBuffer;
public long anchor;
}
class java_lang_StackWalker$StackFrame extends Object {

}
class java_lang_StackFrameInfo extends Object {
public static Object JLIA;
public boolean retainClassRef;
public Object memberName;
public int bci;
public java_lang_StackTraceElement ste;
}
class java_lang_LiveStackFrame extends Object {

}
class java_lang_LiveStackFrameInfo extends java_lang_StackFrameInfo {
public static Object[] EMPTY_ARRAY;
public static int MODE_INTERPRETED;
public static int MODE_COMPILED;
public Object[] monitors;
public Object[] locals;
public Object[] operands;
public int mode;
}
class java_util_concurrent_locks_AbstractOwnableSynchronizer extends Object {
public static long serialVersionUID;
public java_lang_Thread exclusiveOwnerThread;
}
class java_lang_Boolean extends Object {
public static java_lang_Boolean TRUE;
public static java_lang_Boolean FALSE;
public static java_lang_Class TYPE;
public boolean value;
public static long serialVersionUID;
}
class java_lang_Character extends Object {
public static int MIN_RADIX;
public static int MAX_RADIX;
public static char MIN_VALUE;
public static char MAX_VALUE;
public static java_lang_Class TYPE;
public static byte UNASSIGNED;
public static byte UPPERCASE_LETTER;
public static byte LOWERCASE_LETTER;
public static byte TITLECASE_LETTER;
public static byte MODIFIER_LETTER;
public static byte OTHER_LETTER;
public static byte NON_SPACING_MARK;
public static byte ENCLOSING_MARK;
public static byte COMBINING_SPACING_MARK;
public static byte DECIMAL_DIGIT_NUMBER;
public static byte LETTER_NUMBER;
public static byte OTHER_NUMBER;
public static byte SPACE_SEPARATOR;
public static byte LINE_SEPARATOR;
public static byte PARAGRAPH_SEPARATOR;
public static byte CONTROL;
public static byte FORMAT;
public static byte PRIVATE_USE;
public static byte SURROGATE;
public static byte DASH_PUNCTUATION;
public static byte START_PUNCTUATION;
public static byte END_PUNCTUATION;
public static byte CONNECTOR_PUNCTUATION;
public static byte OTHER_PUNCTUATION;
public static byte MATH_SYMBOL;
public static byte CURRENCY_SYMBOL;
public static byte MODIFIER_SYMBOL;
public static byte OTHER_SYMBOL;
public static byte INITIAL_QUOTE_PUNCTUATION;
public static byte FINAL_QUOTE_PUNCTUATION;
public static int ERROR;
public static byte DIRECTIONALITY_UNDEFINED;
public static byte DIRECTIONALITY_LEFT_TO_RIGHT;
public static byte DIRECTIONALITY_RIGHT_TO_LEFT;
public static byte DIRECTIONALITY_RIGHT_TO_LEFT_ARABIC;
public static byte DIRECTIONALITY_EUROPEAN_NUMBER;
public static byte DIRECTIONALITY_EUROPEAN_NUMBER_SEPARATOR;
public static byte DIRECTIONALITY_EUROPEAN_NUMBER_TERMINATOR;
public static byte DIRECTIONALITY_ARABIC_NUMBER;
public static byte DIRECTIONALITY_COMMON_NUMBER_SEPARATOR;
public static byte DIRECTIONALITY_NONSPACING_MARK;
public static byte DIRECTIONALITY_BOUNDARY_NEUTRAL;
public static byte DIRECTIONALITY_PARAGRAPH_SEPARATOR;
public static byte DIRECTIONALITY_SEGMENT_SEPARATOR;
public static byte DIRECTIONALITY_WHITESPACE;
public static byte DIRECTIONALITY_OTHER_NEUTRALS;
public static byte DIRECTIONALITY_LEFT_TO_RIGHT_EMBEDDING;
public static byte DIRECTIONALITY_LEFT_TO_RIGHT_OVERRIDE;
public static byte DIRECTIONALITY_RIGHT_TO_LEFT_EMBEDDING;
public static byte DIRECTIONALITY_RIGHT_TO_LEFT_OVERRIDE;
public static byte DIRECTIONALITY_POP_DIRECTIONAL_FORMAT;
public static byte DIRECTIONALITY_LEFT_TO_RIGHT_ISOLATE;
public static byte DIRECTIONALITY_RIGHT_TO_LEFT_ISOLATE;
public static byte DIRECTIONALITY_FIRST_STRONG_ISOLATE;
public static byte DIRECTIONALITY_POP_DIRECTIONAL_ISOLATE;
public static char MIN_HIGH_SURROGATE;
public static char MAX_HIGH_SURROGATE;
public static char MIN_LOW_SURROGATE;
public static char MAX_LOW_SURROGATE;
public static char MIN_SURROGATE;
public static char MAX_SURROGATE;
public static int MIN_SUPPLEMENTARY_CODE_POINT;
public static int MIN_CODE_POINT;
public static int MAX_CODE_POINT;
public char value;
public static long serialVersionUID;
public static int SIZE;
public static int BYTES;
public static boolean $assertionsDisabled;
}
class java_lang_Number extends Object {
public static long serialVersionUID;
}
class java_lang_Float extends java_lang_Number {
public static float POSITIVE_INFINITY;
public static float NEGATIVE_INFINITY;
public static float NaN;
public static float MAX_VALUE;
public static float MIN_NORMAL;
public static float MIN_VALUE;
public static int MAX_EXPONENT;
public static int MIN_EXPONENT;
public static int SIZE;
public static int BYTES;
public static java_lang_Class TYPE;
public float value;
public static long serialVersionUID;
}
class java_lang_Double extends java_lang_Number {
public static double POSITIVE_INFINITY;
public static double NEGATIVE_INFINITY;
public static double NaN;
public static double MAX_VALUE;
public static double MIN_NORMAL;
public static double MIN_VALUE;
public static int MAX_EXPONENT;
public static int MIN_EXPONENT;
public static int SIZE;
public static int BYTES;
public static java_lang_Class TYPE;
public double value;
public static long serialVersionUID;
}
class java_lang_Byte extends java_lang_Number {
public static byte MIN_VALUE;
public static byte MAX_VALUE;
public static java_lang_Class TYPE;
public byte value;
public static int SIZE;
public static int BYTES;
public static long serialVersionUID;
}
class java_lang_Short extends java_lang_Number {
public static short MIN_VALUE;
public static short MAX_VALUE;
public static java_lang_Class TYPE;
public short value;
public static int SIZE;
public static int BYTES;
public static long serialVersionUID;
}
class java_lang_Integer extends java_lang_Number {
public static int MIN_VALUE;
public static int MAX_VALUE;
public static java_lang_Class TYPE;
public static char[] digits;
public static byte[] DigitTens;
public static byte[] DigitOnes;
public static int[] sizeTable;
public int value;
public static int SIZE;
public static int BYTES;
public static long serialVersionUID;
}
class java_lang_Long extends java_lang_Number {
public static long MIN_VALUE;
public static long MAX_VALUE;
public static java_lang_Class TYPE;
public long value;
public static int SIZE;
public static int BYTES;
public static long serialVersionUID;
}
class java_util_Iterator extends Object {

}
class java_lang_reflect_RecordComponent extends Object {
public java_lang_Class clazz;
public java_lang_String name;
public java_lang_Class type;
public java_lang_reflect_Method accessor;
public java_lang_String signature;
public Object genericInfo;
public byte[] annotations;
public byte[] typeAnnotations;
public java_lang_reflect_RecordComponent root;
public Object declaredAnnotations;
}
class jdk_internal_vm_vector_VectorSupport extends Object {
public static jdk_internal_misc_Unsafe U;
public static int VECTOR_OP_ABS;
public static int VECTOR_OP_NEG;
public static int VECTOR_OP_SQRT;
public static int VECTOR_OP_ADD;
public static int VECTOR_OP_SUB;
public static int VECTOR_OP_MUL;
public static int VECTOR_OP_DIV;
public static int VECTOR_OP_MIN;
public static int VECTOR_OP_MAX;
public static int VECTOR_OP_AND;
public static int VECTOR_OP_OR;
public static int VECTOR_OP_XOR;
public static int VECTOR_OP_FMA;
public static int VECTOR_OP_LSHIFT;
public static int VECTOR_OP_RSHIFT;
public static int VECTOR_OP_URSHIFT;
public static int VECTOR_OP_CAST;
public static int VECTOR_OP_REINTERPRET;
public static int VECTOR_OP_MASK_TRUECOUNT;
public static int VECTOR_OP_MASK_FIRSTTRUE;
public static int VECTOR_OP_MASK_LASTTRUE;
public static int VECTOR_OP_TAN;
public static int VECTOR_OP_TANH;
public static int VECTOR_OP_SIN;
public static int VECTOR_OP_SINH;
public static int VECTOR_OP_COS;
public static int VECTOR_OP_COSH;
public static int VECTOR_OP_ASIN;
public static int VECTOR_OP_ACOS;
public static int VECTOR_OP_ATAN;
public static int VECTOR_OP_ATAN2;
public static int VECTOR_OP_CBRT;
public static int VECTOR_OP_LOG;
public static int VECTOR_OP_LOG10;
public static int VECTOR_OP_LOG1P;
public static int VECTOR_OP_POW;
public static int VECTOR_OP_EXP;
public static int VECTOR_OP_EXPM1;
public static int VECTOR_OP_HYPOT;
public static int BT_eq;
public static int BT_ne;
public static int BT_le;
public static int BT_ge;
public static int BT_lt;
public static int BT_gt;
public static int BT_overflow;
public static int BT_no_overflow;
public static int BT_unsigned_compare;
public static int BT_ule;
public static int BT_uge;
public static int BT_ult;
public static int BT_ugt;
public static int T_FLOAT;
public static int T_DOUBLE;
public static int T_BYTE;
public static int T_SHORT;
public static int T_INT;
public static int T_LONG;
public static boolean $assertionsDisabled;
}
class jdk_internal_vm_vector_VectorSupport$VectorPayload extends Object {
public Object payload;
}
class jdk_internal_vm_vector_VectorSupport$Vector extends jdk_internal_vm_vector_VectorSupport$VectorPayload {

}
class jdk_internal_vm_vector_VectorSupport$VectorMask extends jdk_internal_vm_vector_VectorSupport$VectorPayload {

}
class jdk_internal_vm_vector_VectorSupport$VectorShuffle extends jdk_internal_vm_vector_VectorSupport$VectorPayload {

}
class java_lang_NullPointerException extends java_lang_RuntimeException {
public static long serialVersionUID;
public int extendedMessageState;
public java_lang_String extendedMessage;
}
class java_lang_ArithmeticException extends java_lang_RuntimeException {
public static long serialVersionUID;
}
class java_io_ObjectStreamField extends Object {
public java_lang_String name;
public java_lang_String signature;
public java_lang_Class type;
public java_lang_String typeSignature;
public boolean unshared;
public java_lang_reflect_Field field;
public int offset;
}
class java_util_Comparator extends Object {

}
class java_lang_String$CaseInsensitiveComparator extends Object {
public static long serialVersionUID;
}
class java_lang_Module$ArchivedData extends Object {
public static java_lang_Module$ArchivedData archivedData;
public java_lang_Module allUnnamedModule;
public Object allUnnamedModules;
public java_lang_Module everyoneModule;
public Object everyoneSet;
}
class jdk_internal_misc_CDS extends Object {
public static boolean isDumpingClassList;
public static boolean isDumpingArchive;
public static boolean isSharingEnabled;
public static java_lang_String DIRECT_HOLDER_CLASS_NAME;
public static java_lang_String DELEGATING_HOLDER_CLASS_NAME;
public static java_lang_String BASIC_FORMS_HOLDER_CLASS_NAME;
public static java_lang_String INVOKERS_HOLDER_CLASS_NAME;
public static java_lang_String[] excludeFlags;
}
class java_util_Set extends Object {

}
class java_util_ImmutableCollections$AbstractImmutableCollection extends java_util_AbstractCollection {

}
class java_util_ImmutableCollections$AbstractImmutableSet extends java_util_ImmutableCollections$AbstractImmutableCollection {

}
class java_util_ImmutableCollections$Set12 extends java_util_ImmutableCollections$AbstractImmutableSet {
public Object e0;
public Object e1;
}
class java_util_Objects extends Object {

}
class java_util_ImmutableCollections extends Object {
public static long SALT32L;
public static boolean REVERSE;
public static Object[] archivedObjects;
public static Object EMPTY;
public static java_util_ImmutableCollections$ListN EMPTY_LIST;
public static java_util_ImmutableCollections$ListN EMPTY_LIST_NULLS;
public static java_util_ImmutableCollections$SetN EMPTY_SET;
public static java_util_ImmutableCollections$MapN EMPTY_MAP;
public static int EXPAND_FACTOR;
public static boolean $assertionsDisabled;
}
class java_util_ImmutableCollections$AbstractImmutableList extends java_util_ImmutableCollections$AbstractImmutableCollection {

}
class java_util_ImmutableCollections$ListN extends java_util_ImmutableCollections$AbstractImmutableList {
public Object[] elements;
public boolean allowNulls;
}
class java_util_ImmutableCollections$SetN extends java_util_ImmutableCollections$AbstractImmutableSet {
public Object[] elements;
public int size;
}
class java_util_ImmutableCollections$AbstractImmutableMap extends java_util_AbstractMap {

}
class java_util_ImmutableCollections$MapN extends java_util_ImmutableCollections$AbstractImmutableMap {
public Object[] table;
public int size;
}
class jdk_internal_access_JavaLangReflectAccess extends Object {

}
class java_lang_reflect_ReflectAccess extends Object {

}
class jdk_internal_access_SharedSecrets extends Object {
public static java_lang_invoke_MethodHandles$Lookup lookup;
public static Object javaAWTAccess;
public static Object javaAWTFontAccess;
public static Object javaBeansAccess;
public static Object javaLangAccess;
public static Object javaLangInvokeAccess;
public static Object javaLangModuleAccess;
public static Object javaLangRefAccess;
public static Object javaLangReflectAccess;
public static Object javaIOAccess;
public static Object javaIOFileDescriptorAccess;
public static Object javaIOFilePermissionAccess;
public static Object javaIORandomAccessFileAccess;
public static Object javaObjectInputStreamReadString;
public static Object javaObjectInputStreamAccess;
public static Object javaObjectInputFilterAccess;
public static Object javaNetInetAddressAccess;
public static Object javaNetHttpCookieAccess;
public static Object javaNetUriAccess;
public static Object javaNetURLAccess;
public static Object javaNioAccess;
public static Object javaUtilCollectionAccess;
public static Object javaUtilJarAccess;
public static Object javaUtilZipFileAccess;
public static Object javaUtilResourceBundleAccess;
public static Object javaSecurityAccess;
public static Object javaSecuritySignatureAccess;
public static Object javaSecuritySpecAccess;
public static Object javaxCryptoSealedObjectAccess;
public static Object javaxCryptoSpecAccess;
}
class java_lang_invoke_MethodHandles extends Object {
public static java_lang_invoke_MemberName$Factory IMPL_NAMES;
public static java_security_Permission ACCESS_PERMISSION;
public static java_lang_invoke_MethodHandle[] IDENTITY_MHS;
public static java_lang_invoke_MethodHandle[] ZERO_MHS;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_MemberName$Factory extends Object {
public static java_lang_invoke_MemberName$Factory INSTANCE;
public static int ALLOWED_FLAGS;
public static boolean $assertionsDisabled;
}
class java_security_Guard extends Object {

}
class java_security_Permission extends Object {
public static long serialVersionUID;
public java_lang_String name;
}
class java_security_BasicPermission extends java_security_Permission {
public static long serialVersionUID;
public boolean wildcard;
public java_lang_String path;
public boolean exitVM;
}
class java_lang_reflect_ReflectPermission extends java_security_BasicPermission {
public static long serialVersionUID;
}
class java_lang_StringLatin1 extends Object {
public static boolean $assertionsDisabled;
}
class java_lang_invoke_MethodHandles$Lookup extends Object {
public java_lang_Class lookupClass;
public java_lang_Class prevLookupClass;
public int allowedModes;
public static int PUBLIC;
public static int PRIVATE;
public static int PROTECTED;
public static int PACKAGE;
public static int MODULE;
public static int UNCONDITIONAL;
public static int ORIGINAL;
public static int ALL_MODES;
public static int FULL_POWER_MODES;
public static int TRUSTED;
public java_security_ProtectionDomain cachedProtectionDomain;
public static java_lang_invoke_MethodHandles$Lookup IMPL_LOOKUP;
public static java_lang_invoke_MethodHandles$Lookup PUBLIC_LOOKUP;
public static java_util_concurrent_ConcurrentHashMap LOOKASIDE_TABLE;
public static boolean $assertionsDisabled;
}
class jdk_internal_reflect_Reflection extends Object {
public static Object fieldFilterMap;
public static Object methodFilterMap;
public static java_lang_String WILDCARD;
public static Object ALL_MEMBERS;
}
class java_lang_Math extends Object {
public static double E;
public static double PI;
public static double DEGREES_TO_RADIANS;
public static double RADIANS_TO_DEGREES;
public static long negativeZeroFloatBits;
public static long negativeZeroDoubleBits;
public static double twoToTheDoubleScaleUp;
public static double twoToTheDoubleScaleDown;
public static boolean $assertionsDisabled;
}
class java_util_HashMap extends java_util_AbstractMap {
public static long serialVersionUID;
public static int DEFAULT_INITIAL_CAPACITY;
public static int MAXIMUM_CAPACITY;
public static float DEFAULT_LOAD_FACTOR;
public static int TREEIFY_THRESHOLD;
public static int UNTREEIFY_THRESHOLD;
public static int MIN_TREEIFY_CAPACITY;
public java_util_HashMap$Node[] table;
public Object entrySet;
public int size;
public int modCount;
public int threshold;
public float loadFactor;
}
class java_util_AbstractSet extends java_util_AbstractCollection {

}
class java_util_ImmutableCollections$MapN$1 extends java_util_AbstractSet {
public java_util_ImmutableCollections$MapN this$0;
}
class java_util_ImmutableCollections$MapN$MapNIterator extends Object {
public int remaining;
public int idx;
public java_util_ImmutableCollections$MapN this$0;
}
class java_util_Map$Entry extends Object {

}
class java_util_KeyValueHolder extends Object {
public Object key;
public Object value;
}
class java_util_HashMap$Node extends Object {
public int hash;
public Object key;
public Object value;
public java_util_HashMap$Node next;
}
class java_util_LinkedHashMap$Entry extends java_util_HashMap$Node {
public java_util_LinkedHashMap$Entry before;
public java_util_LinkedHashMap$Entry after;
}
class java_util_HashMap$TreeNode extends java_util_LinkedHashMap$Entry {
public java_util_HashMap$TreeNode parent;
public java_util_HashMap$TreeNode left;
public java_util_HashMap$TreeNode right;
public java_util_HashMap$TreeNode prev;
public boolean red;
public static boolean $assertionsDisabled;
}
class java_lang_Runtime extends Object {
public static java_lang_Runtime currentRuntime;
public static java_lang_Runtime$Version version;
}
class java_util_concurrent_locks_Lock extends Object {

}
class java_util_concurrent_locks_ReentrantLock extends Object {
public static long serialVersionUID;
public Object sync;
}
class java_util_concurrent_ConcurrentHashMap$Segment extends java_util_concurrent_locks_ReentrantLock {
public static long serialVersionUID;
public float loadFactor;
}
class java_util_concurrent_ConcurrentHashMap$CounterCell extends Object {
public long value;
}
class java_util_concurrent_ConcurrentHashMap$Node extends Object {
public int hash;
public Object key;
public Object val;
public java_util_concurrent_ConcurrentHashMap$Node next;
}
class java_util_concurrent_locks_LockSupport extends Object {
public static jdk_internal_misc_Unsafe U;
public static long PARKBLOCKER;
public static long TID;
}
class java_util_concurrent_ConcurrentHashMap$ReservationNode extends java_util_concurrent_ConcurrentHashMap$Node {

}
class java_security_PrivilegedAction extends Object {

}
class jdk_internal_reflect_ReflectionFactory$GetReflectionFactoryAction extends Object {

}
class jdk_internal_reflect_ReflectionFactory extends Object {
public static boolean initted;
public static jdk_internal_reflect_ReflectionFactory soleInstance;
public static java_lang_reflect_Method hasStaticInitializerMethod;
public static boolean noInflation;
public static int inflationThreshold;
public static boolean disableSerialConstructorChecks;
public Object langReflectAccess;
public static boolean $assertionsDisabled;
}
class java_lang_ref_Reference$ReferenceHandler extends java_lang_Thread {

}
class jdk_internal_ref_Cleaner extends java_lang_ref_PhantomReference {
public static java_lang_ref_ReferenceQueue dummyQueue;
public static jdk_internal_ref_Cleaner first;
public jdk_internal_ref_Cleaner next;
public jdk_internal_ref_Cleaner prev;
public Object thunk;
}
class java_lang_ref_ReferenceQueue extends Object {
public static java_lang_ref_ReferenceQueue NULL;
public static java_lang_ref_ReferenceQueue ENQUEUED;
public java_lang_ref_ReferenceQueue$Lock lock;
public java_lang_ref_Reference head;
public long queueLength;
public static boolean $assertionsDisabled;
}
class java_lang_ref_ReferenceQueue$Null extends java_lang_ref_ReferenceQueue {

}
class java_lang_ref_ReferenceQueue$Lock extends Object {

}
class jdk_internal_access_JavaLangRefAccess extends Object {

}
class java_lang_ref_Reference$1 extends Object {

}
class java_lang_ref_Finalizer$FinalizerThread extends java_lang_Thread {
public boolean running;
}
class jdk_internal_access_JavaLangAccess extends Object {

}
class jdk_internal_misc_VM extends Object {
public static int JAVA_LANG_SYSTEM_INITED;
public static int MODULE_SYSTEM_INITED;
public static int SYSTEM_LOADER_INITIALIZING;
public static int SYSTEM_BOOTED;
public static int SYSTEM_SHUTDOWN;
public static int initLevel;
public static Object lock;
public static long directMemory;
public static boolean pageAlignDirectMemory;
public static int classFileMajorVersion;
public static int classFileMinorVersion;
public static int PREVIEW_MINOR_VERSION;
public static Object savedProps;
public static int finalRefCount;
public static int peakFinalRefCount;
public static int JVMTI_THREAD_STATE_ALIVE;
public static int JVMTI_THREAD_STATE_TERMINATED;
public static int JVMTI_THREAD_STATE_RUNNABLE;
public static int JVMTI_THREAD_STATE_BLOCKED_ON_MONITOR_ENTER;
public static int JVMTI_THREAD_STATE_WAITING_INDEFINITELY;
public static int JVMTI_THREAD_STATE_WAITING_WITH_TIMEOUT;
}
class java_lang_System$2 extends Object {

}
class jdk_internal_util_SystemProps extends Object {
public static boolean $assertionsDisabled;
}
class jdk_internal_util_SystemProps$Raw extends Object {
public static int _display_country_NDX;
public static int _display_language_NDX;
public static int _display_script_NDX;
public static int _display_variant_NDX;
public static int _file_encoding_NDX;
public static int _file_separator_NDX;
public static int _format_country_NDX;
public static int _format_language_NDX;
public static int _format_script_NDX;
public static int _format_variant_NDX;
public static int _ftp_nonProxyHosts_NDX;
public static int _ftp_proxyHost_NDX;
public static int _ftp_proxyPort_NDX;
public static int _http_nonProxyHosts_NDX;
public static int _http_proxyHost_NDX;
public static int _http_proxyPort_NDX;
public static int _https_proxyHost_NDX;
public static int _https_proxyPort_NDX;
public static int _java_io_tmpdir_NDX;
public static int _line_separator_NDX;
public static int _os_arch_NDX;
public static int _os_name_NDX;
public static int _os_version_NDX;
public static int _path_separator_NDX;
public static int _socksNonProxyHosts_NDX;
public static int _socksProxyHost_NDX;
public static int _socksProxyPort_NDX;
public static int _sun_arch_abi_NDX;
public static int _sun_arch_data_model_NDX;
public static int _sun_cpu_endian_NDX;
public static int _sun_cpu_isalist_NDX;
public static int _sun_io_unicode_encoding_NDX;
public static int _sun_jnu_encoding_NDX;
public static int _sun_os_patch_level_NDX;
public static int _sun_stderr_encoding_NDX;
public static int _sun_stdout_encoding_NDX;
public static int _user_dir_NDX;
public static int _user_home_NDX;
public static int _user_name_NDX;
public static int FIXED_LENGTH;
public java_lang_String[] platformProps;
}
class java_lang_StringConcatHelper extends Object {
public static long LATIN1;
public static long UTF16;
public static jdk_internal_misc_Unsafe UNSAFE;
}
class java_lang_VersionProps extends Object {
public static java_lang_String launcher_name;
public static java_lang_String java_version;
public static java_lang_String java_version_date;
public static java_lang_String java_runtime_name;
public static java_lang_String java_runtime_version;
public static java_lang_String VERSION_NUMBER;
public static java_lang_String VERSION_SPECIFICATION;
public static java_lang_String VERSION_BUILD;
public static java_lang_String VERSION_PRE;
public static java_lang_String VERSION_OPT;
public static boolean isLTS;
public static java_lang_String CLASSFILE_MAJOR_MINOR;
public static java_lang_String VENDOR;
public static java_lang_String VENDOR_URL;
public static java_lang_String VENDOR_VERSION;
public static java_lang_String VENDOR_URL_BUG;
public static java_lang_String VENDOR_URL_VM_BUG;
}
class java_util_Arrays extends Object {
public static int MIN_ARRAY_SORT_GRAN;
public static int INSERTIONSORT_THRESHOLD;
public static boolean $assertionsDisabled;
}
class java_lang_CharacterData extends Object {

}
class java_lang_CharacterDataLatin1 extends java_lang_CharacterData {
public static byte[] DIGITS;
public static char[] sharpsMap;
public static java_lang_CharacterDataLatin1 instance;
public static int[] A;
public static byte[] B;
}
class java_lang_Integer$IntegerCache extends Object {
public static int low;
public static int high;
public static java_lang_Integer[] cache;
public static java_lang_Integer[] archivedCache;
public static boolean $assertionsDisabled;
}
class java_util_HashMap$EntrySet extends java_util_AbstractSet {
public java_util_HashMap this$0;
}
class java_util_HashMap$HashIterator extends Object {
public java_util_HashMap$Node next;
public java_util_HashMap$Node current;
public int expectedModCount;
public int index;
public java_util_HashMap this$0;
}
class java_util_HashMap$EntryIterator extends java_util_HashMap$HashIterator {
public java_util_HashMap this$0;
}
class jdk_internal_util_StaticProperty extends Object {
public static java_lang_String JAVA_HOME;
public static java_lang_String USER_HOME;
public static java_lang_String USER_DIR;
public static java_lang_String USER_NAME;
public static java_lang_String JAVA_LIBRARY_PATH;
public static java_lang_String SUN_BOOT_LIBRARY_PATH;
public static java_lang_String JDK_SERIAL_FILTER;
public static java_lang_String JDK_SERIAL_FILTER_FACTORY;
public static java_lang_String JAVA_IO_TMPDIR;
public static java_lang_String NATIVE_ENCODING;
}
class java_io_FileInputStream extends java_io_InputStream {
public static int DEFAULT_BUFFER_SIZE;
public java_io_FileDescriptor fd;
public java_lang_String path;
public java_nio_channels_FileChannel channel;
public Object closeLock;
public boolean closed;
}
class java_io_FileDescriptor extends Object {
public int fd;
public long handle;
public Object parent;
public Object otherParents;
public boolean closed;
public boolean append;
public jdk_internal_ref_PhantomCleanable cleanup;
public static java_io_FileDescriptor in;
public static java_io_FileDescriptor out;
public static java_io_FileDescriptor err;
}
class jdk_internal_access_JavaIOFileDescriptorAccess extends Object {

}
class java_io_FileDescriptor$1 extends Object {

}
class java_io_Flushable extends Object {

}
class java_io_OutputStream extends Object {

}
class java_io_FileOutputStream extends java_io_OutputStream {
public static Object fdAccess;
public java_io_FileDescriptor fd;
public java_nio_channels_FileChannel channel;
public java_lang_String path;
public Object closeLock;
public boolean closed;
}
class java_io_FilterInputStream extends java_io_InputStream {
public java_io_InputStream in;
}
class java_io_BufferedInputStream extends java_io_FilterInputStream {
public static int DEFAULT_BUFFER_SIZE;
public static jdk_internal_misc_Unsafe U;
public static long BUF_OFFSET;
public byte[] buf;
public int count;
public int pos;
public int markpos;
public int marklimit;
}
class java_io_FilterOutputStream extends java_io_OutputStream {
public java_io_OutputStream out;
public boolean closed;
public Object closeLock;
}
class java_io_PrintStream extends java_io_FilterOutputStream {
public boolean autoFlush;
public boolean trouble;
public Object formatter;
public java_io_BufferedWriter textOut;
public java_io_OutputStreamWriter charOut;
public boolean closing;
}
class java_io_BufferedOutputStream extends java_io_FilterOutputStream {
public byte[] buf;
public int count;
}
class java_nio_charset_Charset extends Object {
public static java_nio_charset_spi_CharsetProvider standardProvider;
public static java_lang_String[] zeroAliases;
public static Object[] cache1;
public static Object[] cache2;
public static java_lang_ThreadLocal gate;
public static java_nio_charset_Charset defaultCharset;
public java_lang_String name;
public java_lang_String[] aliases;
public Object aliasSet;
}
class java_nio_charset_spi_CharsetProvider extends Object {

}
class sun_nio_cs_StandardCharsets extends java_nio_charset_spi_CharsetProvider {
public static java_lang_String[] aliases_SJIS;
public static java_lang_String[] aliases_MS932;
public Object classMap;
public Object aliasMap;
public Object cache;
public static java_lang_String packagePrefix;
}
class java_lang_ThreadLocal extends Object {
public int threadLocalHashCode;
public static java_util_concurrent_atomic_AtomicInteger nextHashCode;
public static int HASH_INCREMENT;
}
class java_util_concurrent_atomic_AtomicInteger extends java_lang_Number {
public static long serialVersionUID;
public static jdk_internal_misc_Unsafe U;
public static long VALUE;
public int value;
}
class sun_nio_cs_HistoricallyNamedCharset extends Object {

}
class sun_nio_cs_Unicode extends java_nio_charset_Charset {

}
class sun_nio_cs_UTF_8 extends sun_nio_cs_Unicode {
public static sun_nio_cs_UTF_8 INSTANCE;
}
class java_io_Writer extends Object {
public char[] writeBuffer;
public static int WRITE_BUFFER_SIZE;
public Object lock;
}
class java_io_OutputStreamWriter extends java_io_Writer {
public sun_nio_cs_StreamEncoder se;
}
class sun_nio_cs_StreamEncoder extends java_io_Writer {
public static int DEFAULT_BYTE_BUFFER_SIZE;
public boolean closed;
public java_nio_charset_Charset cs;
public java_nio_charset_CharsetEncoder encoder;
public java_nio_ByteBuffer bb;
public java_io_OutputStream out;
public Object ch;
public boolean haveLeftoverChar;
public char leftoverChar;
public Object lcb;
public static boolean $assertionsDisabled;
}
class java_nio_charset_CharsetEncoder extends Object {
public java_nio_charset_Charset charset;
public float averageBytesPerChar;
public float maxBytesPerChar;
public byte[] replacement;
public java_nio_charset_CodingErrorAction malformedInputAction;
public java_nio_charset_CodingErrorAction unmappableCharacterAction;
public static int ST_RESET;
public static int ST_CODING;
public static int ST_END;
public static int ST_FLUSHED;
public int state;
public static java_lang_String[] stateNames;
public java_lang_ref_WeakReference cachedDecoder;
public static boolean $assertionsDisabled;
}
class sun_nio_cs_UTF_8$Encoder extends java_nio_charset_CharsetEncoder {
public Object sgp;
}
class java_nio_charset_CodingErrorAction extends Object {
public java_lang_String name;
public static java_nio_charset_CodingErrorAction IGNORE;
public static java_nio_charset_CodingErrorAction REPLACE;
public static java_nio_charset_CodingErrorAction REPORT;
}
class java_nio_ByteBuffer extends java_nio_Buffer {
public static long ARRAY_BASE_OFFSET;
public byte[] hb;
public int offset;
public boolean isReadOnly;
public boolean bigEndian;
public boolean nativeByteOrder;
public static boolean $assertionsDisabled;
}
class jdk_internal_misc_ScopedMemoryAccess extends Object {
public static jdk_internal_misc_Unsafe UNSAFE;
public static jdk_internal_misc_ScopedMemoryAccess theScopedMemoryAccess;
}
class jdk_internal_access_JavaNioAccess extends Object {

}
class java_nio_Buffer$1 extends Object {

}
class java_nio_HeapByteBuffer extends java_nio_ByteBuffer {
public static long ARRAY_BASE_OFFSET;
public static long ARRAY_INDEX_SCALE;
public static boolean $assertionsDisabled;
}
class java_nio_ByteOrder extends Object {
public java_lang_String name;
public static java_nio_ByteOrder BIG_ENDIAN;
public static java_nio_ByteOrder LITTLE_ENDIAN;
public static java_nio_ByteOrder NATIVE_ORDER;
}
class java_io_BufferedWriter extends java_io_Writer {
public java_io_Writer out;
public char[] cb;
public int nChars;
public int nextChar;
public static int defaultCharBufferSize;
}
class java_lang_Terminator extends Object {
public static Object handler;
}
class jdk_internal_misc_Signal$Handler extends Object {
public static Object SIG_DFL;
public static Object SIG_IGN;
}
class java_lang_Terminator$1 extends Object {
public static Object SIG_DFL;
public static Object SIG_IGN;
}
class jdk_internal_misc_Signal extends Object {
public static java_util_Hashtable handlers;
public static java_util_Hashtable signals;
public int number;
public java_lang_String name;
}
class java_util_Hashtable$Entry extends Object {
public int hash;
public Object key;
public Object value;
public java_util_Hashtable$Entry next;
}
class jdk_internal_misc_Signal$NativeHandler extends Object {
public long handler;
public static Object SIG_DFL;
public static Object SIG_IGN;
}
class jdk_internal_misc_OSEnvironment extends Object {

}
class java_util_Collections extends Object {
public static int BINARYSEARCH_THRESHOLD;
public static int REVERSE_THRESHOLD;
public static int SHUFFLE_THRESHOLD;
public static int FILL_THRESHOLD;
public static int ROTATE_THRESHOLD;
public static int COPY_THRESHOLD;
public static int REPLACEALL_THRESHOLD;
public static int INDEXOFSUBLIST_THRESHOLD;
public static Object r;
public static Object EMPTY_SET;
public static Object EMPTY_LIST;
public static Object EMPTY_MAP;
}
class java_util_Collections$EmptySet extends java_util_AbstractSet {
public static long serialVersionUID;
}
class java_util_Collections$EmptyList extends java_util_AbstractList {
public static long serialVersionUID;
}
class java_util_Collections$EmptyMap extends java_util_AbstractMap {
public static long serialVersionUID;
}
class java_lang_IllegalArgumentException extends java_lang_RuntimeException {
public static long serialVersionUID;
}
class java_lang_invoke_MethodHandleStatics extends Object {
public static jdk_internal_misc_Unsafe UNSAFE;
public static boolean DEBUG_METHOD_HANDLE_NAMES;
public static boolean DUMP_CLASS_FILES;
public static boolean TRACE_INTERPRETER;
public static boolean TRACE_METHOD_LINKAGE;
public static boolean TRACE_RESOLVE;
public static int COMPILE_THRESHOLD;
public static boolean LOG_LF_COMPILATION_FAILURE;
public static int DONT_INLINE_THRESHOLD;
public static int PROFILE_LEVEL;
public static boolean PROFILE_GWT;
public static int CUSTOMIZE_THRESHOLD;
public static boolean VAR_HANDLE_GUARDS;
public static int MAX_ARITY;
public static boolean VAR_HANDLE_IDENTITY_ADAPT;
}
class sun_security_action_GetPropertyAction extends Object {
public java_lang_String theProp;
public java_lang_String defaultVal;
}
class jdk_internal_module_ModuleBootstrap extends Object {
public static java_lang_String JAVA_BASE;
public static java_lang_String ALL_DEFAULT;
public static java_lang_String ALL_UNNAMED;
public static java_lang_String ALL_SYSTEM;
public static java_lang_String ALL_MODULE_PATH;
public static Object JLA;
public static Object JLMA;
public static jdk_internal_module_ModulePatcher patcher;
public static Object unlimitedFinder;
public static Object limitedFinder;
public static java_lang_String ADD_MODULES;
public static java_lang_String ADD_EXPORTS;
public static java_lang_String ADD_OPENS;
public static java_lang_String ADD_READS;
public static java_lang_String PATCH_MODULE;
public static java_lang_String ENABLE_NATIVE_ACCESS;
public static boolean $assertionsDisabled;
}
class java_lang_module_ModuleDescriptor extends Object {
public java_lang_String name;
public Object version;
public java_lang_String rawVersionString;
public Object modifiers;
public boolean open;
public boolean automatic;
public Object requires;
public Object exports;
public Object opens;
public Object uses;
public Object provides;
public Object packages;
public java_lang_String mainClass;
public int hash;
public static boolean $assertionsDisabled;
}
class sun_invoke_util_VerifyAccess extends Object {
public static int UNCONDITIONAL_ALLOWED;
public static int ORIGINAL_ALLOWED;
public static int MODULE_ALLOWED;
public static int PACKAGE_ONLY;
public static int PACKAGE_ALLOWED;
public static int PROTECTED_OR_PACKAGE_ALLOWED;
public static int ALL_ACCESS_MODES;
public static boolean $assertionsDisabled;
}
class java_lang_reflect_Modifier extends Object {
public static int PUBLIC;
public static int PRIVATE;
public static int PROTECTED;
public static int STATIC;
public static int FINAL;
public static int SYNCHRONIZED;
public static int VOLATILE;
public static int TRANSIENT;
public static int NATIVE;
public static int INTERFACE;
public static int ABSTRACT;
public static int STRICT;
public static int BRIDGE;
public static int VARARGS;
public static int SYNTHETIC;
public static int ANNOTATION;
public static int ENUM;
public static int MANDATED;
public static int CLASS_MODIFIERS;
public static int INTERFACE_MODIFIERS;
public static int CONSTRUCTOR_MODIFIERS;
public static int METHOD_MODIFIERS;
public static int FIELD_MODIFIERS;
public static int PARAMETER_MODIFIERS;
public static int ACCESS_MODIFIERS;
}
class jdk_internal_access_JavaLangModuleAccess extends Object {

}
class java_lang_module_ModuleDescriptor$1 extends Object {

}
class java_io_File extends Object {
public static java_io_FileSystem fs;
public java_lang_String path;
public java_io_File$PathStatus status;
public int prefixLength;
public static char separatorChar;
public static java_lang_String separator;
public static char pathSeparatorChar;
public static java_lang_String pathSeparator;
public static jdk_internal_misc_Unsafe UNSAFE;
public static long PATH_OFFSET;
public static long PREFIX_LENGTH_OFFSET;
public static long serialVersionUID;
public Object filePath;
public static boolean $assertionsDisabled;
}
class java_io_DefaultFileSystem extends Object {

}
class java_io_FileSystem extends Object {
public static int BA_EXISTS;
public static int BA_REGULAR;
public static int BA_DIRECTORY;
public static int BA_HIDDEN;
public static int ACCESS_READ;
public static int ACCESS_WRITE;
public static int ACCESS_EXECUTE;
public static int SPACE_TOTAL;
public static int SPACE_FREE;
public static int SPACE_USABLE;
public static boolean useCanonCaches;
public static boolean useCanonPrefixCache;
}
class java_io_UnixFileSystem extends java_io_FileSystem {
public char slash;
public char colon;
public java_lang_String javaHome;
public java_lang_String userDir;
public Object cache;
public Object javaHomePrefixCache;
}
class jdk_internal_util_ArraysSupport extends Object {
public static jdk_internal_misc_Unsafe U;
public static boolean BIG_ENDIAN;
public static int LOG2_ARRAY_BOOLEAN_INDEX_SCALE;
public static int LOG2_ARRAY_BYTE_INDEX_SCALE;
public static int LOG2_ARRAY_CHAR_INDEX_SCALE;
public static int LOG2_ARRAY_SHORT_INDEX_SCALE;
public static int LOG2_ARRAY_INT_INDEX_SCALE;
public static int LOG2_ARRAY_LONG_INDEX_SCALE;
public static int LOG2_ARRAY_FLOAT_INDEX_SCALE;
public static int LOG2_ARRAY_DOUBLE_INDEX_SCALE;
public static int LOG2_BYTE_BIT_SIZE;
public static int SOFT_MAX_ARRAY_LENGTH;
}
class jdk_internal_module_ModulePatcher extends Object {
public static Object JLMA;
public Object map;
}
class jdk_internal_module_ModuleBootstrap$Counters extends Object {
public static boolean PUBLISH_COUNTERS;
public static boolean PRINT_COUNTERS;
public static Object counters;
public static long startTime;
public static long previousTime;
}
class jdk_internal_module_ArchivedBootLayer extends Object {
public static jdk_internal_module_ArchivedBootLayer archivedBootLayer;
public java_lang_ModuleLayer bootLayer;
}
class jdk_internal_module_ArchivedModuleGraph extends Object {
public static jdk_internal_module_ArchivedModuleGraph archivedModuleGraph;
public boolean hasSplitPackages;
public boolean hasIncubatorModules;
public Object finder;
public java_lang_module_Configuration configuration;
public Object classLoaderFunction;
}
class jdk_internal_module_SystemModuleFinders extends Object {
public static Object JNUA;
public static boolean USE_FAST_PATH;
public static Object cachedSystemModuleFinder;
}
class java_net_URI extends Object {
public static long serialVersionUID;
public java_lang_String scheme;
public java_lang_String fragment;
public java_lang_String authority;
public java_lang_String userInfo;
public java_lang_String host;
public int port;
public java_lang_String path;
public java_lang_String query;
public java_lang_String schemeSpecificPart;
public int hash;
public java_lang_String decodedUserInfo;
public java_lang_String decodedAuthority;
public java_lang_String decodedPath;
public java_lang_String decodedQuery;
public java_lang_String decodedFragment;
public java_lang_String decodedSchemeSpecificPart;
public java_lang_String string;
public static long L_DIGIT;
public static long H_DIGIT;
public static long L_UPALPHA;
public static long H_UPALPHA;
public static long L_LOWALPHA;
public static long H_LOWALPHA;
public static long L_ALPHA;
public static long H_ALPHA;
public static long L_ALPHANUM;
public static long H_ALPHANUM;
public static long L_HEX;
public static long H_HEX;
public static long L_MARK;
public static long H_MARK;
public static long L_UNRESERVED;
public static long H_UNRESERVED;
public static long L_RESERVED;
public static long H_RESERVED;
public static long L_ESCAPED;
public static long H_ESCAPED;
public static long L_URIC;
public static long H_URIC;
public static long L_PCHAR;
public static long H_PCHAR;
public static long L_PATH;
public static long H_PATH;
public static long L_DASH;
public static long H_DASH;
public static long L_DOT;
public static long H_DOT;
public static long L_USERINFO;
public static long H_USERINFO;
public static long L_REG_NAME;
public static long H_REG_NAME;
public static long L_SERVER;
public static long H_SERVER;
public static long L_SERVER_PERCENT;
public static long H_SERVER_PERCENT;
public static long L_SCHEME;
public static long H_SCHEME;
public static long L_SCOPE_ID;
public static long H_SCOPE_ID;
public static char[] hexDigits;
public static boolean $assertionsDisabled;
}
class jdk_internal_access_JavaNetUriAccess extends Object {

}
class java_net_URI$1 extends Object {

}
class jdk_internal_module_SystemModulesMap extends Object {

}
class jdk_internal_module_SystemModules extends Object {

}
class jdk_internal_module_ExplodedSystemModules extends Object {

}
class java_nio_file_Watchable extends Object {

}
class java_nio_file_Path extends Object {

}
class java_nio_file_FileSystems extends Object {

}
class sun_nio_fs_DefaultFileSystemProvider extends Object {
public static sun_nio_fs_LinuxFileSystemProvider INSTANCE;
}
class java_nio_file_spi_FileSystemProvider extends Object {
public static Object lock;
public static Object installedProviders;
public static boolean loadingProviders;
public static Object DEFAULT_OPEN_OPTIONS;
}
class sun_nio_fs_AbstractFileSystemProvider extends java_nio_file_spi_FileSystemProvider {

}
class sun_nio_fs_UnixFileSystemProvider extends sun_nio_fs_AbstractFileSystemProvider {
public static java_lang_String USER_DIR;
public static byte[] EMPTY_PATH;
public sun_nio_fs_UnixFileSystem theFileSystem;
}
class sun_nio_fs_LinuxFileSystemProvider extends sun_nio_fs_UnixFileSystemProvider {

}
class java_nio_file_OpenOption extends Object {

}
class java_lang_Enum extends Object {
public java_lang_String name;
public int ordinal;
}
class java_nio_file_StandardOpenOption extends java_lang_Enum {
public static java_nio_file_StandardOpenOption READ;
public static java_nio_file_StandardOpenOption WRITE;
public static java_nio_file_StandardOpenOption APPEND;
public static java_nio_file_StandardOpenOption TRUNCATE_EXISTING;
public static java_nio_file_StandardOpenOption CREATE;
public static java_nio_file_StandardOpenOption CREATE_NEW;
public static java_nio_file_StandardOpenOption DELETE_ON_CLOSE;
public static java_nio_file_StandardOpenOption SPARSE;
public static java_nio_file_StandardOpenOption SYNC;
public static java_nio_file_StandardOpenOption DSYNC;
public static java_nio_file_StandardOpenOption[] $VALUES;
}
class java_nio_file_FileSystem extends Object {

}
class sun_nio_fs_UnixFileSystem extends java_nio_file_FileSystem {
public sun_nio_fs_UnixFileSystemProvider provider;
public byte[] defaultDirectory;
public boolean needToResolveAgainstDefaultDirectory;
public sun_nio_fs_UnixPath rootDirectory;
public static java_lang_String GLOB_SYNTAX;
public static java_lang_String REGEX_SYNTAX;
}
class sun_nio_fs_LinuxFileSystem extends sun_nio_fs_UnixFileSystem {

}
class sun_nio_fs_UnixPath extends Object {
public static Object JLA;
public sun_nio_fs_UnixFileSystem fs;
public byte[] path;
public java_lang_String stringValue;
public int hash;
public int[] offsets;
public static boolean $assertionsDisabled;
}
class sun_nio_fs_Util extends Object {
public static java_nio_charset_Charset jnuEncoding;
}
class java_lang_StringCoding extends Object {

}
class sun_nio_fs_UnixNativeDispatcher extends Object {
public static int SUPPORTS_OPENAT;
public static int SUPPORTS_FUTIMES;
public static int SUPPORTS_FUTIMENS;
public static int SUPPORTS_LUTIMES;
public static int SUPPORTS_XATTR;
public static int SUPPORTS_BIRTHTIME;
public static int capabilities;
}
class jdk_internal_loader_BootLoader extends Object {
public static Object JLA;
public static java_lang_Module UNNAMED_MODULE;
public static java_lang_String JAVA_HOME;
public static java_util_concurrent_ConcurrentHashMap CLASS_LOADER_VALUE_MAP;
public static jdk_internal_loader_NativeLibraries NATIVE_LIBS;
}
class jdk_internal_loader_NativeLibraries extends Object {
public Object libraries;
public java_lang_ClassLoader loader;
public java_lang_Class caller;
public boolean searchJavaLibraryPath;
public boolean isJNI;
public static Object loadedLibraryNames;
public static Object nativeLibraryContext;
public static boolean $assertionsDisabled;
}
class java_util_HashSet extends java_util_AbstractSet {
public static long serialVersionUID;
public java_util_HashMap map;
public static Object PRESENT;
}
class java_util_Queue extends Object {

}
class java_util_Deque extends Object {

}
class java_util_ArrayDeque extends java_util_AbstractCollection {
public Object[] elements;
public int head;
public int tail;
public static int MAX_ARRAY_SIZE;
public static long serialVersionUID;
}
class jdk_internal_loader_NativeLibraries$LibraryPaths extends Object {
public static java_lang_String[] SYS_PATHS;
public static java_lang_String[] USER_PATHS;
}
class jdk_internal_loader_ClassLoaderHelper extends Object {

}
class jdk_internal_loader_NativeLibraries$1 extends Object {
public java_io_File val$file;
public jdk_internal_loader_NativeLibraries this$0;
}
class java_io_File$PathStatus extends java_lang_Enum {
public static java_io_File$PathStatus INVALID;
public static java_io_File$PathStatus CHECKED;
public static java_io_File$PathStatus[] $VALUES;
}
class java_util_ArrayDeque$DeqIterator extends Object {
public int cursor;
public int remaining;
public int lastRet;
public java_util_ArrayDeque this$0;
}
class jdk_internal_loader_NativeLibrary extends Object {

}
class jdk_internal_loader_NativeLibraries$NativeLibraryImpl extends Object {
public java_lang_Class fromClass;
public java_lang_String name;
public boolean isBuiltin;
public boolean isJNI;
public long handle;
public int jniVersion;
public static boolean $assertionsDisabled;
}
class java_security_cert_Certificate extends Object {
public static long serialVersionUID;
public java_lang_String type;
public int hash;
}
class java_util_concurrent_ConcurrentHashMap$CollectionView extends Object {
public static long serialVersionUID;
public java_util_concurrent_ConcurrentHashMap map;
public static java_lang_String OOME_MSG;
}
class java_util_concurrent_ConcurrentHashMap$ValuesView extends java_util_concurrent_ConcurrentHashMap$CollectionView {
public static long serialVersionUID;
}
class java_util_Enumeration extends Object {

}
class java_util_concurrent_ConcurrentHashMap$Traverser extends Object {
public java_util_concurrent_ConcurrentHashMap$Node[] tab;
public java_util_concurrent_ConcurrentHashMap$Node next;
public Object stack;
public Object spare;
public int index;
public int baseIndex;
public int baseLimit;
public int baseSize;
}
class java_util_concurrent_ConcurrentHashMap$BaseIterator extends java_util_concurrent_ConcurrentHashMap$Traverser {
public java_util_concurrent_ConcurrentHashMap map;
public java_util_concurrent_ConcurrentHashMap$Node lastReturned;
}
class java_util_concurrent_ConcurrentHashMap$ValueIterator extends java_util_concurrent_ConcurrentHashMap$BaseIterator {

}
class java_nio_file_attribute_BasicFileAttributes extends Object {

}
class java_nio_file_attribute_PosixFileAttributes extends Object {

}
class sun_nio_fs_UnixFileAttributes extends Object {
public int st_mode;
public long st_ino;
public long st_dev;
public long st_rdev;
public int st_nlink;
public int st_uid;
public int st_gid;
public long st_size;
public long st_atime_sec;
public long st_atime_nsec;
public long st_mtime_sec;
public long st_mtime_nsec;
public long st_ctime_sec;
public long st_ctime_nsec;
public long st_birthtime_sec;
public Object owner;
public Object group;
public sun_nio_fs_UnixFileKey key;
}
class sun_nio_fs_UnixFileStoreAttributes extends Object {
public long f_frsize;
public long f_blocks;
public long f_bfree;
public long f_bavail;
}
class sun_nio_fs_UnixMountEntry extends Object {
public byte[] name;
public byte[] dir;
public byte[] fstype;
public byte[] opts;
public long dev;
public java_lang_String fstypeAsString;
public java_lang_String optionsAsString;
}
class java_nio_file_CopyOption extends Object {

}
class java_nio_file_LinkOption extends java_lang_Enum {
public static java_nio_file_LinkOption NOFOLLOW_LINKS;
public static java_nio_file_LinkOption[] $VALUES;
}
class java_nio_file_Files extends Object {
public static int BUFFER_SIZE;
public static Object DEFAULT_CREATE_OPTIONS;
public static Object JLA;
public static boolean $assertionsDisabled;
}
class sun_nio_fs_NativeBuffers extends Object {
public static jdk_internal_misc_Unsafe unsafe;
public static int TEMP_BUF_POOL_SIZE;
public static java_lang_ThreadLocal threadLocal;
public static boolean $assertionsDisabled;
}
class jdk_internal_misc_TerminatingThreadLocal extends java_lang_ThreadLocal {
public static java_lang_ThreadLocal REGISTRY;
}
class sun_nio_fs_NativeBuffers$1 extends jdk_internal_misc_TerminatingThreadLocal {

}
class jdk_internal_misc_TerminatingThreadLocal$1 extends java_lang_ThreadLocal {

}
class java_lang_ThreadLocal$ThreadLocalMap extends Object {
public static int INITIAL_CAPACITY;
public java_lang_ThreadLocal$ThreadLocalMap$Entry[] table;
public int size;
public int threshold;
}
class java_lang_ThreadLocal$ThreadLocalMap$Entry extends java_lang_ref_WeakReference {
public Object value;
}
class java_util_IdentityHashMap extends java_util_AbstractMap {
public static int DEFAULT_CAPACITY;
public static int MINIMUM_CAPACITY;
public static int MAXIMUM_CAPACITY;
public Object[] table;
public int size;
public int modCount;
public static Object NULL_KEY;
public Object entrySet;
public static long serialVersionUID;
}
class java_util_Collections$SetFromMap extends java_util_AbstractSet {
public Object m;
public Object s;
public static long serialVersionUID;
}
class java_util_IdentityHashMap$KeySet extends java_util_AbstractSet {
public java_util_IdentityHashMap this$0;
}
class sun_nio_fs_NativeBuffer extends Object {
public static jdk_internal_misc_Unsafe unsafe;
public long address;
public int size;
public Object cleanable;
public Object owner;
}
class jdk_internal_ref_CleanerFactory extends Object {
public static java_lang_ref_Cleaner commonCleaner;
}
class java_util_concurrent_ThreadFactory extends Object {

}
class jdk_internal_ref_CleanerFactory$1 extends Object {

}
class java_lang_ref_Cleaner extends Object {
public jdk_internal_ref_CleanerImpl impl;
}
class java_util_function_Function extends Object {

}
class java_lang_ref_Cleaner$1 extends Object {

}
class jdk_internal_ref_CleanerImpl extends Object {
public static Object cleanerImplAccess;
public jdk_internal_ref_PhantomCleanable phantomCleanableList;
public java_lang_ref_ReferenceQueue queue;
}
class java_lang_ref_Cleaner$Cleanable extends Object {

}
class jdk_internal_ref_PhantomCleanable extends java_lang_ref_PhantomReference {
public jdk_internal_ref_PhantomCleanable prev;
public jdk_internal_ref_PhantomCleanable next;
public jdk_internal_ref_PhantomCleanable list;
}
class jdk_internal_ref_CleanerImpl$PhantomCleanableRef extends jdk_internal_ref_PhantomCleanable {
public Object action;
}
class jdk_internal_ref_CleanerImpl$CleanerCleanable extends jdk_internal_ref_PhantomCleanable {

}
class jdk_internal_misc_InnocuousThread extends java_lang_Thread {
public static jdk_internal_misc_Unsafe UNSAFE;
public static long THREAD_LOCALS;
public static long INHERITABLE_THREAD_LOCALS;
public static java_lang_ThreadGroup INNOCUOUSTHREADGROUP;
public static java_security_AccessControlContext ACC;
public static long INHERITEDACCESSCONTROLCONTEXT;
public static long CONTEXTCLASSLOADER;
public static java_util_concurrent_atomic_AtomicInteger threadNumber;
public boolean hasRun;
}
class jdk_internal_access_JavaSecurityAccess extends Object {

}
class java_security_ProtectionDomain$JavaSecurityAccessImpl extends Object {

}
class java_security_ProtectionDomain$Key extends Object {

}
class java_security_Principal extends Object {

}
class sun_nio_fs_NativeBuffer$Deallocator extends Object {
public long address;
}
class java_lang_module_ModuleFinder extends Object {

}
class jdk_internal_module_ModulePath extends Object {
public static java_lang_String MODULE_INFO;
public java_lang_Runtime$Version releaseVersion;
public boolean isLinkPhase;
public jdk_internal_module_ModulePatcher patcher;
public Object[] entries;
public int next;
public Object cachedModules;
public static java_lang_String SERVICES_PREFIX;
public static java_util_jar_Attributes$Name AUTOMATIC_MODULE_NAME;
public static jdk_internal_perf_PerfCounter scanTime;
public static jdk_internal_perf_PerfCounter moduleCount;
public static boolean $assertionsDisabled;
}
class java_util_jar_Attributes$Name extends Object {
public java_lang_String name;
public int hashCode;
public static Object KNOWN_NAMES;
public static java_util_jar_Attributes$Name MANIFEST_VERSION;
public static java_util_jar_Attributes$Name SIGNATURE_VERSION;
public static java_util_jar_Attributes$Name CONTENT_TYPE;
public static java_util_jar_Attributes$Name CLASS_PATH;
public static java_util_jar_Attributes$Name MAIN_CLASS;
public static java_util_jar_Attributes$Name SEALED;
public static java_util_jar_Attributes$Name EXTENSION_LIST;
public static java_util_jar_Attributes$Name EXTENSION_NAME;
public static java_util_jar_Attributes$Name EXTENSION_INSTALLATION;
public static java_util_jar_Attributes$Name IMPLEMENTATION_TITLE;
public static java_util_jar_Attributes$Name IMPLEMENTATION_VERSION;
public static java_util_jar_Attributes$Name IMPLEMENTATION_VENDOR;
public static java_util_jar_Attributes$Name IMPLEMENTATION_VENDOR_ID;
public static java_util_jar_Attributes$Name IMPLEMENTATION_URL;
public static java_util_jar_Attributes$Name SPECIFICATION_TITLE;
public static java_util_jar_Attributes$Name SPECIFICATION_VERSION;
public static java_util_jar_Attributes$Name SPECIFICATION_VENDOR;
public static java_util_jar_Attributes$Name MULTI_RELEASE;
}
class java_lang_reflect_Array extends Object {

}
class jdk_internal_perf_PerfCounter extends Object {
public static jdk_internal_perf_Perf perf;
public static int V_Constant;
public static int V_Monotonic;
public static int V_Variable;
public static int U_None;
public java_lang_String name;
public java_nio_LongBuffer lb;
}
class jdk_internal_perf_Perf$GetPerfAction extends Object {

}
class jdk_internal_perf_Perf extends Object {
public static jdk_internal_perf_Perf instance;
public static int PERF_MODE_RO;
public static int PERF_MODE_RW;
}
class sun_nio_ch_DirectBuffer extends Object {

}
class java_nio_MappedByteBuffer extends java_nio_ByteBuffer {
public java_io_FileDescriptor fd;
public boolean isSync;
public static jdk_internal_misc_ScopedMemoryAccess SCOPED_MEMORY_ACCESS;
}
class java_nio_DirectByteBuffer extends java_nio_MappedByteBuffer {
public static long ARRAY_BASE_OFFSET;
public static boolean UNALIGNED;
public Object att;
public jdk_internal_ref_Cleaner cleaner;
public static boolean $assertionsDisabled;
}
class java_nio_Bits extends Object {
public static jdk_internal_misc_Unsafe UNSAFE;
public static int PAGE_SIZE;
public static boolean UNALIGNED;
public static long MAX_MEMORY;
public static java_util_concurrent_atomic_AtomicLong RESERVED_MEMORY;
public static java_util_concurrent_atomic_AtomicLong TOTAL_CAPACITY;
public static java_util_concurrent_atomic_AtomicLong COUNT;
public static boolean MEMORY_LIMIT_SET;
public static int MAX_SLEEPS;
public static Object BUFFER_POOL;
public static int JNI_COPY_TO_ARRAY_THRESHOLD;
public static int JNI_COPY_FROM_ARRAY_THRESHOLD;
public static boolean $assertionsDisabled;
}
class java_util_concurrent_atomic_AtomicLong extends java_lang_Number {
public static long serialVersionUID;
public static boolean VM_SUPPORTS_LONG_CAS;
public static jdk_internal_misc_Unsafe U;
public static long VALUE;
public long value;
}
class jdk_internal_misc_VM$BufferPool extends Object {

}
class java_nio_Bits$1 extends Object {

}
class java_nio_LongBuffer extends java_nio_Buffer {
public static long ARRAY_BASE_OFFSET;
public long[] hb;
public int offset;
public boolean isReadOnly;
public static boolean $assertionsDisabled;
}
class java_nio_DirectLongBufferU extends java_nio_LongBuffer {
public static long ARRAY_BASE_OFFSET;
public static boolean UNALIGNED;
public Object att;
public static boolean $assertionsDisabled;
}
class java_util_zip_ZipConstants extends Object {
public static long LOCSIG;
public static long EXTSIG;
public static long CENSIG;
public static long ENDSIG;
public static int LOCHDR;
public static int EXTHDR;
public static int CENHDR;
public static int ENDHDR;
public static int LOCVER;
public static int LOCFLG;
public static int LOCHOW;
public static int LOCTIM;
public static int LOCCRC;
public static int LOCSIZ;
public static int LOCLEN;
public static int LOCNAM;
public static int LOCEXT;
public static int EXTCRC;
public static int EXTSIZ;
public static int EXTLEN;
public static int CENVEM;
public static int CENVER;
public static int CENFLG;
public static int CENHOW;
public static int CENTIM;
public static int CENCRC;
public static int CENSIZ;
public static int CENLEN;
public static int CENNAM;
public static int CENEXT;
public static int CENCOM;
public static int CENDSK;
public static int CENATT;
public static int CENATX;
public static int CENOFF;
public static int ENDSUB;
public static int ENDTOT;
public static int ENDSIZ;
public static int ENDOFF;
public static int ENDCOM;
}
class java_util_zip_ZipFile extends Object {
public java_lang_String name;
public boolean closeRequested;
public Object res;
public static int STORED;
public static int DEFLATED;
public static int OPEN_READ;
public static int OPEN_DELETE;
public java_lang_String lastEntryName;
public int lastEntryPos;
public static boolean isWindows;
public static long LOCSIG;
public static long EXTSIG;
public static long CENSIG;
public static long ENDSIG;
public static int LOCHDR;
public static int EXTHDR;
public static int CENHDR;
public static int ENDHDR;
public static int LOCVER;
public static int LOCFLG;
public static int LOCHOW;
public static int LOCTIM;
public static int LOCCRC;
public static int LOCSIZ;
public static int LOCLEN;
public static int LOCNAM;
public static int LOCEXT;
public static int EXTCRC;
public static int EXTSIZ;
public static int EXTLEN;
public static int CENVEM;
public static int CENVER;
public static int CENFLG;
public static int CENHOW;
public static int CENTIM;
public static int CENCRC;
public static int CENSIZ;
public static int CENLEN;
public static int CENNAM;
public static int CENEXT;
public static int CENCOM;
public static int CENDSK;
public static int CENATT;
public static int CENATX;
public static int CENOFF;
public static int ENDSUB;
public static int ENDTOT;
public static int ENDSIZ;
public static int ENDOFF;
public static int ENDCOM;
}
class java_util_jar_JarFile extends java_util_zip_ZipFile {
public static java_lang_Runtime$Version BASE_VERSION;
public static int BASE_VERSION_FEATURE;
public static java_lang_Runtime$Version RUNTIME_VERSION;
public static boolean MULTI_RELEASE_ENABLED;
public static boolean MULTI_RELEASE_FORCED;
public static java_lang_ThreadLocal isInitializing;
public static int MAX_ARRAY_SIZE;
public java_lang_ref_SoftReference manRef;
public Object manEntry;
public Object jv;
public boolean jvInitialized;
public boolean verify;
public java_lang_Runtime$Version version;
public int versionFeature;
public boolean isMultiRelease;
public boolean hasClassPathAttribute;
public boolean hasCheckedSpecialAttributes;
public static Object JUZFA;
public static java_lang_String META_INF;
public static java_lang_String META_INF_VERSIONS;
public static java_lang_String MANIFEST_NAME;
public static byte[] CLASSPATH_CHARS;
public static byte[] CLASSPATH_LASTOCC;
public static byte[] CLASSPATH_OPTOSFT;
public static byte[] MULTIRELEASE_CHARS;
public static byte[] MULTIRELEASE_LASTOCC;
public static byte[] MULTIRELEASE_OPTOSFT;
}
class jdk_internal_access_JavaUtilZipFileAccess extends Object {

}
class java_util_zip_ZipFile$1 extends Object {

}
class jdk_internal_access_JavaUtilJarAccess extends Object {

}
class java_util_jar_JavaUtilJarAccessImpl extends Object {

}
class java_lang_Runtime$Version extends Object {
public Object version;
public java_util_Optional pre;
public java_util_Optional build;
public java_util_Optional optional;
}
class java_util_ImmutableCollections$List12 extends java_util_ImmutableCollections$AbstractImmutableList {
public Object e0;
public Object e1;
}
class java_util_Optional extends Object {
public static java_util_Optional EMPTY;
public Object value;
}
class jdk_internal_module_SystemModuleFinders$1 extends Object {
public Object val$f;
}
class java_lang_invoke_LambdaMetafactory extends Object {
public static int FLAG_SERIALIZABLE;
public static int FLAG_MARKERS;
public static int FLAG_BRIDGES;
public static java_lang_Class[] EMPTY_CLASS_ARRAY;
public static java_lang_invoke_MethodType[] EMPTY_MT_ARRAY;
}
class java_lang_invoke_MethodType$ConcurrentWeakInternSet extends Object {
public Object map;
public java_lang_ref_ReferenceQueue stale;
}
class java_lang_Void extends Object {
public static java_lang_Class TYPE;
}
class java_lang_invoke_MethodTypeForm extends Object {
public short parameterSlotCount;
public short primitiveCount;
public java_lang_invoke_MethodType erasedType;
public java_lang_invoke_MethodType basicType;
public java_lang_ref_SoftReference[] methodHandles;
public static int MH_BASIC_INV;
public static int MH_NF_INV;
public static int MH_UNINIT_CS;
public static int MH_LIMIT;
public java_lang_ref_SoftReference[] lambdaForms;
public static int LF_INVVIRTUAL;
public static int LF_INVSTATIC;
public static int LF_INVSPECIAL;
public static int LF_NEWINVSPECIAL;
public static int LF_INVINTERFACE;
public static int LF_INVSTATIC_INIT;
public static int LF_INTERPRET;
public static int LF_REBIND;
public static int LF_DELEGATE;
public static int LF_DELEGATE_BLOCK_INLINING;
public static int LF_EX_LINKER;
public static int LF_EX_INVOKER;
public static int LF_GEN_LINKER;
public static int LF_GEN_INVOKER;
public static int LF_CS_LINKER;
public static int LF_MH_LINKER;
public static int LF_GWC;
public static int LF_GWT;
public static int LF_TF;
public static int LF_LOOP;
public static int LF_INVSPECIAL_IFC;
public static int LF_INVNATIVE;
public static int LF_VH_EX_INVOKER;
public static int LF_VH_GEN_INVOKER;
public static int LF_VH_GEN_LINKER;
public static int LF_COLLECTOR;
public static int LF_LIMIT;
public static int ERASE;
public static int WRAP;
public static int UNWRAP;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_MethodType$ConcurrentWeakInternSet$WeakEntry extends java_lang_ref_WeakReference {
public int hashcode;
}
class sun_invoke_util_Wrapper extends java_lang_Enum {
public static sun_invoke_util_Wrapper BOOLEAN;
public static sun_invoke_util_Wrapper BYTE;
public static sun_invoke_util_Wrapper SHORT;
public static sun_invoke_util_Wrapper CHAR;
public static sun_invoke_util_Wrapper INT;
public static sun_invoke_util_Wrapper LONG;
public static sun_invoke_util_Wrapper FLOAT;
public static sun_invoke_util_Wrapper DOUBLE;
public static sun_invoke_util_Wrapper OBJECT;
public static sun_invoke_util_Wrapper VOID;
public static int COUNT;
public java_lang_Class wrapperType;
public java_lang_Class primitiveType;
public char basicTypeChar;
public java_lang_String basicTypeString;
public Object emptyArray;
public int format;
public java_lang_String wrapperSimpleName;
public java_lang_String primitiveSimpleName;
public static Object DOUBLE_ZERO;
public static Object FLOAT_ZERO;
public static sun_invoke_util_Wrapper[] FROM_PRIM;
public static sun_invoke_util_Wrapper[] FROM_WRAP;
public static sun_invoke_util_Wrapper[] FROM_CHAR;
public static sun_invoke_util_Wrapper[] $VALUES;
public static boolean $assertionsDisabled;
}
class sun_invoke_util_Wrapper$Format extends Object {
public static int SLOT_SHIFT;
public static int SIZE_SHIFT;
public static int KIND_SHIFT;
public static int SIGNED;
public static int UNSIGNED;
public static int FLOATING;
public static int SLOT_MASK;
public static int SIZE_MASK;
public static int INT;
public static int SHORT;
public static int BOOLEAN;
public static int CHAR;
public static int FLOAT;
public static int VOID;
public static int NUM_MASK;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_LambdaForm$NamedFunction extends Object {
public java_lang_invoke_MemberName member;
public java_lang_invoke_MethodHandle resolvedHandle;
public java_lang_invoke_MethodHandle invoker;
public static java_lang_invoke_MethodType INVOKER_METHOD_TYPE;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_DirectMethodHandle$Holder extends Object {
public java_lang_invoke_DirectMethodHandle this$0;
}
class sun_invoke_util_ValueConversions extends Object {
public static java_lang_Class THIS_CLASS;
public static java_lang_invoke_MethodHandles$Lookup IMPL_LOOKUP;
public static Object[] UNBOX_CONVERSIONS;
public static java_lang_Integer ZERO_INT;
public static java_lang_Integer ONE_INT;
public static Object[] BOX_CONVERSIONS;
public static Object[] CONSTANT_FUNCTIONS;
public static Object[] CONVERT_PRIMITIVE_FUNCTIONS;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_MethodHandleImpl extends Object {
public static java_lang_invoke_MethodHandle[] FAKE_METHOD_HANDLE_INVOKE;
public static java_lang_invoke_MethodHandle[] ARRAYS;
public static int MAX_JVM_ARITY;
public static byte NF_checkSpreadArgument;
public static byte NF_guardWithCatch;
public static byte NF_throwException;
public static byte NF_tryFinally;
public static byte NF_loop;
public static byte NF_profileBoolean;
public static byte NF_tableSwitch;
public static byte NF_LIMIT;
public static java_lang_invoke_LambdaForm$NamedFunction[] NFS;
public static int MH_cast;
public static int MH_selectAlternative;
public static int MH_countedLoopPred;
public static int MH_countedLoopStep;
public static int MH_initIterator;
public static int MH_iteratePred;
public static int MH_iterateNext;
public static int MH_Array_newInstance;
public static int MH_LIMIT;
public static java_lang_invoke_MethodHandle[] HANDLES;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_Invokers extends Object {
public java_lang_invoke_MethodType targetType;
public java_lang_invoke_MethodHandle[] invokers;
public static int INV_EXACT;
public static int INV_GENERIC;
public static int INV_BASIC;
public static int VH_INV_EXACT;
public static int VH_INV_GENERIC;
public static int INV_LIMIT;
public static int MH_LINKER_ARG_APPENDED;
public static byte NF_checkExactType;
public static byte NF_checkGenericType;
public static byte NF_getCallSiteTarget;
public static byte NF_checkCustomized;
public static byte NF_checkVarHandleGenericType;
public static byte NF_checkVarHandleExactType;
public static byte NF_directVarHandleTarget;
public static byte NF_LIMIT;
public static java_lang_invoke_LambdaForm$NamedFunction[] NFS;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_LambdaForm$Kind extends java_lang_Enum {
public static java_lang_invoke_LambdaForm$Kind GENERIC;
public static java_lang_invoke_LambdaForm$Kind ZERO;
public static java_lang_invoke_LambdaForm$Kind IDENTITY;
public static java_lang_invoke_LambdaForm$Kind BOUND_REINVOKER;
public static java_lang_invoke_LambdaForm$Kind REINVOKER;
public static java_lang_invoke_LambdaForm$Kind DELEGATE;
public static java_lang_invoke_LambdaForm$Kind EXACT_LINKER;
public static java_lang_invoke_LambdaForm$Kind EXACT_INVOKER;
public static java_lang_invoke_LambdaForm$Kind GENERIC_LINKER;
public static java_lang_invoke_LambdaForm$Kind GENERIC_INVOKER;
public static java_lang_invoke_LambdaForm$Kind LINK_TO_TARGET_METHOD;
public static java_lang_invoke_LambdaForm$Kind LINK_TO_CALL_SITE;
public static java_lang_invoke_LambdaForm$Kind DIRECT_INVOKE_VIRTUAL;
public static java_lang_invoke_LambdaForm$Kind DIRECT_INVOKE_SPECIAL;
public static java_lang_invoke_LambdaForm$Kind DIRECT_INVOKE_SPECIAL_IFC;
public static java_lang_invoke_LambdaForm$Kind DIRECT_INVOKE_STATIC;
public static java_lang_invoke_LambdaForm$Kind DIRECT_NEW_INVOKE_SPECIAL;
public static java_lang_invoke_LambdaForm$Kind DIRECT_INVOKE_INTERFACE;
public static java_lang_invoke_LambdaForm$Kind DIRECT_INVOKE_STATIC_INIT;
public static java_lang_invoke_LambdaForm$Kind GET_REFERENCE;
public static java_lang_invoke_LambdaForm$Kind PUT_REFERENCE;
public static java_lang_invoke_LambdaForm$Kind GET_REFERENCE_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind PUT_REFERENCE_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind GET_INT;
public static java_lang_invoke_LambdaForm$Kind PUT_INT;
public static java_lang_invoke_LambdaForm$Kind GET_INT_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind PUT_INT_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind GET_BOOLEAN;
public static java_lang_invoke_LambdaForm$Kind PUT_BOOLEAN;
public static java_lang_invoke_LambdaForm$Kind GET_BOOLEAN_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind PUT_BOOLEAN_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind GET_BYTE;
public static java_lang_invoke_LambdaForm$Kind PUT_BYTE;
public static java_lang_invoke_LambdaForm$Kind GET_BYTE_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind PUT_BYTE_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind GET_CHAR;
public static java_lang_invoke_LambdaForm$Kind PUT_CHAR;
public static java_lang_invoke_LambdaForm$Kind GET_CHAR_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind PUT_CHAR_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind GET_SHORT;
public static java_lang_invoke_LambdaForm$Kind PUT_SHORT;
public static java_lang_invoke_LambdaForm$Kind GET_SHORT_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind PUT_SHORT_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind GET_LONG;
public static java_lang_invoke_LambdaForm$Kind PUT_LONG;
public static java_lang_invoke_LambdaForm$Kind GET_LONG_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind PUT_LONG_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind GET_FLOAT;
public static java_lang_invoke_LambdaForm$Kind PUT_FLOAT;
public static java_lang_invoke_LambdaForm$Kind GET_FLOAT_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind PUT_FLOAT_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind GET_DOUBLE;
public static java_lang_invoke_LambdaForm$Kind PUT_DOUBLE;
public static java_lang_invoke_LambdaForm$Kind GET_DOUBLE_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind PUT_DOUBLE_VOLATILE;
public static java_lang_invoke_LambdaForm$Kind TRY_FINALLY;
public static java_lang_invoke_LambdaForm$Kind TABLE_SWITCH;
public static java_lang_invoke_LambdaForm$Kind COLLECT;
public static java_lang_invoke_LambdaForm$Kind COLLECTOR;
public static java_lang_invoke_LambdaForm$Kind CONVERT;
public static java_lang_invoke_LambdaForm$Kind SPREAD;
public static java_lang_invoke_LambdaForm$Kind LOOP;
public static java_lang_invoke_LambdaForm$Kind FIELD;
public static java_lang_invoke_LambdaForm$Kind GUARD;
public static java_lang_invoke_LambdaForm$Kind GUARD_WITH_CATCH;
public static java_lang_invoke_LambdaForm$Kind VARHANDLE_EXACT_INVOKER;
public static java_lang_invoke_LambdaForm$Kind VARHANDLE_INVOKER;
public static java_lang_invoke_LambdaForm$Kind VARHANDLE_LINKER;
public java_lang_String defaultLambdaName;
public java_lang_String methodName;
public static java_lang_invoke_LambdaForm$Kind[] $VALUES;
}
class java_lang_NoSuchMethodException extends java_lang_ReflectiveOperationException {
public static long serialVersionUID;
}
class java_lang_invoke_LambdaForm$BasicType extends java_lang_Enum {
public static java_lang_invoke_LambdaForm$BasicType L_TYPE;
public static java_lang_invoke_LambdaForm$BasicType I_TYPE;
public static java_lang_invoke_LambdaForm$BasicType J_TYPE;
public static java_lang_invoke_LambdaForm$BasicType F_TYPE;
public static java_lang_invoke_LambdaForm$BasicType D_TYPE;
public static java_lang_invoke_LambdaForm$BasicType V_TYPE;
public static java_lang_invoke_LambdaForm$BasicType[] ALL_TYPES;
public static java_lang_invoke_LambdaForm$BasicType[] ARG_TYPES;
public static int ARG_TYPE_LIMIT;
public static int TYPE_LIMIT;
public static byte L_TYPE_NUM;
public static byte I_TYPE_NUM;
public static byte J_TYPE_NUM;
public static byte F_TYPE_NUM;
public static byte D_TYPE_NUM;
public static byte V_TYPE_NUM;
public char btChar;
public java_lang_Class btClass;
public sun_invoke_util_Wrapper btWrapper;
public static java_lang_invoke_LambdaForm$BasicType[] $VALUES;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_LambdaForm$Name extends Object {
public java_lang_invoke_LambdaForm$BasicType type;
public short index;
public java_lang_invoke_LambdaForm$NamedFunction function;
public Object constraint;
public Object[] arguments;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_LambdaForm$Holder extends Object {
public java_lang_invoke_LambdaForm this$0;
}
class java_lang_invoke_InvokerBytecodeGenerator extends Object {
public static java_lang_String MH;
public static java_lang_String MHI;
public static java_lang_String LF;
public static java_lang_String LFN;
public static java_lang_String CLS;
public static java_lang_String OBJ;
public static java_lang_String OBJARY;
public static java_lang_String LOOP_CLAUSES;
public static java_lang_String MHARY2;
public static java_lang_String MH_SIG;
public static java_lang_String LF_SIG;
public static java_lang_String LFN_SIG;
public static java_lang_String LL_SIG;
public static java_lang_String LLV_SIG;
public static java_lang_String CLASS_PREFIX;
public static java_lang_String SOURCE_PREFIX;
public static java_lang_String INVOKER_SUPER_NAME;
public java_lang_String name;
public java_lang_String className;
public java_lang_invoke_LambdaForm lambdaForm;
public java_lang_String invokerName;
public java_lang_invoke_MethodType invokerType;
public int[] localsMap;
public java_lang_Class[] localClasses;
public jdk_internal_org_objectweb_asm_ClassWriter cw;
public jdk_internal_org_objectweb_asm_MethodVisitor mv;
public Object classData;
public java_lang_Class lastClass;
public java_lang_String lastInternalName;
public static java_lang_invoke_MemberName$Factory MEMBERNAME_FACTORY;
public static java_lang_Class HOST_CLASS;
public static java_lang_invoke_MethodHandles$Lookup LOOKUP;
public static java_util_HashMap DUMP_CLASS_FILES_COUNTERS;
public static java_io_File DUMP_CLASS_FILES_DIR;
public static java_lang_String DONTINLINE_SIG;
public static java_lang_String FORCEINLINE_SIG;
public static java_lang_String HIDDEN_SIG;
public static java_lang_String INJECTEDPROFILE_SIG;
public static java_lang_String LF_COMPILED_SIG;
public static java_lang_Class[] STATICALLY_INVOCABLE_PACKAGES;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_InvokerBytecodeGenerator$2 extends Object {
public static int[] $SwitchMap$java$lang$invoke$LambdaForm$BasicType;
public static int[] $SwitchMap$sun$invoke$util$Wrapper;
public static int[] $SwitchMap$java$lang$invoke$LambdaForm$Kind;
public static int[] $SwitchMap$java$lang$invoke$MethodHandleImpl$Intrinsic;
}
class java_lang_invoke_MethodHandleImpl$Intrinsic extends java_lang_Enum {
public static java_lang_invoke_MethodHandleImpl$Intrinsic SELECT_ALTERNATIVE;
public static java_lang_invoke_MethodHandleImpl$Intrinsic GUARD_WITH_CATCH;
public static java_lang_invoke_MethodHandleImpl$Intrinsic TRY_FINALLY;
public static java_lang_invoke_MethodHandleImpl$Intrinsic TABLE_SWITCH;
public static java_lang_invoke_MethodHandleImpl$Intrinsic LOOP;
public static java_lang_invoke_MethodHandleImpl$Intrinsic ARRAY_LOAD;
public static java_lang_invoke_MethodHandleImpl$Intrinsic ARRAY_STORE;
public static java_lang_invoke_MethodHandleImpl$Intrinsic ARRAY_LENGTH;
public static java_lang_invoke_MethodHandleImpl$Intrinsic IDENTITY;
public static java_lang_invoke_MethodHandleImpl$Intrinsic ZERO;
public static java_lang_invoke_MethodHandleImpl$Intrinsic NONE;
public static java_lang_invoke_MethodHandleImpl$Intrinsic[] $VALUES;
}
class jdk_internal_org_objectweb_asm_ClassVisitor extends Object {
public int api;
public jdk_internal_org_objectweb_asm_ClassVisitor cv;
}
class jdk_internal_org_objectweb_asm_ClassWriter extends jdk_internal_org_objectweb_asm_ClassVisitor {
public static int COMPUTE_MAXS;
public static int COMPUTE_FRAMES;
public int version;
public jdk_internal_org_objectweb_asm_SymbolTable symbolTable;
public int accessFlags;
public int thisClass;
public int superClass;
public int interfaceCount;
public int[] interfaces;
public jdk_internal_org_objectweb_asm_FieldWriter firstField;
public jdk_internal_org_objectweb_asm_FieldWriter lastField;
public jdk_internal_org_objectweb_asm_MethodWriter firstMethod;
public jdk_internal_org_objectweb_asm_MethodWriter lastMethod;
public int numberOfInnerClasses;
public jdk_internal_org_objectweb_asm_ByteVector innerClasses;
public int enclosingClassIndex;
public int enclosingMethodIndex;
public int signatureIndex;
public int sourceFileIndex;
public jdk_internal_org_objectweb_asm_ByteVector debugExtension;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeVisibleAnnotation;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeInvisibleAnnotation;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeVisibleTypeAnnotation;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeInvisibleTypeAnnotation;
public Object moduleWriter;
public int nestHostClassIndex;
public int numberOfNestMemberClasses;
public jdk_internal_org_objectweb_asm_ByteVector nestMemberClasses;
public int numberOfPermittedSubclassClasses;
public jdk_internal_org_objectweb_asm_ByteVector permittedSubclassClasses;
public Object firstRecordComponent;
public Object lastRecordComponent;
public jdk_internal_org_objectweb_asm_Attribute firstAttribute;
public int compute;
}
class jdk_internal_org_objectweb_asm_SymbolTable extends Object {
public jdk_internal_org_objectweb_asm_ClassWriter classWriter;
public jdk_internal_org_objectweb_asm_ClassReader sourceClassReader;
public int majorVersion;
public java_lang_String className;
public int entryCount;
public jdk_internal_org_objectweb_asm_SymbolTable$Entry[] entries;
public int constantPoolCount;
public jdk_internal_org_objectweb_asm_ByteVector constantPool;
public int bootstrapMethodCount;
public jdk_internal_org_objectweb_asm_ByteVector bootstrapMethods;
public int typeCount;
public jdk_internal_org_objectweb_asm_SymbolTable$Entry[] typeTable;
}
class jdk_internal_org_objectweb_asm_Symbol extends Object {
public static int CONSTANT_CLASS_TAG;
public static int CONSTANT_FIELDREF_TAG;
public static int CONSTANT_METHODREF_TAG;
public static int CONSTANT_INTERFACE_METHODREF_TAG;
public static int CONSTANT_STRING_TAG;
public static int CONSTANT_INTEGER_TAG;
public static int CONSTANT_FLOAT_TAG;
public static int CONSTANT_LONG_TAG;
public static int CONSTANT_DOUBLE_TAG;
public static int CONSTANT_NAME_AND_TYPE_TAG;
public static int CONSTANT_UTF8_TAG;
public static int CONSTANT_METHOD_HANDLE_TAG;
public static int CONSTANT_METHOD_TYPE_TAG;
public static int CONSTANT_DYNAMIC_TAG;
public static int CONSTANT_INVOKE_DYNAMIC_TAG;
public static int CONSTANT_MODULE_TAG;
public static int CONSTANT_PACKAGE_TAG;
public static int BOOTSTRAP_METHOD_TAG;
public static int TYPE_TAG;
public static int UNINITIALIZED_TYPE_TAG;
public static int MERGED_TYPE_TAG;
public int index;
public int tag;
public java_lang_String owner;
public java_lang_String name;
public java_lang_String value;
public long data;
public int info;
}
class jdk_internal_org_objectweb_asm_SymbolTable$Entry extends jdk_internal_org_objectweb_asm_Symbol {
public int hashCode;
public jdk_internal_org_objectweb_asm_SymbolTable$Entry next;
}
class jdk_internal_org_objectweb_asm_ByteVector extends Object {
public byte[] data;
public int length;
}
class sun_invoke_util_BytecodeDescriptor extends Object {

}
class jdk_internal_org_objectweb_asm_MethodVisitor extends Object {
public static java_lang_String REQUIRES_ASM5;
public int api;
public jdk_internal_org_objectweb_asm_MethodVisitor mv;
}
class jdk_internal_org_objectweb_asm_MethodWriter extends jdk_internal_org_objectweb_asm_MethodVisitor {
public static int COMPUTE_NOTHING;
public static int COMPUTE_MAX_STACK_AND_LOCAL;
public static int COMPUTE_MAX_STACK_AND_LOCAL_FROM_FRAMES;
public static int COMPUTE_INSERTED_FRAMES;
public static int COMPUTE_ALL_FRAMES;
public static int NA;
public static int[] STACK_SIZE_DELTA;
public jdk_internal_org_objectweb_asm_SymbolTable symbolTable;
public int accessFlags;
public int nameIndex;
public java_lang_String name;
public int descriptorIndex;
public java_lang_String descriptor;
public int maxStack;
public int maxLocals;
public jdk_internal_org_objectweb_asm_ByteVector code;
public jdk_internal_org_objectweb_asm_Handler firstHandler;
public jdk_internal_org_objectweb_asm_Handler lastHandler;
public int lineNumberTableLength;
public jdk_internal_org_objectweb_asm_ByteVector lineNumberTable;
public int localVariableTableLength;
public jdk_internal_org_objectweb_asm_ByteVector localVariableTable;
public int localVariableTypeTableLength;
public jdk_internal_org_objectweb_asm_ByteVector localVariableTypeTable;
public int stackMapTableNumberOfEntries;
public jdk_internal_org_objectweb_asm_ByteVector stackMapTableEntries;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastCodeRuntimeVisibleTypeAnnotation;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastCodeRuntimeInvisibleTypeAnnotation;
public jdk_internal_org_objectweb_asm_Attribute firstCodeAttribute;
public int numberOfExceptions;
public int[] exceptionIndexTable;
public int signatureIndex;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeVisibleAnnotation;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeInvisibleAnnotation;
public int visibleAnnotableParameterCount;
public jdk_internal_org_objectweb_asm_AnnotationWriter[] lastRuntimeVisibleParameterAnnotations;
public int invisibleAnnotableParameterCount;
public jdk_internal_org_objectweb_asm_AnnotationWriter[] lastRuntimeInvisibleParameterAnnotations;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeVisibleTypeAnnotation;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeInvisibleTypeAnnotation;
public jdk_internal_org_objectweb_asm_ByteVector defaultValue;
public int parametersCount;
public jdk_internal_org_objectweb_asm_ByteVector parameters;
public jdk_internal_org_objectweb_asm_Attribute firstAttribute;
public int compute;
public jdk_internal_org_objectweb_asm_Label firstBasicBlock;
public jdk_internal_org_objectweb_asm_Label lastBasicBlock;
public jdk_internal_org_objectweb_asm_Label currentBasicBlock;
public int relativeStackSize;
public int maxRelativeStackSize;
public int currentLocals;
public int previousFrameOffset;
public int[] previousFrame;
public int[] currentFrame;
public boolean hasSubroutines;
public boolean hasAsmInstructions;
public int lastBytecodeOffset;
public int sourceOffset;
public int sourceLength;
}
class jdk_internal_org_objectweb_asm_Type extends Object {
public static int VOID;
public static int BOOLEAN;
public static int CHAR;
public static int BYTE;
public static int SHORT;
public static int INT;
public static int FLOAT;
public static int LONG;
public static int DOUBLE;
public static int ARRAY;
public static int OBJECT;
public static int METHOD;
public static int INTERNAL;
public static java_lang_String PRIMITIVE_DESCRIPTORS;
public static jdk_internal_org_objectweb_asm_Type VOID_TYPE;
public static jdk_internal_org_objectweb_asm_Type BOOLEAN_TYPE;
public static jdk_internal_org_objectweb_asm_Type CHAR_TYPE;
public static jdk_internal_org_objectweb_asm_Type BYTE_TYPE;
public static jdk_internal_org_objectweb_asm_Type SHORT_TYPE;
public static jdk_internal_org_objectweb_asm_Type INT_TYPE;
public static jdk_internal_org_objectweb_asm_Type FLOAT_TYPE;
public static jdk_internal_org_objectweb_asm_Type LONG_TYPE;
public static jdk_internal_org_objectweb_asm_Type DOUBLE_TYPE;
public int sort;
public java_lang_String valueBuffer;
public int valueBegin;
public int valueEnd;
}
class jdk_internal_org_objectweb_asm_Label extends Object {
public static int FLAG_DEBUG_ONLY;
public static int FLAG_JUMP_TARGET;
public static int FLAG_RESOLVED;
public static int FLAG_REACHABLE;
public static int FLAG_SUBROUTINE_CALLER;
public static int FLAG_SUBROUTINE_START;
public static int FLAG_SUBROUTINE_END;
public static int LINE_NUMBERS_CAPACITY_INCREMENT;
public static int FORWARD_REFERENCES_CAPACITY_INCREMENT;
public static int FORWARD_REFERENCE_TYPE_MASK;
public static int FORWARD_REFERENCE_TYPE_SHORT;
public static int FORWARD_REFERENCE_TYPE_WIDE;
public static int FORWARD_REFERENCE_HANDLE_MASK;
public static jdk_internal_org_objectweb_asm_Label EMPTY_LIST;
public Object info;
public short flags;
public short lineNumber;
public int[] otherLineNumbers;
public int bytecodeOffset;
public int[] forwardReferences;
public short inputStackSize;
public short outputStackSize;
public short outputStackMax;
public short subroutineId;
public jdk_internal_org_objectweb_asm_Frame frame;
public jdk_internal_org_objectweb_asm_Label nextBasicBlock;
public Object outgoingEdges;
public jdk_internal_org_objectweb_asm_Label nextListElement;
}
class jdk_internal_org_objectweb_asm_Frame extends Object {
public static int SAME_FRAME;
public static int SAME_LOCALS_1_STACK_ITEM_FRAME;
public static int RESERVED;
public static int SAME_LOCALS_1_STACK_ITEM_FRAME_EXTENDED;
public static int CHOP_FRAME;
public static int SAME_FRAME_EXTENDED;
public static int APPEND_FRAME;
public static int FULL_FRAME;
public static int ITEM_TOP;
public static int ITEM_INTEGER;
public static int ITEM_FLOAT;
public static int ITEM_DOUBLE;
public static int ITEM_LONG;
public static int ITEM_NULL;
public static int ITEM_UNINITIALIZED_THIS;
public static int ITEM_OBJECT;
public static int ITEM_UNINITIALIZED;
public static int ITEM_ASM_BOOLEAN;
public static int ITEM_ASM_BYTE;
public static int ITEM_ASM_CHAR;
public static int ITEM_ASM_SHORT;
public static int DIM_SIZE;
public static int KIND_SIZE;
public static int FLAGS_SIZE;
public static int VALUE_SIZE;
public static int DIM_SHIFT;
public static int KIND_SHIFT;
public static int FLAGS_SHIFT;
public static int DIM_MASK;
public static int KIND_MASK;
public static int VALUE_MASK;
public static int ARRAY_OF;
public static int ELEMENT_OF;
public static int CONSTANT_KIND;
public static int REFERENCE_KIND;
public static int UNINITIALIZED_KIND;
public static int LOCAL_KIND;
public static int STACK_KIND;
public static int TOP_IF_LONG_OR_DOUBLE_FLAG;
public static int TOP;
public static int BOOLEAN;
public static int BYTE;
public static int CHAR;
public static int SHORT;
public static int INTEGER;
public static int FLOAT;
public static int LONG;
public static int DOUBLE;
public static int NULL;
public static int UNINITIALIZED_THIS;
public jdk_internal_org_objectweb_asm_Label owner;
public int[] inputLocals;
public int[] inputStack;
public int[] outputLocals;
public int[] outputStack;
public short outputStackStart;
public short outputStackTop;
public int initializationCount;
public int[] initializations;
}
class jdk_internal_org_objectweb_asm_AnnotationVisitor extends Object {
public int api;
public jdk_internal_org_objectweb_asm_AnnotationVisitor av;
}
class jdk_internal_org_objectweb_asm_AnnotationWriter extends jdk_internal_org_objectweb_asm_AnnotationVisitor {
public jdk_internal_org_objectweb_asm_SymbolTable symbolTable;
public boolean useNamedValues;
public jdk_internal_org_objectweb_asm_ByteVector annotation;
public int numElementValuePairsOffset;
public int numElementValuePairs;
public jdk_internal_org_objectweb_asm_AnnotationWriter previousAnnotation;
public jdk_internal_org_objectweb_asm_AnnotationWriter nextAnnotation;
}
class java_lang_invoke_InvokerBytecodeGenerator$ClassData extends Object {
public java_lang_String name;
public java_lang_String desc;
public Object value;
}
class sun_invoke_util_VerifyType extends Object {
public static boolean $assertionsDisabled;
}
class sun_invoke_empty_Empty extends Object {

}
class java_util_ArrayList$Itr extends Object {
public int cursor;
public int lastRet;
public int expectedModCount;
public java_util_ArrayList this$0;
}
class jdk_internal_org_objectweb_asm_FieldVisitor extends Object {
public int api;
public jdk_internal_org_objectweb_asm_FieldVisitor fv;
}
class jdk_internal_org_objectweb_asm_FieldWriter extends jdk_internal_org_objectweb_asm_FieldVisitor {
public jdk_internal_org_objectweb_asm_SymbolTable symbolTable;
public int accessFlags;
public int nameIndex;
public int descriptorIndex;
public int signatureIndex;
public int constantValueIndex;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeVisibleAnnotation;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeInvisibleAnnotation;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeVisibleTypeAnnotation;
public jdk_internal_org_objectweb_asm_AnnotationWriter lastRuntimeInvisibleTypeAnnotation;
public jdk_internal_org_objectweb_asm_Attribute firstAttribute;
}
class jdk_internal_org_objectweb_asm_Attribute extends Object {
public java_lang_String type;
public byte[] content;
public jdk_internal_org_objectweb_asm_Attribute nextAttribute;
}
class jdk_internal_org_objectweb_asm_Handler extends Object {
public jdk_internal_org_objectweb_asm_Label startPc;
public jdk_internal_org_objectweb_asm_Label endPc;
public jdk_internal_org_objectweb_asm_Label handlerPc;
public int catchType;
public java_lang_String catchTypeDescriptor;
public jdk_internal_org_objectweb_asm_Handler nextHandler;
}
class java_lang_invoke_MethodHandles$Lookup$ClassFile extends Object {
public java_lang_String name;
public int accessFlags;
public byte[] bytes;
}
class java_lang_invoke_MethodHandles$Lookup$ClassOption extends java_lang_Enum {
public static java_lang_invoke_MethodHandles$Lookup$ClassOption NESTMATE;
public static java_lang_invoke_MethodHandles$Lookup$ClassOption STRONG;
public int flag;
public static java_lang_invoke_MethodHandles$Lookup$ClassOption[] $VALUES;
}
class java_util_ImmutableCollections$SetN$SetNIterator extends Object {
public int remaining;
public int idx;
public java_util_ImmutableCollections$SetN this$0;
}
class java_lang_invoke_MethodHandles$Lookup$ClassDefiner extends Object {
public java_lang_invoke_MethodHandles$Lookup lookup;
public java_lang_String name;
public byte[] bytes;
public int classFlags;
public static boolean $assertionsDisabled;
}
class jdk_internal_util_Preconditions extends Object {

}
class java_lang_invoke_LambdaForm$DMH_0x0000000800000400 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_IncompatibleClassChangeError extends java_lang_LinkageError {
public static long serialVersionUID;
}
class java_lang_NoSuchMethodError extends java_lang_IncompatibleClassChangeError {
public static long serialVersionUID;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800000800 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_BootstrapMethodInvoker extends Object {
public static java_lang_invoke_MethodType LMF_INDY_MT;
public static java_lang_invoke_MethodType LMF_ALT_MT;
public static java_lang_invoke_MethodType LMF_CONDY_MT;
public static java_lang_invoke_MethodType SCF_MT;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_VarHandle$AccessMode extends java_lang_Enum {
public static java_lang_invoke_VarHandle$AccessMode GET;
public static java_lang_invoke_VarHandle$AccessMode SET;
public static java_lang_invoke_VarHandle$AccessMode GET_VOLATILE;
public static java_lang_invoke_VarHandle$AccessMode SET_VOLATILE;
public static java_lang_invoke_VarHandle$AccessMode GET_ACQUIRE;
public static java_lang_invoke_VarHandle$AccessMode SET_RELEASE;
public static java_lang_invoke_VarHandle$AccessMode GET_OPAQUE;
public static java_lang_invoke_VarHandle$AccessMode SET_OPAQUE;
public static java_lang_invoke_VarHandle$AccessMode COMPARE_AND_SET;
public static java_lang_invoke_VarHandle$AccessMode COMPARE_AND_EXCHANGE;
public static java_lang_invoke_VarHandle$AccessMode COMPARE_AND_EXCHANGE_ACQUIRE;
public static java_lang_invoke_VarHandle$AccessMode COMPARE_AND_EXCHANGE_RELEASE;
public static java_lang_invoke_VarHandle$AccessMode WEAK_COMPARE_AND_SET_PLAIN;
public static java_lang_invoke_VarHandle$AccessMode WEAK_COMPARE_AND_SET;
public static java_lang_invoke_VarHandle$AccessMode WEAK_COMPARE_AND_SET_ACQUIRE;
public static java_lang_invoke_VarHandle$AccessMode WEAK_COMPARE_AND_SET_RELEASE;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_SET;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_SET_ACQUIRE;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_SET_RELEASE;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_ADD;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_ADD_ACQUIRE;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_ADD_RELEASE;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_BITWISE_OR;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_BITWISE_OR_RELEASE;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_BITWISE_OR_ACQUIRE;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_BITWISE_AND;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_BITWISE_AND_RELEASE;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_BITWISE_AND_ACQUIRE;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_BITWISE_XOR;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_BITWISE_XOR_RELEASE;
public static java_lang_invoke_VarHandle$AccessMode GET_AND_BITWISE_XOR_ACQUIRE;
public static int COUNT;
public java_lang_String methodName;
public java_lang_invoke_VarHandle$AccessType at;
public static java_lang_invoke_VarHandle$AccessMode[] $VALUES;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_VarHandle$AccessType extends java_lang_Enum {
public static java_lang_invoke_VarHandle$AccessType GET;
public static java_lang_invoke_VarHandle$AccessType SET;
public static java_lang_invoke_VarHandle$AccessType COMPARE_AND_SET;
public static java_lang_invoke_VarHandle$AccessType COMPARE_AND_EXCHANGE;
public static java_lang_invoke_VarHandle$AccessType GET_AND_UPDATE;
public static int COUNT;
public java_lang_Class returnType;
public boolean isMonomorphicInReturnType;
public static java_lang_invoke_VarHandle$AccessType[] $VALUES;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_Invokers$Holder extends Object {
public java_lang_invoke_Invokers this$0;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800000c00 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_LambdaForm$MH_0x0000000800001000 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class jdk_internal_access_JavaLangInvokeAccess extends Object {

}
class java_lang_invoke_MethodHandleImpl$1 extends Object {

}
class java_lang_invoke_AbstractValidatingLambdaMetafactory extends Object {
public java_lang_invoke_MethodHandles$Lookup caller;
public java_lang_Class targetClass;
public java_lang_invoke_MethodType factoryType;
public java_lang_Class interfaceClass;
public java_lang_String interfaceMethodName;
public java_lang_invoke_MethodType interfaceMethodType;
public java_lang_invoke_MethodHandle implementation;
public java_lang_invoke_MethodType implMethodType;
public Object implInfo;
public int implKind;
public boolean implIsInstanceMethod;
public java_lang_Class implClass;
public java_lang_invoke_MethodType dynamicMethodType;
public boolean isSerializable;
public java_lang_Class[] altInterfaces;
public java_lang_invoke_MethodType[] altMethods;
}
class java_lang_invoke_InnerClassLambdaMetafactory extends java_lang_invoke_AbstractValidatingLambdaMetafactory {
public static int CLASSFILE_VERSION;
public static java_lang_String METHOD_DESCRIPTOR_VOID;
public static java_lang_String JAVA_LANG_OBJECT;
public static java_lang_String NAME_CTOR;
public static java_lang_String LAMBDA_INSTANCE_FIELD;
public static java_lang_String NAME_SERIALIZED_LAMBDA;
public static java_lang_String NAME_NOT_SERIALIZABLE_EXCEPTION;
public static java_lang_String DESCR_METHOD_WRITE_REPLACE;
public static java_lang_String DESCR_METHOD_WRITE_OBJECT;
public static java_lang_String DESCR_METHOD_READ_OBJECT;
public static java_lang_String NAME_METHOD_WRITE_REPLACE;
public static java_lang_String NAME_METHOD_READ_OBJECT;
public static java_lang_String NAME_METHOD_WRITE_OBJECT;
public static java_lang_String DESCR_CLASS;
public static java_lang_String DESCR_STRING;
public static java_lang_String DESCR_OBJECT;
public static java_lang_String DESCR_CTOR_SERIALIZED_LAMBDA;
public static java_lang_String DESCR_CTOR_NOT_SERIALIZABLE_EXCEPTION;
public static java_lang_String[] SER_HOSTILE_EXCEPTIONS;
public static java_lang_String[] EMPTY_STRING_ARRAY;
public static java_util_concurrent_atomic_AtomicInteger counter;
public static Object dumper;
public static boolean disableEagerInitialization;
public static jdk_internal_org_objectweb_asm_ConstantDynamic implMethodCondy;
public java_lang_String implMethodClassName;
public java_lang_String implMethodName;
public java_lang_String implMethodDesc;
public java_lang_invoke_MethodType constructorType;
public jdk_internal_org_objectweb_asm_ClassWriter cw;
public java_lang_String[] argNames;
public java_lang_String[] argDescs;
public java_lang_String lambdaClassName;
public boolean useImplMethodHandle;
public static boolean $assertionsDisabled;
}
class sun_security_action_GetBooleanAction extends Object {
public java_lang_String theProp;
}
class jdk_internal_org_objectweb_asm_Handle extends Object {
public int tag;
public java_lang_String owner;
public java_lang_String name;
public java_lang_String descriptor;
public boolean isInterface;
}
class jdk_internal_org_objectweb_asm_ConstantDynamic extends Object {
public java_lang_String name;
public java_lang_String descriptor;
public jdk_internal_org_objectweb_asm_Handle bootstrapMethod;
public Object[] bootstrapMethodArguments;
}
class java_lang_invoke_MethodHandleInfo extends Object {
public static int REF_getField;
public static int REF_getStatic;
public static int REF_putField;
public static int REF_putStatic;
public static int REF_invokeVirtual;
public static int REF_invokeStatic;
public static int REF_invokeSpecial;
public static int REF_newInvokeSpecial;
public static int REF_invokeInterface;
}
class java_lang_invoke_InfoFromMemberName extends Object {
public java_lang_invoke_MemberName member;
public int referenceKind;
public static boolean $assertionsDisabled;
public static int REF_getField;
public static int REF_getStatic;
public static int REF_putField;
public static int REF_putStatic;
public static int REF_invokeVirtual;
public static int REF_invokeStatic;
public static int REF_invokeSpecial;
public static int REF_newInvokeSpecial;
public static int REF_invokeInterface;
}
class java_lang_invoke_LambdaProxyClassArchive extends Object {

}
class java_lang_invoke_TypeConvertingMethodAdapter extends jdk_internal_org_objectweb_asm_MethodVisitor {
public static int NUM_WRAPPERS;
public static java_lang_String NAME_OBJECT;
public static java_lang_String WRAPPER_PREFIX;
public static java_lang_String NAME_BOX_METHOD;
public static int[][] wideningOpcodes;
public static sun_invoke_util_Wrapper[] FROM_WRAPPER_NAME;
public static sun_invoke_util_Wrapper[] FROM_TYPE_SORT;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_InnerClassLambdaMetafactory$ForwardingMethodGenerator extends java_lang_invoke_TypeConvertingMethodAdapter {
public java_lang_invoke_InnerClassLambdaMetafactory this$0;
}
class jdk_internal_org_objectweb_asm_ClassReader extends Object {
public static int SKIP_CODE;
public static int SKIP_DEBUG;
public static int SKIP_FRAMES;
public static int EXPAND_FRAMES;
public static int EXPAND_ASM_INSNS;
public static int INPUT_STREAM_DATA_CHUNK_SIZE;
public byte[] b;
public byte[] classFileBuffer;
public int[] cpInfoOffsets;
public java_lang_String[] constantUtf8Values;
public jdk_internal_org_objectweb_asm_ConstantDynamic[] constantDynamicValues;
public int[] bootstrapMethodOffsets;
public int maxStringLength;
public int header;
}
class java_lang_StringUTF16 extends Object {
public static int HI_BYTE_SHIFT;
public static int LO_BYTE_SHIFT;
public static int MAX_LENGTH;
public static boolean $assertionsDisabled;
}
class java_util_ImmutableCollections$Set12$1 extends Object {
public int idx;
public java_util_ImmutableCollections$Set12 this$0;
}
class jdk_internal_module_SystemModuleFinders$1$$Lambda$1_0x0000000800030be0 extends Object {
public Object arg$1;
public java_lang_String arg$2;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800001400 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_DirectMethodHandle$Constructor extends java_lang_invoke_DirectMethodHandle {
public java_lang_invoke_MemberName initMethod;
public java_lang_Class instanceClass;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800001800 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_LambdaForm$MH_0x0000000800001c00 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_nio_file_attribute_DosFileAttributes extends Object {

}
class java_nio_file_attribute_AttributeView extends Object {

}
class java_nio_file_attribute_FileAttributeView extends Object {

}
class java_nio_file_attribute_BasicFileAttributeView extends Object {

}
class java_nio_file_attribute_DosFileAttributeView extends Object {

}
class java_nio_file_attribute_UserDefinedFileAttributeView extends Object {

}
class sun_nio_fs_UnixFileAttributeViews extends Object {

}
class sun_nio_fs_DynamicFileAttributeView extends Object {

}
class sun_nio_fs_AbstractBasicFileAttributeView extends Object {
public static java_lang_String SIZE_NAME;
public static java_lang_String CREATION_TIME_NAME;
public static java_lang_String LAST_ACCESS_TIME_NAME;
public static java_lang_String LAST_MODIFIED_TIME_NAME;
public static java_lang_String FILE_KEY_NAME;
public static java_lang_String IS_DIRECTORY_NAME;
public static java_lang_String IS_REGULAR_FILE_NAME;
public static java_lang_String IS_SYMBOLIC_LINK_NAME;
public static java_lang_String IS_OTHER_NAME;
public static Object basicAttributeNames;
}
class sun_nio_fs_UnixFileAttributeViews$Basic extends sun_nio_fs_AbstractBasicFileAttributeView {
public sun_nio_fs_UnixPath file;
public boolean followLinks;
}
class sun_nio_fs_UnixFileAttributes$UnixAsBasicFileAttributes extends Object {
public sun_nio_fs_UnixFileAttributes attrs;
}
class java_nio_file_DirectoryStream$Filter extends Object {

}
class java_nio_file_Files$AcceptAllFilter extends Object {
public static java_nio_file_Files$AcceptAllFilter FILTER;
}
class java_nio_file_DirectoryStream extends Object {

}
class java_nio_file_SecureDirectoryStream extends Object {

}
class sun_nio_fs_UnixSecureDirectoryStream extends Object {
public sun_nio_fs_UnixDirectoryStream ds;
public int dfd;
}
class sun_nio_fs_UnixDirectoryStream extends Object {
public sun_nio_fs_UnixPath dir;
public long dp;
public Object filter;
public java_util_concurrent_locks_ReentrantReadWriteLock streamLock;
public boolean isClosed;
public Object iterator;
}
class java_util_concurrent_locks_ReadWriteLock extends Object {

}
class java_util_concurrent_locks_ReentrantReadWriteLock extends Object {
public static long serialVersionUID;
public java_util_concurrent_locks_ReentrantReadWriteLock$ReadLock readerLock;
public java_util_concurrent_locks_ReentrantReadWriteLock$WriteLock writerLock;
public java_util_concurrent_locks_ReentrantReadWriteLock$Sync sync;
}
class java_util_concurrent_locks_AbstractQueuedSynchronizer extends java_util_concurrent_locks_AbstractOwnableSynchronizer {
public static long serialVersionUID;
public static int WAITING;
public static int CANCELLED;
public static int COND;
public Object head;
public Object tail;
public int state;
public static jdk_internal_misc_Unsafe U;
public static long STATE;
public static long HEAD;
public static long TAIL;
}
class java_util_concurrent_locks_ReentrantReadWriteLock$Sync extends java_util_concurrent_locks_AbstractQueuedSynchronizer {
public static long serialVersionUID;
public static int SHARED_SHIFT;
public static int SHARED_UNIT;
public static int MAX_COUNT;
public static int EXCLUSIVE_MASK;
public java_util_concurrent_locks_ReentrantReadWriteLock$Sync$ThreadLocalHoldCounter readHolds;
public Object cachedHoldCounter;
public java_lang_Thread firstReader;
public int firstReaderHoldCount;
}
class java_util_concurrent_locks_ReentrantReadWriteLock$FairSync extends java_util_concurrent_locks_ReentrantReadWriteLock$Sync {
public static long serialVersionUID;
}
class java_util_concurrent_locks_ReentrantReadWriteLock$Sync$ThreadLocalHoldCounter extends java_lang_ThreadLocal {

}
class java_util_concurrent_locks_ReentrantReadWriteLock$ReadLock extends Object {
public static long serialVersionUID;
public java_util_concurrent_locks_ReentrantReadWriteLock$Sync sync;
}
class java_util_concurrent_locks_ReentrantReadWriteLock$WriteLock extends Object {
public static long serialVersionUID;
public java_util_concurrent_locks_ReentrantReadWriteLock$Sync sync;
}
class sun_nio_fs_UnixDirectoryStream$UnixDirectoryIterator extends Object {
public boolean atEof;
public Object nextEntry;
public static boolean $assertionsDisabled;
public sun_nio_fs_UnixDirectoryStream this$0;
}
class java_nio_file_attribute_FileAttribute extends Object {

}
class sun_nio_fs_UnixFileModeAttribute extends Object {
public static int ALL_PERMISSIONS;
public static int ALL_READWRITE;
public static int TEMPFILE_PERMISSIONS;
}
class sun_nio_fs_UnixChannelFactory extends Object {
public static Object fdAccess;
}
class sun_nio_fs_UnixChannelFactory$Flags extends Object {
public boolean read;
public boolean write;
public boolean append;
public boolean truncateExisting;
public boolean noFollowLinks;
public boolean create;
public boolean createNew;
public boolean deleteOnClose;
public boolean sync;
public boolean dsync;
public boolean direct;
}
class java_util_Collections$EmptyIterator extends Object {
public static java_util_Collections$EmptyIterator EMPTY_ITERATOR;
}
class java_nio_channels_Channel extends Object {

}
class java_nio_channels_ReadableByteChannel extends Object {

}
class java_nio_channels_WritableByteChannel extends Object {

}
class java_nio_channels_ByteChannel extends Object {

}
class java_nio_channels_SeekableByteChannel extends Object {

}
class java_nio_channels_GatheringByteChannel extends Object {

}
class java_nio_channels_ScatteringByteChannel extends Object {

}
class java_nio_channels_InterruptibleChannel extends Object {

}
class java_nio_channels_spi_AbstractInterruptibleChannel extends Object {
public Object closeLock;
public boolean closed;
public Object interruptor;
public java_lang_Thread interrupted;
}
class java_nio_channels_FileChannel extends java_nio_channels_spi_AbstractInterruptibleChannel {
public static Object[] NO_ATTRIBUTES;
}
class sun_nio_ch_FileChannelImpl extends java_nio_channels_FileChannel {
public static long allocationGranularity;
public static Object fdAccess;
public sun_nio_ch_FileDispatcher nd;
public java_io_FileDescriptor fd;
public boolean writable;
public boolean readable;
public Object parent;
public java_lang_String path;
public sun_nio_ch_NativeThreadSet threads;
public Object positionLock;
public boolean uninterruptible;
public boolean direct;
public int alignment;
public Object closer;
public static boolean transferSupported;
public static boolean pipeSupported;
public static boolean fileSupported;
public static long MAPPED_TRANSFER_SIZE;
public static int TRANSFER_SIZE;
public static int MAP_INVALID;
public static int MAP_RO;
public static int MAP_RW;
public static int MAP_PV;
public Object fileLockTable;
public static boolean $assertionsDisabled;
}
class sun_nio_ch_IOUtil extends Object {
public static int IOV_MAX;
public static Object NIO_ACCESS;
public static boolean $assertionsDisabled;
}
class sun_nio_ch_NativeThreadSet extends Object {
public long[] elts;
public int used;
public boolean waitingToEmpty;
public static boolean $assertionsDisabled;
}
class sun_nio_ch_NativeDispatcher extends Object {

}
class sun_nio_ch_FileDispatcher extends sun_nio_ch_NativeDispatcher {
public static int NO_LOCK;
public static int LOCKED;
public static int RET_EX_LOCK;
public static int INTERRUPTED;
}
class sun_nio_ch_FileDispatcherImpl extends sun_nio_ch_FileDispatcher {
public static Object fdAccess;
}
class sun_nio_ch_FileChannelImpl$Closer extends Object {
public java_io_FileDescriptor fd;
}
class java_nio_channels_Channels extends Object {

}
class sun_nio_ch_ChannelInputStream extends java_io_InputStream {
public Object ch;
public java_nio_ByteBuffer bb;
public byte[] bs;
public byte[] b1;
}
class java_util_function_Supplier extends Object {

}
class java_lang_invoke_LambdaForm$DMH_0x0000000800002000 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class jdk_internal_module_ModulePath$$Lambda$2_0x0000000800038968 extends Object {
public jdk_internal_module_ModulePath arg$1;
public Object arg$2;
}
class jdk_internal_module_ModuleInfo extends Object {
public static Object JLMA;
public Object packageFinder;
public boolean parseHashes;
public static Object predefinedNotAllowed;
public static boolean $assertionsDisabled;
}
class java_io_DataInput extends Object {

}
class java_io_DataInputStream extends java_io_FilterInputStream {
public byte[] bytearr;
public char[] chararr;
public byte[] readBuffer;
public char[] lineBuffer;
}
class jdk_internal_module_ModuleInfo$CountingDataInput extends Object {
public Object delegate;
public long count;
}
class java_nio_channels_SelectableChannel extends java_nio_channels_spi_AbstractInterruptibleChannel {

}
class sun_nio_ch_NativeThread extends Object {

}
class sun_nio_ch_Util extends Object {
public static int TEMP_BUF_POOL_SIZE;
public static long MAX_CACHED_BUFFER_SIZE;
public static java_lang_ThreadLocal bufferCache;
public static jdk_internal_misc_Unsafe unsafe;
public static int pageSize;
public static java_lang_reflect_Constructor directByteBufferConstructor;
public static java_lang_reflect_Constructor directByteBufferRConstructor;
public static boolean $assertionsDisabled;
}
class sun_nio_ch_Util$1 extends jdk_internal_misc_TerminatingThreadLocal {

}
class sun_nio_ch_Util$BufferCache extends Object {
public java_nio_ByteBuffer[] buffers;
public int count;
public int start;
public static boolean $assertionsDisabled;
}
class java_nio_DirectByteBuffer$Deallocator extends Object {
public long address;
public long size;
public int capacity;
public static boolean $assertionsDisabled;
}
class sun_nio_ch_IOStatus extends Object {
public static int EOF;
public static int UNAVAILABLE;
public static int INTERRUPTED;
public static int UNSUPPORTED;
public static int THROWN;
public static int UNSUPPORTED_CASE;
}
class jdk_internal_module_ModuleInfo$ConstantPool extends Object {
public static int CONSTANT_Utf8;
public static int CONSTANT_Integer;
public static int CONSTANT_Float;
public static int CONSTANT_Long;
public static int CONSTANT_Double;
public static int CONSTANT_Class;
public static int CONSTANT_String;
public static int CONSTANT_Fieldref;
public static int CONSTANT_Methodref;
public static int CONSTANT_InterfaceMethodref;
public static int CONSTANT_NameAndType;
public static int CONSTANT_MethodHandle;
public static int CONSTANT_MethodType;
public static int CONSTANT_InvokeDynamic;
public static int CONSTANT_Module;
public static int CONSTANT_Package;
public jdk_internal_module_ModuleInfo$ConstantPool$Entry[] pool;
}
class jdk_internal_module_ModuleInfo$ConstantPool$Entry extends Object {
public int tag;
}
class jdk_internal_module_ModuleInfo$ConstantPool$ValueEntry extends jdk_internal_module_ModuleInfo$ConstantPool$Entry {
public Object value;
}
class jdk_internal_module_ModuleInfo$ConstantPool$IndexEntry extends jdk_internal_module_ModuleInfo$ConstantPool$Entry {
public int index;
}
class java_lang_module_ModuleDescriptor$Builder extends Object {
public java_lang_String name;
public boolean strict;
public Object modifiers;
public boolean open;
public boolean automatic;
public Object packages;
public Object requires;
public Object exports;
public Object opens;
public Object uses;
public Object provides;
public Object version;
public java_lang_String rawVersionString;
public java_lang_String mainClass;
public static boolean $assertionsDisabled;
}
class java_lang_module_ModuleDescriptor$Modifier extends java_lang_Enum {
public static java_lang_module_ModuleDescriptor$Modifier OPEN;
public static java_lang_module_ModuleDescriptor$Modifier AUTOMATIC;
public static java_lang_module_ModuleDescriptor$Modifier SYNTHETIC;
public static java_lang_module_ModuleDescriptor$Modifier MANDATED;
public static java_lang_module_ModuleDescriptor$Modifier[] $VALUES;
}
class java_lang_module_ModuleDescriptor$Requires$Modifier extends java_lang_Enum {
public static java_lang_module_ModuleDescriptor$Requires$Modifier TRANSITIVE;
public static java_lang_module_ModuleDescriptor$Requires$Modifier STATIC;
public static java_lang_module_ModuleDescriptor$Requires$Modifier SYNTHETIC;
public static java_lang_module_ModuleDescriptor$Requires$Modifier MANDATED;
public static java_lang_module_ModuleDescriptor$Requires$Modifier[] $VALUES;
}
class java_lang_module_ModuleDescriptor$Requires extends Object {
public Object mods;
public java_lang_String name;
public Object compiledVersion;
public java_lang_String rawCompiledVersion;
public static boolean $assertionsDisabled;
}
class java_util_HashMap$KeySet extends java_util_AbstractSet {
public java_util_HashMap this$0;
}
class java_util_HashMap$KeyIterator extends java_util_HashMap$HashIterator {
public java_util_HashMap this$0;
}
class java_lang_module_ModuleDescriptor$Exports extends Object {
public Object mods;
public java_lang_String source;
public Object targets;
}
class jdk_internal_module_Checks extends Object {
public static Object RESERVED;
}
class java_lang_module_ModuleDescriptor$Provides extends Object {
public java_lang_String service;
public Object providers;
}
class java_util_function_Consumer extends Object {

}
class java_lang_invoke_LambdaForm$DMH_0x0000000800002400 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_module_ModuleDescriptor$Builder$$Lambda$3_0x000000080003cf48 extends Object {
public java_lang_module_ModuleDescriptor$Builder arg$1;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800002800 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_LambdaForm$MH_0x0000000800002c00 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_util_ListIterator extends Object {

}
class java_util_ImmutableCollections$ListItr extends Object {
public Object list;
public int size;
public boolean isListIterator;
public int cursor;
}
class java_util_Collections$UnmodifiableCollection extends Object {
public static long serialVersionUID;
public Object c;
}
class java_util_Collections$UnmodifiableSet extends java_util_Collections$UnmodifiableCollection {
public static long serialVersionUID;
}
class java_util_Collections$UnmodifiableCollection$1 extends Object {
public Object i;
public java_util_Collections$UnmodifiableCollection this$0;
}
class java_util_HashMap$Values extends java_util_AbstractCollection {
public java_util_HashMap this$0;
}
class java_util_HashMap$ValueIterator extends java_util_HashMap$HashIterator {
public java_util_HashMap this$0;
}
class jdk_internal_module_ModuleInfo$Attributes extends Object {
public java_lang_module_ModuleDescriptor descriptor;
public Object target;
public Object recordedHashes;
public jdk_internal_module_ModuleResolution moduleResolution;
}
class jdk_internal_module_ModuleReferences extends Object {

}
class java_lang_module_ModuleReader extends Object {

}
class java_lang_invoke_LambdaForm$DMH_0x0000000800003000 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class jdk_internal_module_ModuleReferences$$Lambda$4_0x000000080003ebf0 extends Object {
public Object arg$1;
}
class sun_nio_fs_UnixUriUtils extends Object {
public static long L_DIGIT;
public static long H_DIGIT;
public static long L_UPALPHA;
public static long H_UPALPHA;
public static long L_LOWALPHA;
public static long H_LOWALPHA;
public static long L_ALPHA;
public static long H_ALPHA;
public static long L_ALPHANUM;
public static long H_ALPHANUM;
public static long L_MARK;
public static long H_MARK;
public static long L_UNRESERVED;
public static long H_UNRESERVED;
public static long L_PCHAR;
public static long H_PCHAR;
public static long L_PATH;
public static long H_PATH;
public static boolean $assertionsDisabled;
}
class java_util_HexFormat extends Object {
public static Object jla;
public static byte[] UPPERCASE_DIGITS;
public static byte[] LOWERCASE_DIGITS;
public static byte[] DIGITS;
public static java_util_HexFormat HEX_FORMAT;
public static byte[] EMPTY_BYTES;
public java_lang_String delimiter;
public java_lang_String prefix;
public java_lang_String suffix;
public byte[] digits;
public static boolean $assertionsDisabled;
}
class java_net_URI$Parser extends Object {
public java_lang_String input;
public boolean requireServerAuthority;
public int ipv6byteCount;
public java_net_URI this$0;
}
class java_lang_module_ModuleReference extends Object {
public java_lang_module_ModuleDescriptor descriptor;
public java_net_URI location;
}
class jdk_internal_module_ModuleReferenceImpl extends java_lang_module_ModuleReference {
public java_net_URI location;
public Object readerSupplier;
public jdk_internal_module_ModulePatcher patcher;
public Object target;
public Object recordedHashes;
public Object hasher;
public jdk_internal_module_ModuleResolution moduleResolution;
public byte[] cachedHash;
public int hash;
}
class java_lang_module_ModuleDescriptor$Opens extends Object {
public Object mods;
public java_lang_String source;
public Object targets;
}
class java_util_function_BiPredicate extends Object {

}
class java_lang_invoke_LambdaForm$DMH_0x0000000800003400 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class jdk_internal_module_ModulePath$$Lambda$5_0x000000080003fcd8 extends Object {
public jdk_internal_module_ModulePath arg$1;
}
class java_nio_file_FileVisitOption extends java_lang_Enum {
public static java_nio_file_FileVisitOption FOLLOW_LINKS;
public static java_nio_file_FileVisitOption[] $VALUES;
}
class java_nio_file_FileTreeIterator extends Object {
public java_nio_file_FileTreeWalker walker;
public java_nio_file_FileTreeWalker$Event next;
public static boolean $assertionsDisabled;
}
class java_nio_file_FileTreeWalker extends Object {
public boolean followLinks;
public java_nio_file_LinkOption[] linkOptions;
public int maxDepth;
public java_util_ArrayDeque stack;
public boolean closed;
public static boolean $assertionsDisabled;
}
class java_util_Arrays$ArrayList extends java_util_AbstractList {
public static long serialVersionUID;
public Object[] a;
}
class java_util_Arrays$ArrayItr extends Object {
public int cursor;
public Object[] a;
}
class java_nio_file_FileTreeWalker$DirectoryNode extends Object {
public Object dir;
public Object key;
public Object stream;
public Object iterator;
public boolean skipped;
}
class sun_nio_fs_UnixFileKey extends Object {
public long st_dev;
public long st_ino;
}
class java_nio_file_FileTreeWalker$Event extends Object {
public java_nio_file_FileTreeWalker$EventType type;
public Object file;
public Object attrs;
public Object ioe;
}
class java_nio_file_FileTreeWalker$EventType extends java_lang_Enum {
public static java_nio_file_FileTreeWalker$EventType START_DIRECTORY;
public static java_nio_file_FileTreeWalker$EventType END_DIRECTORY;
public static java_nio_file_FileTreeWalker$EventType ENTRY;
public static java_nio_file_FileTreeWalker$EventType[] $VALUES;
}
class java_util_Spliterators extends Object {
public static Object EMPTY_SPLITERATOR;
public static Object EMPTY_INT_SPLITERATOR;
public static Object EMPTY_LONG_SPLITERATOR;
public static Object EMPTY_DOUBLE_SPLITERATOR;
}
class java_util_Spliterator extends Object {
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_util_Spliterators$EmptySpliterator extends Object {

}
class java_util_Spliterators$EmptySpliterator$OfRef extends java_util_Spliterators$EmptySpliterator {
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_util_Spliterator$OfPrimitive extends Object {
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_util_Spliterator$OfInt extends Object {
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_util_Spliterators$EmptySpliterator$OfInt extends java_util_Spliterators$EmptySpliterator {
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_util_Spliterator$OfLong extends Object {
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_util_Spliterators$EmptySpliterator$OfLong extends java_util_Spliterators$EmptySpliterator {
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_util_Spliterator$OfDouble extends Object {
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_util_Spliterators$EmptySpliterator$OfDouble extends java_util_Spliterators$EmptySpliterator {
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_util_Spliterators$IteratorSpliterator extends Object {
public static int BATCH_UNIT;
public static int MAX_BATCH;
public Object collection;
public Object it;
public int characteristics;
public long est;
public int batch;
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_util_stream_StreamSupport extends Object {

}
class java_util_stream_BaseStream extends Object {

}
class java_util_stream_Stream extends Object {

}
class java_util_stream_PipelineHelper extends Object {

}
class java_util_stream_AbstractPipeline extends java_util_stream_PipelineHelper {
public static java_lang_String MSG_STREAM_LINKED;
public static java_lang_String MSG_CONSUMED;
public java_util_stream_AbstractPipeline sourceStage;
public java_util_stream_AbstractPipeline previousStage;
public int sourceOrOpFlags;
public java_util_stream_AbstractPipeline nextStage;
public int depth;
public int combinedFlags;
public Object sourceSpliterator;
public Object sourceSupplier;
public boolean linkedOrConsumed;
public boolean sourceAnyStateful;
public Object sourceCloseAction;
public boolean parallel;
public static boolean $assertionsDisabled;
}
class java_util_stream_ReferencePipeline extends java_util_stream_AbstractPipeline {

}
class java_util_stream_ReferencePipeline$Head extends java_util_stream_ReferencePipeline {

}
class java_util_stream_StreamOpFlag extends java_lang_Enum {
public static java_util_stream_StreamOpFlag DISTINCT;
public static java_util_stream_StreamOpFlag SORTED;
public static java_util_stream_StreamOpFlag ORDERED;
public static java_util_stream_StreamOpFlag SIZED;
public static java_util_stream_StreamOpFlag SHORT_CIRCUIT;
public static java_util_stream_StreamOpFlag SIZE_ADJUSTING;
public static int SET_BITS;
public static int CLEAR_BITS;
public static int PRESERVE_BITS;
public Object maskTable;
public int bitPosition;
public int set;
public int clear;
public int preserve;
public static int SPLITERATOR_CHARACTERISTICS_MASK;
public static int STREAM_MASK;
public static int OP_MASK;
public static int TERMINAL_OP_MASK;
public static int UPSTREAM_TERMINAL_OP_MASK;
public static int FLAG_MASK;
public static int FLAG_MASK_IS;
public static int FLAG_MASK_NOT;
public static int INITIAL_OPS_VALUE;
public static int IS_DISTINCT;
public static int NOT_DISTINCT;
public static int IS_SORTED;
public static int NOT_SORTED;
public static int IS_ORDERED;
public static int NOT_ORDERED;
public static int IS_SIZED;
public static int NOT_SIZED;
public static int IS_SHORT_CIRCUIT;
public static int IS_SIZE_ADJUSTING;
public static java_util_stream_StreamOpFlag[] $VALUES;
}
class java_util_stream_StreamOpFlag$Type extends java_lang_Enum {
public static java_util_stream_StreamOpFlag$Type SPLITERATOR;
public static java_util_stream_StreamOpFlag$Type STREAM;
public static java_util_stream_StreamOpFlag$Type OP;
public static java_util_stream_StreamOpFlag$Type TERMINAL_OP;
public static java_util_stream_StreamOpFlag$Type UPSTREAM_TERMINAL_OP;
public static java_util_stream_StreamOpFlag$Type[] $VALUES;
}
class java_util_stream_StreamOpFlag$MaskBuilder extends Object {
public Object map;
}
class java_util_EnumMap extends java_util_AbstractMap {
public java_lang_Class keyType;
public java_lang_Enum[] keyUniverse;
public Object[] vals;
public int size;
public static Object NULL;
public Object entrySet;
public static long serialVersionUID;
}
class java_util_EnumMap$1 extends Object {

}
class java_lang_Class$ReflectionData extends Object {
public java_lang_reflect_Field[] declaredFields;
public java_lang_reflect_Field[] publicFields;
public java_lang_reflect_Method[] declaredMethods;
public java_lang_reflect_Method[] publicMethods;
public java_lang_reflect_Constructor[] declaredConstructors;
public java_lang_reflect_Constructor[] publicConstructors;
public java_lang_reflect_Field[] declaredPublicFields;
public java_lang_reflect_Method[] declaredPublicMethods;
public java_lang_Class[] interfaces;
public java_lang_String simpleName;
public java_lang_String canonicalName;
public static java_lang_String NULL_SENTINEL;
public int redefinedCount;
}
class java_lang_Class$Atomic extends Object {
public static jdk_internal_misc_Unsafe unsafe;
public static long reflectionDataOffset;
public static long annotationTypeOffset;
public static long annotationDataOffset;
}
class java_lang_PublicMethods$MethodList extends Object {
public java_lang_reflect_Method method;
public java_lang_PublicMethods$MethodList next;
}
class java_lang_PublicMethods$Key extends Object {
public static jdk_internal_reflect_ReflectionFactory reflectionFactory;
public java_lang_String name;
public java_lang_Class[] ptypes;
}
class java_lang_Class$3 extends Object {
public java_lang_reflect_Method val$values;
public java_lang_Class this$0;
}
class sun_reflect_annotation_AnnotationParser extends Object {
public static Object[] EMPTY_ANNOTATIONS_ARRAY;
public static Object[] EMPTY_ANNOTATION_ARRAY;
}
class jdk_internal_reflect_NativeMethodAccessorImpl extends jdk_internal_reflect_MethodAccessorImpl {
public static jdk_internal_misc_Unsafe U;
public static long GENERATED_OFFSET;
public java_lang_reflect_Method method;
public jdk_internal_reflect_DelegatingMethodAccessorImpl parent;
public int numInvocations;
public int generated;
}
class jdk_internal_reflect_DelegatingMethodAccessorImpl extends jdk_internal_reflect_MethodAccessorImpl {
public jdk_internal_reflect_MethodAccessorImpl delegate;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800003800 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_nio_file_Files$$Lambda$6_0x0000000800017980 extends Object {
public java_nio_file_FileTreeIterator arg$1;
}
class java_util_function_Predicate extends Object {

}
class java_lang_invoke_LambdaForm$DMH_0x0000000800003c00 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_nio_file_Files$$Lambda$7_0x0000000800017da8 extends Object {
public Object arg$1;
}
class java_util_stream_ReferencePipeline$StatelessOp extends java_util_stream_ReferencePipeline {
public static boolean $assertionsDisabled;
}
class java_util_stream_ReferencePipeline$2 extends java_util_stream_ReferencePipeline$StatelessOp {
public Object val$predicate;
public java_util_stream_ReferencePipeline this$0;
}
class java_util_stream_StreamShape extends java_lang_Enum {
public static java_util_stream_StreamShape REFERENCE;
public static java_util_stream_StreamShape INT_VALUE;
public static java_util_stream_StreamShape LONG_VALUE;
public static java_util_stream_StreamShape DOUBLE_VALUE;
public static java_util_stream_StreamShape[] $VALUES;
}
class java_nio_file_Files$$Lambda$8_0x0000000800018e28 extends Object {

}
class java_lang_invoke_InnerClassLambdaMetafactory$1 extends Object {
public java_lang_Class val$innerClass;
public java_lang_invoke_InnerClassLambdaMetafactory this$0;
}
class jdk_internal_reflect_DelegatingConstructorAccessorImpl extends jdk_internal_reflect_ConstructorAccessorImpl {
public jdk_internal_reflect_ConstructorAccessorImpl delegate;
}
class java_lang_invoke_BoundMethodHandle extends java_lang_invoke_MethodHandle {
public static int FIELD_COUNT_THRESHOLD;
public static int FORM_EXPRESSION_THRESHOLD;
public static java_lang_invoke_BoundMethodHandle$Specializer SPECIALIZER;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_ClassSpecializer extends Object {
public java_lang_Class topClass;
public java_lang_Class keyType;
public java_lang_Class metaType;
public java_lang_invoke_MemberName sdAccessor;
public java_lang_String sdFieldName;
public Object transformMethods;
public java_lang_invoke_MethodType baseConstructorType;
public java_lang_invoke_ClassSpecializer$SpeciesData topSpecies;
public java_util_concurrent_ConcurrentHashMap cache;
public java_lang_invoke_ClassSpecializer$Factory factory;
public boolean topClassIsSuper;
public static Object CREATE_RESERVATION;
public static java_lang_String MH;
public static java_lang_String MH_SIG;
public static java_lang_String STABLE;
public static java_lang_String STABLE_SIG;
public static java_lang_String[] E_THROWABLE;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_BoundMethodHandle$Specializer extends java_lang_invoke_ClassSpecializer {
public static java_lang_invoke_MemberName SPECIES_DATA_ACCESSOR;
public static Object BMH_TRANSFORMS;
public static int TN_COPY_NO_EXTEND;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_ClassSpecializer$1 extends Object {

}
class java_lang_invoke_ClassSpecializer$SpeciesData extends Object {
public Object key;
public Object fieldTypes;
public java_lang_Class speciesCode;
public Object factories;
public Object getters;
public Object nominalGetters;
public java_lang_invoke_MethodHandle[] transformHelpers;
public static boolean $assertionsDisabled;
public java_lang_invoke_ClassSpecializer this$0;
}
class java_lang_invoke_BoundMethodHandle$SpeciesData extends java_lang_invoke_ClassSpecializer$SpeciesData {
public java_lang_invoke_BoundMethodHandle$SpeciesData[] extensions;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_ClassSpecializer$Factory extends Object {
public java_lang_String SPECIES_DATA;
public java_lang_String SPECIES_DATA_SIG;
public java_lang_String SPECIES_DATA_NAME;
public int SPECIES_DATA_MODS;
public Object TRANSFORM_NAMES;
public Object TRANSFORM_TYPES;
public Object TRANSFORM_MODS;
public static int ACC_PPP;
public static boolean $assertionsDisabled;
public java_lang_invoke_ClassSpecializer this$0;
}
class java_lang_invoke_BoundMethodHandle$Specializer$Factory extends java_lang_invoke_ClassSpecializer$Factory {
public java_lang_invoke_BoundMethodHandle$Specializer this$0;
}
class java_lang_invoke_SimpleMethodHandle extends java_lang_invoke_BoundMethodHandle {
public static java_lang_invoke_BoundMethodHandle$SpeciesData BMH_SPECIES;
}
class java_lang_NoSuchFieldException extends java_lang_ReflectiveOperationException {
public static long serialVersionUID;
}
class java_lang_invoke_BoundMethodHandle$Species_L extends java_lang_invoke_BoundMethodHandle {
public Object argL0;
public static java_lang_invoke_BoundMethodHandle$SpeciesData BMH_SPECIES;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800004000 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_DirectMethodHandle$2 extends Object {
public static int[] $SwitchMap$sun$invoke$util$Wrapper;
}
class java_lang_invoke_LambdaForm$MH_0x0000000800004400 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_DirectMethodHandle$Accessor extends java_lang_invoke_DirectMethodHandle {
public java_lang_Class fieldType;
public int fieldOffset;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_LambdaForm$MH_0x0000000800004800 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_DelegatingMethodHandle extends java_lang_invoke_MethodHandle {
public static java_lang_invoke_LambdaForm$NamedFunction NF_getTarget;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_MethodHandleImpl$IntrinsicMethodHandle extends java_lang_invoke_DelegatingMethodHandle {
public java_lang_invoke_MethodHandle target;
public java_lang_invoke_MethodHandleImpl$Intrinsic intrinsicName;
public Object intrinsicData;
}
class java_lang_invoke_DelegatingMethodHandle$Holder extends Object {
public java_lang_invoke_DelegatingMethodHandle this$0;
}
class sun_invoke_util_Wrapper$1 extends Object {
public static int[] $SwitchMap$sun$invoke$util$Wrapper;
}
class java_lang_invoke_LambdaForm$MH_0x0000000800004c00 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_LambdaFormEditor extends Object {
public java_lang_invoke_LambdaForm lambdaForm;
public static byte BIND_ARG;
public static byte ADD_ARG;
public static byte DUP_ARG;
public static byte SPREAD_ARGS;
public static byte FILTER_ARG;
public static byte FILTER_RETURN;
public static byte FILTER_RETURN_TO_ZERO;
public static byte COLLECT_ARGS;
public static byte COLLECT_ARGS_TO_VOID;
public static byte COLLECT_ARGS_TO_ARRAY;
public static byte FOLD_ARGS;
public static byte FOLD_ARGS_TO_VOID;
public static byte PERMUTE_ARGS;
public static byte LOCAL_TYPES;
public static byte FOLD_SELECT_ARGS;
public static byte FOLD_SELECT_ARGS_TO_VOID;
public static byte FILTER_SELECT_ARGS;
public static byte REPEAT_FILTER_ARGS;
public static int MIN_CACHE_ARRAY_SIZE;
public static int MAX_CACHE_ARRAY_SIZE;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_LambdaFormEditor$TransformKey extends Object {
public long packedBytes;
public byte[] fullBytes;
public static byte[] NO_BYTES;
public static boolean STRESS_TEST;
public static int PACKED_BYTE_SIZE;
public static int PACKED_BYTE_MASK;
public static int PACKED_BYTE_MAX_LENGTH;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_LambdaFormBuffer extends Object {
public int arity;
public int length;
public java_lang_invoke_LambdaForm$Name[] names;
public java_lang_invoke_LambdaForm$Name[] originalNames;
public byte flags;
public int firstChange;
public java_lang_invoke_LambdaForm$Name resultName;
public java_util_ArrayList dups;
public static int F_TRANS;
public static int F_OWNED;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_LambdaFormEditor$Transform extends java_lang_ref_SoftReference {
public long packedBytes;
public byte[] fullBytes;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_LambdaForm$MH_0x0000000800005000 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800005400 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_LambdaForm$MH_0x0000000800005800 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_util_stream_ReferencePipeline$3 extends java_util_stream_ReferencePipeline$StatelessOp {
public Object val$mapper;
public java_util_stream_ReferencePipeline this$0;
}
class jdk_internal_module_ModulePath$$Lambda$9_0x000000080001d830 extends Object {
public Object arg$1;
}
class jdk_internal_module_ModulePath$$Lambda$10_0x000000080001da78 extends Object {
public jdk_internal_module_ModulePath arg$1;
}
class jdk_internal_module_ModulePath$$Lambda$11_0x000000080001dcc0 extends Object {

}
class java_util_stream_ReferencePipeline$7 extends java_util_stream_ReferencePipeline$StatelessOp {
public Object val$mapper;
public java_util_stream_ReferencePipeline this$0;
}
class java_util_stream_Collectors extends Object {
public static Object CH_CONCURRENT_ID;
public static Object CH_CONCURRENT_NOID;
public static Object CH_ID;
public static Object CH_UNORDERED_ID;
public static Object CH_NOID;
public static Object CH_UNORDERED_NOID;
}
class java_util_stream_Collector$Characteristics extends java_lang_Enum {
public static java_util_stream_Collector$Characteristics CONCURRENT;
public static java_util_stream_Collector$Characteristics UNORDERED;
public static java_util_stream_Collector$Characteristics IDENTITY_FINISH;
public static java_util_stream_Collector$Characteristics[] $VALUES;
}
class java_util_EnumSet extends java_util_AbstractSet {
public static long serialVersionUID;
public java_lang_Class elementType;
public java_lang_Enum[] universe;
}
class java_util_RegularEnumSet extends java_util_EnumSet {
public static long serialVersionUID;
public long elements;
}
class java_util_stream_Collector extends Object {

}
class java_util_stream_Collectors$CollectorImpl extends Object {
public Object supplier;
public Object accumulator;
public Object combiner;
public Object finisher;
public Object characteristics;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800005c00 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_util_stream_Collectors$$Lambda$12_0x000000080001f740 extends Object {

}
class java_util_function_BiConsumer extends Object {

}
class java_lang_invoke_LambdaForm$DMH_0x0000000800006000 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_invoke_DirectMethodHandle$Interface extends java_lang_invoke_DirectMethodHandle {
public java_lang_Class refc;
public static boolean $assertionsDisabled;
}
class java_util_stream_Collectors$$Lambda$13_0x0000000800008000 extends Object {

}
class java_util_function_BiFunction extends Object {

}
class java_util_function_BinaryOperator extends Object {

}
class java_util_stream_Collectors$$Lambda$14_0x0000000800008630 extends Object {

}
class java_util_stream_Collectors$$Lambda$15_0x0000000800008878 extends Object {

}
class java_util_stream_ReduceOps extends Object {

}
class java_util_stream_TerminalOp extends Object {

}
class java_util_stream_ReduceOps$ReduceOp extends Object {
public java_util_stream_StreamShape inputShape;
}
class java_util_stream_ReduceOps$3 extends java_util_stream_ReduceOps$ReduceOp {
public Object val$combiner;
public Object val$accumulator;
public Object val$supplier;
public Object val$collector;
}
class java_util_stream_Sink extends Object {

}
class java_util_stream_TerminalSink extends Object {

}
class java_util_stream_ReduceOps$AccumulatingSink extends Object {

}
class java_util_stream_ReduceOps$Box extends Object {
public Object state;
}
class java_util_stream_ReduceOps$3ReducingSink extends java_util_stream_ReduceOps$Box {
public Object val$supplier;
public Object val$accumulator;
public Object val$combiner;
}
class java_util_stream_Sink$ChainedReference extends Object {
public Object downstream;
}
class java_util_stream_ReferencePipeline$7$1 extends java_util_stream_Sink$ChainedReference {
public boolean cancellationRequestedCalled;
public java_util_stream_ReferencePipeline$7 this$1;
}
class java_util_stream_ReferencePipeline$3$1 extends java_util_stream_Sink$ChainedReference {
public java_util_stream_ReferencePipeline$3 this$1;
}
class java_util_stream_ReferencePipeline$2$1 extends java_util_stream_Sink$ChainedReference {
public java_util_stream_ReferencePipeline$2 this$1;
}
class sun_nio_fs_BasicFileAttributesHolder extends Object {

}
class jdk_internal_loader_ArchivedClassLoaders extends Object {
public static jdk_internal_loader_ArchivedClassLoaders archivedClassLoaders;
public java_lang_ClassLoader bootLoader;
public java_lang_ClassLoader platformLoader;
public java_lang_ClassLoader appLoader;
public jdk_internal_module_ServicesCatalog[] servicesCatalogs;
public Object packageToModule;
}
class jdk_internal_loader_ClassLoaders$BootClassLoader extends jdk_internal_loader_BuiltinClassLoader {

}
class java_lang_ClassLoader$ParallelLoaders extends Object {
public static Object loaderTypes;
}
class java_util_WeakHashMap extends java_util_AbstractMap {
public static int DEFAULT_INITIAL_CAPACITY;
public static int MAXIMUM_CAPACITY;
public static float DEFAULT_LOAD_FACTOR;
public java_util_WeakHashMap$Entry[] table;
public int size;
public int threshold;
public float loadFactor;
public java_lang_ref_ReferenceQueue queue;
public int modCount;
public static Object NULL_KEY;
public Object entrySet;
}
class java_util_WeakHashMap$Entry extends java_lang_ref_WeakReference {
public Object value;
public int hash;
public java_util_WeakHashMap$Entry next;
}
class java_util_WeakHashMap$KeySet extends java_util_AbstractSet {
public java_util_WeakHashMap this$0;
}
class jdk_internal_loader_URLClassPath extends Object {
public static java_lang_String USER_AGENT_JAVA_VERSION;
public static java_lang_String JAVA_VERSION;
public static boolean DEBUG;
public static boolean DISABLE_JAR_CHECKING;
public static boolean DISABLE_ACC_CHECKING;
public static boolean DISABLE_CP_URL_CHECK;
public static boolean DEBUG_CP_URL_CHECK;
public java_util_ArrayList path;
public java_util_ArrayDeque unopenedUrls;
public java_util_ArrayList loaders;
public java_util_HashMap lmap;
public java_net_URLStreamHandler jarHandler;
public boolean closed;
public java_security_AccessControlContext acc;
public static Object JNUA;
}
class java_net_URLStreamHandlerFactory extends Object {

}
class java_net_URL$DefaultFactory extends Object {
public static java_lang_String PREFIX;
}
class jdk_internal_access_JavaNetURLAccess extends Object {

}
class java_net_URL$3 extends Object {

}
class sun_net_www_ParseUtil extends Object {
public static java_util_HexFormat HEX_UPPERCASE;
public static long L_DIGIT;
public static long H_DIGIT;
public static long L_HEX;
public static long H_HEX;
public static long L_UPALPHA;
public static long H_UPALPHA;
public static long L_LOWALPHA;
public static long H_LOWALPHA;
public static long L_ALPHA;
public static long H_ALPHA;
public static long L_ALPHANUM;
public static long H_ALPHANUM;
public static long L_MARK;
public static long H_MARK;
public static long L_UNRESERVED;
public static long H_UNRESERVED;
public static long L_RESERVED;
public static long H_RESERVED;
public static long L_ESCAPED;
public static long H_ESCAPED;
public static long L_URIC;
public static long H_URIC;
public static long L_PCHAR;
public static long H_PCHAR;
public static long L_PATH;
public static long H_PATH;
public static long L_DASH;
public static long H_DASH;
public static long L_USERINFO;
public static long H_USERINFO;
public static long L_REG_NAME;
public static long H_REG_NAME;
public static long L_SERVER;
public static long H_SERVER;
public static long L_ENCODED;
public static long H_ENCODED;
public static boolean $assertionsDisabled;
}
class java_net_URLStreamHandler extends Object {

}
class sun_net_www_protocol_file_Handler extends java_net_URLStreamHandler {

}
class sun_net_util_IPAddressUtil extends Object {
public static int INADDR4SZ;
public static int INADDR16SZ;
public static int INT16SZ;
public static java_util_concurrent_ConcurrentHashMap cache;
public static long L_IPV6_DELIMS;
public static long H_IPV6_DELIMS;
public static long L_GEN_DELIMS;
public static long H_GEN_DELIMS;
public static long L_AUTH_DELIMS;
public static long H_AUTH_DELIMS;
public static long L_COLON;
public static long H_COLON;
public static long L_SLASH;
public static long H_SLASH;
public static long L_BACKSLASH;
public static long H_BACKSLASH;
public static long L_NON_PRINTABLE;
public static long H_NON_PRINTABLE;
public static long L_EXCLUDE;
public static long H_EXCLUDE;
public static char[] OTHERS;
}
class jdk_internal_module_ServicesCatalog extends Object {
public Object map;
public static jdk_internal_loader_ClassLoaderValue CLV;
}
class jdk_internal_loader_AbstractClassLoaderValue extends Object {
public static Object JLA;
}
class jdk_internal_loader_ClassLoaderValue extends jdk_internal_loader_AbstractClassLoaderValue {

}
class jdk_internal_loader_BuiltinClassLoader$LoadedModule extends Object {
public jdk_internal_loader_BuiltinClassLoader loader;
public java_lang_module_ModuleReference mref;
public java_net_URI uri;
public java_net_URL codeSourceURL;
}
class jdk_internal_module_DefaultRoots extends Object {

}
class java_lang_invoke_LambdaForm$DMH_0x0000000800006400 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_lang_Module$ReflectionData extends Object {
public static java_lang_WeakPairMap reads;
public static java_lang_WeakPairMap exports;
public static java_lang_WeakPairMap uses;
}
class java_lang_WeakPairMap extends Object {
public java_util_concurrent_ConcurrentHashMap map;
public java_lang_ref_ReferenceQueue queue;
}
class java_lang_WeakPairMap$Pair extends Object {

}
class java_lang_WeakPairMap$Pair$Lookup extends Object {
public Object k1;
public Object k2;
}
class jdk_internal_module_SystemModuleFinders$1$$Lambda$16_0x000000080000e858 extends Object {
public Object arg$1;
}
class java_util_HashMap$HashMapSpliterator extends Object {
public java_util_HashMap map;
public java_util_HashMap$Node current;
public int index;
public int fence;
public int est;
public int expectedModCount;
}
class java_util_HashMap$ValueSpliterator extends java_util_HashMap$HashMapSpliterator {
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_util_HashMap$KeySpliterator extends java_util_HashMap$HashMapSpliterator {
public static int ORDERED;
public static int DISTINCT;
public static int SORTED;
public static int SIZED;
public static int NONNULL;
public static int IMMUTABLE;
public static int CONCURRENT;
public static int SUBSIZED;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800006800 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class jdk_internal_module_DefaultRoots$$Lambda$17_0x000000080000f180 extends Object {

}
class jdk_internal_module_DefaultRoots$$Lambda$18_0x000000080000f3d0 extends Object {

}
class jdk_internal_module_DefaultRoots$$Lambda$19_0x000000080000f610 extends Object {
public Object arg$1;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800006c00 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class jdk_internal_module_DefaultRoots$$Lambda$20_0x000000080000f868 extends Object {

}
class jdk_internal_module_ModuleResolution extends Object {
public int value;
}
class jdk_internal_module_DefaultRoots$$Lambda$21_0x000000080000fcb0 extends Object {

}
class java_util_stream_FindOps extends Object {

}
class java_util_stream_FindOps$FindSink extends Object {
public boolean hasValue;
public Object value;
}
class java_util_stream_FindOps$FindSink$OfRef extends java_util_stream_FindOps$FindSink {
public static Object OP_FIND_FIRST;
public static Object OP_FIND_ANY;
}
class java_util_stream_FindOps$FindOp extends Object {
public java_util_stream_StreamShape shape;
public int opFlags;
public Object emptyValue;
public Object presentPredicate;
public Object sinkSupplier;
}
class java_lang_invoke_LambdaForm$DMH_0x0000000800080000 extends Object {
public static java_lang_invoke_LambdaForm _D_0;
}
class java_util_stream_FindOps$FindSink$OfRef$$Lambda$22_0x0000000800007a38 extends Object {

}
class java_util_stream_FindOps$FindSink$OfRef$$Lambda$23_0x0000000800007c88 extends Object {

}
class java_util_stream_FindOps$FindSink$OfRef$$Lambda$24_0x00000008000c0000 extends Object {

}
class java_util_stream_FindOps$FindSink$OfRef$$Lambda$25_0x00000008000c0250 extends Object {

}
class java_lang_module_Configuration extends Object {
public static java_lang_module_Configuration EMPTY_CONFIGURATION;
public Object parents;
public Object graph;
public Object modules;
public Object nameToModule;
public java_lang_String targetPlatform;
public Object allConfigurations;
public static boolean $assertionsDisabled;
}
class java_lang_module_Resolver extends Object {
public Object beforeFinder;
public Object parents;
public Object afterFinder;
public java_io_PrintStream traceOutput;
public Object nameToReference;
public boolean haveAllAutomaticModules;
public java_lang_String targetPlatform;
public Object visited;
public Object visitPath;
public static boolean $assertionsDisabled;
}
class java_lang_module_ModuleFinder$1 extends Object {

}
class java_lang_ModuleLayer extends Object {
public static java_lang_ModuleLayer EMPTY_LAYER;
public java_lang_module_Configuration cf;
public Object parents;
public Object nameToModule;
public Object allLayers;
public Object modules;
public jdk_internal_module_ServicesCatalog servicesCatalog;
public static jdk_internal_loader_ClassLoaderValue CLV;
}
class java_util_LinkedHashSet extends java_util_HashSet {
public static long serialVersionUID;
}
class java_util_LinkedHashMap extends java_util_HashMap {
public static long serialVersionUID;
public java_util_LinkedHashMap$Entry head;
public java_util_LinkedHashMap$Entry tail;
public boolean accessOrder;
}
class java_lang_module_ResolvedModule extends Object {
public java_lang_module_Configuration cf;
public java_lang_module_ModuleReference mref;
}
class jdk_internal_module_ModuleLoaderMap extends Object {

}
class jdk_internal_module_ModuleLoaderMap$Mapper extends Object {
public static java_lang_ClassLoader PLATFORM_CLASSLOADER;
public static java_lang_ClassLoader APP_CLASSLOADER;
public static java_lang_Integer PLATFORM_LOADER_INDEX;
public static java_lang_Integer APP_LOADER_INDEX;
public Object map;
}
class jdk_internal_module_ModuleLoaderMap$Modules extends Object {
public static Object bootModules;
public static Object platformModules;
}
class jdk_internal_loader_AbstractClassLoaderValue$Memoizer extends Object {
public java_lang_ClassLoader cl;
public jdk_internal_loader_AbstractClassLoaderValue clv;
public Object mappingFunction;
public Object v;
public java_lang_Throwable t;
public boolean inCall;
}
class jdk_internal_module_ServicesCatalog$ServiceProvider extends Object {
public java_lang_Module module;
public java_lang_String providerName;
}
class java_util_concurrent_CopyOnWriteArrayList extends Object {
public static long serialVersionUID;
public Object lock;
public Object[] array;
}
class java_lang_ModuleLayer$Controller extends Object {
public java_lang_ModuleLayer layer;
}
class jdk_internal_module_ModuleBootstrap$SafeModuleFinder extends Object {
public Object mrefs;
public Object nameToModule;
}
class java_lang_invoke_StringConcatFactory extends Object {
public static char TAG_ARG;
public static char TAG_CONST;
public static int MAX_INDY_CONCAT_ARG_SLOTS;
public static Object JLA;
public static Object PREPEND;
public static Object NULL_PREPEND;
public static Object MIX;
public static java_lang_invoke_MethodHandle SIMPLE_CONCAT;
public static java_lang_invoke_MethodHandle NEW_STRING;
public static java_lang_invoke_MethodHandle NEW_ARRAY_SUFFIX;
public static java_lang_invoke_MethodHandle NEW_ARRAY;
public static java_lang_invoke_MethodHandle OBJECT_STRINGIFIER;
public static java_lang_invoke_MethodHandle FLOAT_STRINGIFIER;
public static java_lang_invoke_MethodHandle DOUBLE_STRINGIFIER;
public static java_lang_invoke_MethodHandle INT_STRINGIFIER;
public static java_lang_invoke_MethodHandle LONG_STRINGIFIER;
public static java_lang_invoke_MethodHandle CHAR_STRINGIFIER;
public static java_lang_invoke_MethodHandle BOOLEAN_STRINGIFIER;
public static java_lang_invoke_MethodHandle NEW_STRINGIFIER;
public static Object PREPENDERS;
public static Object NULL_PREPENDERS;
public static Object MIXERS;
public static long INITIAL_CODER;
public static boolean $assertionsDisabled;
}
class java_lang_invoke_StringConcatFactory$1 extends Object {

}
class java_lang_invoke_StringConcatFactory$2 extends Object {

}
class java_lang_invoke_StringConcatFactory$3 extends Object {

}
class sun_launcher_LauncherHelper extends Object {
public static java_lang_String JAVAFX_APPLICATION_MARKER;
public static java_lang_String JAVAFX_APPLICATION_CLASS_NAME;
public static java_lang_String JAVAFX_FXHELPER_CLASS_NAME_SUFFIX;
public static java_lang_String LAUNCHER_AGENT_CLASS;
public static java_lang_String MAIN_CLASS;
public static java_lang_String ADD_EXPORTS;
public static java_lang_String ADD_OPENS;
public static java_lang_StringBuilder outBuf;
public static java_lang_String INDENT;
public static java_lang_String VM_SETTINGS;
public static java_lang_String PROP_SETTINGS;
public static java_lang_String LOCALE_SETTINGS;
public static java_lang_String diagprop;
public static boolean trace;
public static java_lang_String defaultBundleName;
public static java_io_PrintStream ostream;
public static java_lang_Class appClass;
public static int LM_UNKNOWN;
public static int LM_CLASS;
public static int LM_JAR;
public static int LM_MODULE;
public static int LM_SOURCE;
public static java_lang_String encprop;
public static java_lang_String encoding;
public static boolean isCharsetSupported;
}
class sun_net_util_URLUtil extends Object {

}
class java_util_Locale extends Object {
public static java_util_Locale ENGLISH;
public static java_util_Locale FRENCH;
public static java_util_Locale GERMAN;
public static java_util_Locale ITALIAN;
public static java_util_Locale JAPANESE;
public static java_util_Locale KOREAN;
public static java_util_Locale CHINESE;
public static java_util_Locale SIMPLIFIED_CHINESE;
public static java_util_Locale TRADITIONAL_CHINESE;
public static java_util_Locale FRANCE;
public static java_util_Locale GERMANY;
public static java_util_Locale ITALY;
public static java_util_Locale JAPAN;
public static java_util_Locale KOREA;
public static java_util_Locale UK;
public static java_util_Locale US;
public static java_util_Locale CANADA;
public static java_util_Locale CANADA_FRENCH;
public static java_util_Locale ROOT;
public static Object CONSTANT_LOCALES;
public static java_util_Locale CHINA;
public static java_util_Locale PRC;
public static java_util_Locale TAIWAN;
public static char PRIVATE_USE_EXTENSION;
public static char UNICODE_LOCALE_EXTENSION;
public static long serialVersionUID;
public static int DISPLAY_LANGUAGE;
public static int DISPLAY_COUNTRY;
public static int DISPLAY_VARIANT;
public static int DISPLAY_SCRIPT;
public static int DISPLAY_UEXT_KEY;
public static int DISPLAY_UEXT_TYPE;
public sun_util_locale_BaseLocale baseLocale;
public Object localeExtensions;
public int hashCodeValue;
public static java_util_Locale defaultLocale;
public static java_util_Locale defaultDisplayLocale;
public static java_util_Locale defaultFormatLocale;
public java_lang_String languageTag;
public static java_io_ObjectStreamField[] serialPersistentFields;
public static java_lang_String[] isoLanguages;
public static java_lang_String[] isoCountries;
public static boolean $assertionsDisabled;
}
class sun_util_locale_BaseLocale extends Object {
public static sun_util_locale_BaseLocale[] constantBaseLocales;
public static byte ENGLISH;
public static byte FRENCH;
public static byte GERMAN;
public static byte ITALIAN;
public static byte JAPANESE;
public static byte KOREAN;
public static byte CHINESE;
public static byte SIMPLIFIED_CHINESE;
public static byte TRADITIONAL_CHINESE;
public static byte FRANCE;
public static byte GERMANY;
public static byte ITALY;
public static byte JAPAN;
public static byte KOREA;
public static byte UK;
public static byte US;
public static byte CANADA;
public static byte CANADA_FRENCH;
public static byte ROOT;
public static byte NUM_CONSTANTS;
public static java_lang_String SEP;
public java_lang_String language;
public java_lang_String script;
public java_lang_String region;
public java_lang_String variant;
public int hash;
public static boolean OLD_ISO_CODES;
}
class sun_util_locale_LocaleUtils extends Object {

}
class java_security_PrivilegedExceptionAction extends Object {

}
class jdk_internal_loader_URLClassPath$3 extends Object {
public java_net_URL val$url;
public jdk_internal_loader_URLClassPath this$0;
}
class jdk_internal_loader_URLClassPath$Loader extends Object {
public java_net_URL base;
public java_util_jar_JarFile jarfile;
}
class jdk_internal_loader_URLClassPath$FileLoader extends jdk_internal_loader_URLClassPath$Loader {
public java_io_File dir;
}
class jdk_internal_loader_Resource extends Object {
public java_io_InputStream cis;
}
class jdk_internal_loader_URLClassPath$FileLoader$1 extends jdk_internal_loader_Resource {
public java_lang_String val$name;
public java_net_URL val$url;
public java_io_File val$file;
public jdk_internal_loader_URLClassPath$FileLoader this$0;
}
class java_io_FileCleanable extends jdk_internal_ref_PhantomCleanable {
public static Object fdAccess;
public int fd;
public long handle;
}
class sun_nio_ByteBuffered extends Object {

}
class java_io_FileInputStream$1 extends Object {
public java_io_FileInputStream this$0;
}
class java_security_SecureClassLoader$CodeSourceKey extends Object {
public java_security_CodeSource cs;
}
class java_security_SecureClassLoader$1 extends Object {
public java_security_CodeSource val$cs;
public java_security_SecureClassLoader this$0;
}
class java_security_PermissionCollection extends Object {
public static long serialVersionUID;
public boolean readOnly;
}
class sun_security_util_LazyCodeSourcePermissionCollection extends java_security_PermissionCollection {
public static long serialVersionUID;
public java_security_PermissionCollection perms;
public java_security_CodeSource cs;
public boolean permissionAdded;
}
class java_security_Permissions extends java_security_PermissionCollection {
public java_util_concurrent_ConcurrentHashMap permsMap;
public boolean hasUnresolved;
public java_security_PermissionCollection allPermission;
public static long serialVersionUID;
public static java_io_ObjectStreamField[] serialPersistentFields;
}
class java_lang_RuntimePermission extends java_security_BasicPermission {
public static long serialVersionUID;
}
class java_security_BasicPermissionCollection extends java_security_PermissionCollection {
public static long serialVersionUID;
public java_util_concurrent_ConcurrentHashMap perms;
public boolean all_allowed;
public java_lang_Class permClass;
public static java_io_ObjectStreamField[] serialPersistentFields;
}
class java_security_AllPermission extends java_security_Permission {
public static long serialVersionUID;
}
class java_security_UnresolvedPermission extends java_security_Permission {
public static long serialVersionUID;
public static sun_security_util_Debug debug;
public java_lang_String type;
public java_lang_String name;
public java_lang_String actions;
public java_security_cert_Certificate[] certs;
public static java_lang_Class[] PARAMS0;
public static java_lang_Class[] PARAMS1;
public static java_lang_Class[] PARAMS2;
}
class java_security_SecureClassLoader$DebugHolder extends Object {
public static sun_security_util_Debug debug;
}
class sun_security_util_Debug extends Object {
public java_lang_String prefix;
public static java_lang_String args;
}
class Web extends Object {

}
class java_lang_NamedPackage extends Object {
public java_lang_String name;
public java_lang_Module module;
}
class Request extends Object {
public static java_lang_String BASIC_AUTH;
public static java_lang_String FORM_AUTH;
public static java_lang_String CLIENT_CERT_AUTH;
public static java_lang_String DIGEST_AUTH;
public RequestParameter requestParameter;
public java_lang_String requestUrl;
public java_lang_String requestMethod;
public RequestHeader requestHeader;
}
class ResponseBody extends Object {
public Page[] pages;
}
class RequestParameter extends Object {
public int pageSize;
public int pageNum;
}
class Response extends Object {
public int statusCode;
public ResponseHeader responseHeader;
public ResponseBody responseBody;
}
class MyThread extends java_lang_Thread {
public Request request;
public Response response;
}
class RequestHeader extends Object {
public java_lang_String accept;
public java_lang_String acceptEncoding;
public java_lang_String acceptLanguage;
public java_lang_String connection;
public java_lang_String cookie;
public java_lang_String host;
public java_lang_String Referer;
public java_lang_String secChUa;
public java_lang_String SecChUaMobile;
public java_lang_String SecChUaPlatform;
public java_lang_String SecFetchDest;
public java_lang_String SecFetchMode;
public java_lang_String SecFetchSite;
public java_lang_String UpgradeInsecureRequests;
public java_lang_String UserAgent;
}
class java_util_IdentityHashMap$IdentityHashMapIterator extends Object {
public int index;
public int expectedModCount;
public int lastReturnedIndex;
public boolean indexValid;
public Object[] traversalTable;
public java_util_IdentityHashMap this$0;
}
class java_util_IdentityHashMap$KeyIterator extends java_util_IdentityHashMap$IdentityHashMapIterator {
public java_util_IdentityHashMap this$0;
}
class ResponseHeader extends Object {
public int Bdpagetype;
public java_lang_String Bdqid;
public java_lang_String CacheControl;
public int Ckpacknum;
public java_lang_String Ckrndstr;
public java_lang_String Connection;
public java_lang_String ContentEncoding;
public java_lang_String ContentSecurity_Policy;
public java_lang_String ContentType;
public java_lang_String Date;
public java_lang_String Server;
public java_lang_String SetCookie;
public java_lang_String StrictTransportSecurity;
public long Traceid;
public java_lang_String TransferEncoding;
public java_lang_String Vary;
public java_lang_String XUaCompatible;
}
class java_util_concurrent_ConcurrentHashMap$ForwardingNode extends java_util_concurrent_ConcurrentHashMap$Node {
public java_util_concurrent_ConcurrentHashMap$Node[] nextTable;
}
class Page extends Object {
public java_lang_String address;
public java_lang_String expectedDigest;
public int expectedStatus;
public byte[] contents;
}
class java_lang_Shutdown extends Object {
public static int MAX_SYSTEM_HOOKS;
public static Object[] hooks;
public static int currentRunningHook;
public static Object lock;
public static Object haltLock;
}
class java_lang_Shutdown$Lock extends Object {

}

public class WebMain {
public static void main(String[] args){
Main0.f();
Main1.f();
long start_total = System.nanoTime();
for(int index = 0; index < 50000; index += 1){
Web___main__ArrLjava_lang_String_V_v0(null);
}
long end_total = System.nanoTime();
System.out.println("web: ms = " + (end_total - start_total) / 1000000.0);
}
public static void Web___main__ArrLjava_lang_String_V_v0(java_lang_String[] java_lang_string_array_1_0){
java_lang_String[] java_lang_string_array_1_01111 = java_lang_string_array_1_0;
Web___batchRun__III_V_v0();
Web___batchRun__III_V_v1();
}
public static void Web___batchRun__III_V_v0(){
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[8];
java_lang_string_0.value = byte_array_1_0;
Main0.globalVar_0.componentType = Main0.globalVar_1;
Main0.globalVar_0.classLoader = Main0.globalVar_2;
Main0.globalVar_0.module = Main0.globalVar_3;
MyThread[] mythread_array_1_0 = new MyThread[3];
MyThread[] mythread_array_1_1 = (MyThread[])(mythread_array_1_0);
Request request_0 = (Request)(Web___ConstructRequest__II_LRequest_v0());
Request request_1 = (Request)(request_0);
MyThread mythread_0 = new MyThread();
MyThread_____init____LRequestLResponse_V_v0((MyThread)(Main0.globalVar_4), (Request)(request_0));
mythread_array_1_0[0] = (MyThread)(Main0.globalVar_4);
java_lang_Thread___start___V_v0(Main0.globalVar_4);
Request request_2 = (Request)(Web___ConstructRequest__II_LRequest_v1());
request_0 = (Request)(request_2);
MyThread mythread_1 = new MyThread();
MyThread_____init____LRequestLResponse_V_v1((MyThread)(Main0.globalVar_5), (Request)(request_2));
mythread_array_1_0[1] = (MyThread)(Main0.globalVar_5);
java_lang_Thread___start___V_v1(Main0.globalVar_5);
Request request_3 = (Request)(Web___ConstructRequest__II_LRequest_v1());
request_2 = (Request)(request_3);
MyThread mythread_2 = new MyThread();
MyThread_____init____LRequestLResponse_V_v2((MyThread)(Main0.globalVar_6), (Request)(request_3));
mythread_array_1_0[2] = (MyThread)(Main0.globalVar_6);
java_lang_Thread___start___V_v2(Main0.globalVar_6);
}
public static Request Web___ConstructRequest__II_LRequest_v0(){
Request request_0 = new Request();
Request_____init_____V_v0((Request)(request_0));
Request request_1 = (Request)(request_0);
Web___initRequest__LRequestII_V_v0((Request)(request_0));
return (Request)(request_0);
}
public static void Request_____init_____V_v0(Request request_0){
Request request_01111 = request_0;
java_lang_Object_____init_____V_v31((Request)(request_0));
}
public static void java_lang_Object_____init_____V_v31(Request request_0){
Request request_01111 = request_0;
}
public static void Web___initRequest__LRequestII_V_v0(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = new RequestParameter();
RequestParameter_____init_____V_v0((RequestParameter)(requestparameter_0));
RequestParameter requestparameter_1 = (RequestParameter)(requestparameter_0);
Web___initRequestParameter__LRequestParameterII_V_v0((RequestParameter)(requestparameter_0));
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[13];
java_lang_string_0.value = byte_array_1_0;
RequestHeader requestheader_0 = new RequestHeader();
RequestHeader_____init_____V_v0((RequestHeader)(requestheader_0));
RequestHeader requestheader_1 = (RequestHeader)(requestheader_0);
request_0.requestParameter = requestparameter_0;
request_0.requestHeader = requestheader_0;
}
public static void RequestParameter_____init_____V_v0(RequestParameter requestparameter_0){
RequestParameter requestparameter_01111 = requestparameter_0;
java_lang_Object_____init_____V_v32((RequestParameter)(requestparameter_0));
}
public static void java_lang_Object_____init_____V_v32(RequestParameter requestparameter_0){
RequestParameter requestparameter_01111 = requestparameter_0;
}
public static void Web___initRequestParameter__LRequestParameterII_V_v0(RequestParameter requestparameter_0){
RequestParameter requestparameter_01111 = requestparameter_0;
}
public static void RequestHeader_____init_____V_v0(RequestHeader requestheader_0){
RequestHeader requestheader_01111 = requestheader_0;
java_lang_Object_____init_____V_v61((RequestHeader)(requestheader_0));
}
public static void java_lang_Object_____init_____V_v61(RequestHeader requestheader_0){
RequestHeader requestheader_01111 = requestheader_0;
}
public static void MyThread_____init____LRequestLResponse_V_v0(MyThread mythread_0, Request request_0){
MyThread mythread_01111 = mythread_0;
Request request_01111 = request_0;
Main0.globalVar_4.request = request_0;
Main0.globalVar_4.response = null;
}
public static void java_lang_Thread___start___V_v0(MyThread mythread_0){
ArrayList<Thread> ScopeLocalThreadsPool = new ArrayList<>();

MyThread mythread_01111 = mythread_0;
ScopeLocalThreadsPool.add(new Thread(() -> Thread_0___MyThread___run___V(mythread_0)));
ScopeLocalThreadsPool.get(ScopeLocalThreadsPool.size()-1).start();
ScopeLocalThreadsPool.forEach(thread -> {
try {
thread.join();
} catch (InterruptedException e) {
e.printStackTrace();
}
});

}
public static Request Web___ConstructRequest__II_LRequest_v1(){
Request request_0 = new Request();
Request_____init_____V_v0((Request)(request_0));
Request request_1 = (Request)(request_0);
Web___initRequest__LRequestII_V_v1((Request)(request_0));
return (Request)(request_0);
}
public static void Web___initRequest__LRequestII_V_v1(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = new RequestParameter();
RequestParameter_____init_____V_v0((RequestParameter)(requestparameter_0));
RequestParameter requestparameter_1 = (RequestParameter)(requestparameter_0);
Web___initRequestParameter__LRequestParameterII_V_v0((RequestParameter)(requestparameter_0));
RequestHeader requestheader_0 = new RequestHeader();
RequestHeader_____init_____V_v0((RequestHeader)(requestheader_0));
RequestHeader requestheader_1 = (RequestHeader)(requestheader_0);
request_0.requestParameter = requestparameter_0;
request_0.requestHeader = requestheader_0;
}
public static void MyThread_____init____LRequestLResponse_V_v1(MyThread mythread_0, Request request_0){
MyThread mythread_01111 = mythread_0;
Request request_01111 = request_0;
Main0.globalVar_5.request = request_0;
Main0.globalVar_5.response = null;
}
public static void java_lang_Thread___start___V_v1(MyThread mythread_0){
ArrayList<Thread> ScopeLocalThreadsPool = new ArrayList<>();

MyThread mythread_01111 = mythread_0;
ScopeLocalThreadsPool.add(new Thread(() -> Thread_1___MyThread___run___V(mythread_0)));
ScopeLocalThreadsPool.get(ScopeLocalThreadsPool.size()-1).start();
ScopeLocalThreadsPool.forEach(thread -> {
try {
thread.join();
} catch (InterruptedException e) {
e.printStackTrace();
}
});

}
public static void MyThread_____init____LRequestLResponse_V_v2(MyThread mythread_0, Request request_0){
MyThread mythread_01111 = mythread_0;
Request request_01111 = request_0;
Main0.globalVar_6.request = request_0;
Main0.globalVar_6.response = null;
}
public static void java_lang_Thread___start___V_v2(MyThread mythread_0){
ArrayList<Thread> ScopeLocalThreadsPool = new ArrayList<>();

MyThread mythread_01111 = mythread_0;
ScopeLocalThreadsPool.add(new Thread(() -> Thread_2___MyThread___run___V(mythread_0)));
ScopeLocalThreadsPool.get(ScopeLocalThreadsPool.size()-1).start();
ScopeLocalThreadsPool.forEach(thread -> {
try {
thread.join();
} catch (InterruptedException e) {
e.printStackTrace();
}
});

}
public static void Web___batchRun__III_V_v1(){
MyThread[] mythread_array_1_0 = new MyThread[3];
MyThread[] mythread_array_1_1 = (MyThread[])(mythread_array_1_0);
Request request_0 = (Request)(Web___ConstructRequest__II_LRequest_v1());
Request request_1 = (Request)(request_0);
MyThread mythread_0 = new MyThread();
MyThread_____init____LRequestLResponse_V_v3((MyThread)(Main0.globalVar_7), (Request)(request_0));
mythread_array_1_0[0] = (MyThread)(Main0.globalVar_7);
java_lang_Thread___start___V_v3(Main0.globalVar_7);
Request request_2 = (Request)(Web___ConstructRequest__II_LRequest_v1());
request_0 = (Request)(request_2);
MyThread mythread_1 = new MyThread();
MyThread_____init____LRequestLResponse_V_v4((MyThread)(Main0.globalVar_8), (Request)(request_2));
mythread_array_1_0[1] = (MyThread)(Main0.globalVar_8);
java_lang_Thread___start___V_v4(Main0.globalVar_8);
Request request_3 = (Request)(Web___ConstructRequest__II_LRequest_v1());
request_2 = (Request)(request_3);
MyThread mythread_2 = new MyThread();
MyThread_____init____LRequestLResponse_V_v5((MyThread)(Main0.globalVar_9), (Request)(request_3));
mythread_array_1_0[2] = (MyThread)(Main0.globalVar_9);
java_lang_Thread___start___V_v5(Main0.globalVar_9);
}
public static void MyThread_____init____LRequestLResponse_V_v3(MyThread mythread_0, Request request_0){
MyThread mythread_01111 = mythread_0;
Request request_01111 = request_0;
Main0.globalVar_7.request = request_0;
Main0.globalVar_7.response = null;
}
public static void java_lang_Thread___start___V_v3(MyThread mythread_0){
ArrayList<Thread> ScopeLocalThreadsPool = new ArrayList<>();

MyThread mythread_01111 = mythread_0;
ScopeLocalThreadsPool.add(new Thread(() -> Thread_3___MyThread___run___V(mythread_0)));
ScopeLocalThreadsPool.get(ScopeLocalThreadsPool.size()-1).start();
ScopeLocalThreadsPool.forEach(thread -> {
try {
thread.join();
} catch (InterruptedException e) {
e.printStackTrace();
}
});

}
public static void MyThread_____init____LRequestLResponse_V_v4(MyThread mythread_0, Request request_0){
MyThread mythread_01111 = mythread_0;
Request request_01111 = request_0;
Main0.globalVar_8.request = request_0;
Main0.globalVar_8.response = null;
}
public static void java_lang_Thread___start___V_v4(MyThread mythread_0){
ArrayList<Thread> ScopeLocalThreadsPool = new ArrayList<>();

MyThread mythread_01111 = mythread_0;
ScopeLocalThreadsPool.add(new Thread(() -> Thread_4___MyThread___run___V(mythread_0)));
ScopeLocalThreadsPool.get(ScopeLocalThreadsPool.size()-1).start();
ScopeLocalThreadsPool.forEach(thread -> {
try {
thread.join();
} catch (InterruptedException e) {
e.printStackTrace();
}
});

}
public static void MyThread_____init____LRequestLResponse_V_v5(MyThread mythread_0, Request request_0){
MyThread mythread_01111 = mythread_0;
Request request_01111 = request_0;
Main0.globalVar_9.request = request_0;
Main0.globalVar_9.response = null;
}
public static void java_lang_Thread___start___V_v5(MyThread mythread_0){
ArrayList<Thread> ScopeLocalThreadsPool = new ArrayList<>();

MyThread mythread_01111 = mythread_0;
ScopeLocalThreadsPool.add(new Thread(() -> Thread_5___MyThread___run___V(mythread_0)));
ScopeLocalThreadsPool.get(ScopeLocalThreadsPool.size()-1).start();
ScopeLocalThreadsPool.forEach(thread -> {
try {
thread.join();
} catch (InterruptedException e) {
e.printStackTrace();
}
});

}
public static void Thread_3___MyThread___run___V(MyThread mythread_0){
MyThread mythread_01111 = mythread_0;
Web___service__LRequestLResponse_V_v0((Request)(Main0.globalVar_7.request));
}
public static void Web___service__LRequestLResponse_V_v0(Request request_0){
Request request_01111 = request_0;
Web___getRequestPageNum__LRequest_I_v0((Request)(request_0));
Web___getRequestPageSize__LRequest_I_v0((Request)(request_0));
Response response_0 = new Response();
Response_____init_____V_v0((Response)(response_0));
Response response_1 = (Response)(response_0);
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[14];
java_lang_string_0.value = byte_array_1_0;
ResponseHeader responseheader_0 = new ResponseHeader();
ResponseHeader_____init_____V_v0((ResponseHeader)(responseheader_0));
ResponseHeader responseheader_1 = (ResponseHeader)(responseheader_0);
ResponseBody responsebody_0 = new ResponseBody();
ResponseBody_____init_____V_v0((ResponseBody)(responsebody_0));
ResponseBody responsebody_1 = (ResponseBody)(responsebody_0);
Web___initResponseBody__LResponseBodyII_V_v0((ResponseBody)(responsebody_0));
response_0.responseHeader = responseheader_0;
response_0.responseBody = responsebody_0;
}
public static void Web___getRequestPageNum__LRequest_I_v0(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Web___getRequestPageSize__LRequest_I_v0(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Response_____init_____V_v0(Response response_0){
Response response_01111 = response_0;
java_lang_Object_____init_____V_v101((Response)(response_0));
}
public static void java_lang_Object_____init_____V_v101(Response response_0){
Response response_01111 = response_0;
}
public static void ResponseHeader_____init_____V_v0(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
java_lang_Object_____init_____V_v103((ResponseHeader)(responseheader_0));
}
public static void java_lang_Object_____init_____V_v103(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
}
public static void ResponseBody_____init_____V_v0(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_Object_____init_____V_v104((ResponseBody)(responsebody_0));
}
public static void java_lang_Object_____init_____V_v104(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
}
public static void Web___initResponseBody__LResponseBodyII_V_v0(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[4];
java_lang_string_0.value = byte_array_1_0;
Page[] page_array_1_0 = new Page[5];
Page[] page_array_1_1 = (Page[])(page_array_1_0);
Page page_0 = new Page();
Page_____init_____V_v0((Page)(page_0));
page_array_1_0[0] = (Page)(page_0);
byte[] byte_array_1_1 = new byte[30];
byte[] byte_array_1_2 = (byte[])(byte_array_1_1);
page_0.contents = byte_array_1_1;
Page page_1 = new Page();
Page_____init_____V_v0((Page)(page_1));
page_array_1_0[1] = (Page)(page_1);
byte[] byte_array_1_3 = new byte[30];
byte_array_1_1 = (byte[])(byte_array_1_3);
page_1.contents = byte_array_1_3;
Page page_2 = new Page();
Page_____init_____V_v0((Page)(page_2));
page_array_1_0[2] = (Page)(page_2);
byte[] byte_array_1_4 = new byte[30];
byte_array_1_3 = (byte[])(byte_array_1_4);
page_2.contents = byte_array_1_4;
Page page_3 = new Page();
Page_____init_____V_v0((Page)(page_3));
page_array_1_0[3] = (Page)(page_3);
byte[] byte_array_1_5 = new byte[30];
byte_array_1_4 = (byte[])(byte_array_1_5);
page_3.contents = byte_array_1_5;
Page page_4 = new Page();
Page_____init_____V_v0((Page)(page_4));
page_array_1_0[4] = (Page)(page_4);
byte[] byte_array_1_6 = new byte[30];
byte_array_1_5 = (byte[])(byte_array_1_6);
page_4.contents = byte_array_1_6;
responsebody_0.pages = page_array_1_0;
}
public static void Page_____init_____V_v0(Page page_0){
Page page_01111 = page_0;
java_lang_Object_____init_____V_v106((Page)(page_0));
}
public static void java_lang_Object_____init_____V_v106(Page page_0){
Page page_01111 = page_0;
}
public static void Thread_0___MyThread___run___V(MyThread mythread_0){
MyThread mythread_01111 = mythread_0;
Web___service__LRequestLResponse_V_v1((Request)(Main0.globalVar_4.request));
}
public static void Web___service__LRequestLResponse_V_v1(Request request_0){
Request request_01111 = request_0;
Web___getRequestPageNum__LRequest_I_v1((Request)(request_0));
Web___getRequestPageSize__LRequest_I_v1((Request)(request_0));
Response response_0 = new Response();
Response_____init_____V_v1((Response)(response_0));
Response response_1 = (Response)(response_0);
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[14];
java_lang_string_0.value = byte_array_1_0;
ResponseHeader responseheader_0 = new ResponseHeader();
ResponseHeader_____init_____V_v1((ResponseHeader)(responseheader_0));
ResponseHeader responseheader_1 = (ResponseHeader)(responseheader_0);
ResponseBody responsebody_0 = new ResponseBody();
ResponseBody_____init_____V_v1((ResponseBody)(responsebody_0));
ResponseBody responsebody_1 = (ResponseBody)(responsebody_0);
Web___initResponseBody__LResponseBodyII_V_v1((ResponseBody)(responsebody_0));
response_0.responseHeader = responseheader_0;
response_0.responseBody = responsebody_0;
}
public static void Web___getRequestPageNum__LRequest_I_v1(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Web___getRequestPageSize__LRequest_I_v1(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Response_____init_____V_v1(Response response_0){
Response response_01111 = response_0;
java_lang_Object_____init_____V_v111((Response)(response_0));
}
public static void java_lang_Object_____init_____V_v111(Response response_0){
Response response_01111 = response_0;
}
public static void ResponseHeader_____init_____V_v1(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
java_lang_Object_____init_____V_v140((ResponseHeader)(responseheader_0));
}
public static void java_lang_Object_____init_____V_v140(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
}
public static void ResponseBody_____init_____V_v1(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_Object_____init_____V_v141((ResponseBody)(responsebody_0));
}
public static void java_lang_Object_____init_____V_v141(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
}
public static void Web___initResponseBody__LResponseBodyII_V_v1(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[4];
java_lang_string_0.value = byte_array_1_0;
Page[] page_array_1_0 = new Page[5];
Page[] page_array_1_1 = (Page[])(page_array_1_0);
Page page_0 = new Page();
Page_____init_____V_v5((Page)(page_0));
page_array_1_0[0] = (Page)(page_0);
byte[] byte_array_1_1 = new byte[30];
byte[] byte_array_1_2 = (byte[])(byte_array_1_1);
page_0.contents = byte_array_1_1;
Page page_1 = new Page();
Page_____init_____V_v5((Page)(page_1));
page_array_1_0[1] = (Page)(page_1);
byte[] byte_array_1_3 = new byte[30];
byte_array_1_1 = (byte[])(byte_array_1_3);
page_1.contents = byte_array_1_3;
Page page_2 = new Page();
Page_____init_____V_v5((Page)(page_2));
page_array_1_0[2] = (Page)(page_2);
byte[] byte_array_1_4 = new byte[30];
byte_array_1_3 = (byte[])(byte_array_1_4);
page_2.contents = byte_array_1_4;
Page page_3 = new Page();
Page_____init_____V_v5((Page)(page_3));
page_array_1_0[3] = (Page)(page_3);
byte[] byte_array_1_5 = new byte[30];
byte_array_1_4 = (byte[])(byte_array_1_5);
page_3.contents = byte_array_1_5;
Page page_4 = new Page();
Page_____init_____V_v5((Page)(page_4));
page_array_1_0[4] = (Page)(page_4);
byte[] byte_array_1_6 = new byte[30];
byte_array_1_5 = (byte[])(byte_array_1_6);
page_4.contents = byte_array_1_6;
responsebody_0.pages = page_array_1_0;
}
public static void Page_____init_____V_v5(Page page_0){
Page page_01111 = page_0;
java_lang_Object_____init_____V_v146((Page)(page_0));
}
public static void java_lang_Object_____init_____V_v146(Page page_0){
Page page_01111 = page_0;
}
public static void Thread_2___MyThread___run___V(MyThread mythread_0){
MyThread mythread_01111 = mythread_0;
Web___service__LRequestLResponse_V_v2((Request)(Main0.globalVar_6.request));
}
public static void Web___service__LRequestLResponse_V_v2(Request request_0){
Request request_01111 = request_0;
Web___getRequestPageNum__LRequest_I_v2((Request)(request_0));
Web___getRequestPageSize__LRequest_I_v2((Request)(request_0));
Response response_0 = new Response();
Response_____init_____V_v2((Response)(response_0));
Response response_1 = (Response)(response_0);
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[14];
java_lang_string_0.value = byte_array_1_0;
ResponseHeader responseheader_0 = new ResponseHeader();
ResponseHeader_____init_____V_v2((ResponseHeader)(responseheader_0));
ResponseHeader responseheader_1 = (ResponseHeader)(responseheader_0);
ResponseBody responsebody_0 = new ResponseBody();
ResponseBody_____init_____V_v2((ResponseBody)(responsebody_0));
ResponseBody responsebody_1 = (ResponseBody)(responsebody_0);
Web___initResponseBody__LResponseBodyII_V_v2((ResponseBody)(responsebody_0));
response_0.responseHeader = responseheader_0;
response_0.responseBody = responsebody_0;
}
public static void Web___getRequestPageNum__LRequest_I_v2(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Web___getRequestPageSize__LRequest_I_v2(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Response_____init_____V_v2(Response response_0){
Response response_01111 = response_0;
java_lang_Object_____init_____V_v151((Response)(response_0));
}
public static void java_lang_Object_____init_____V_v151(Response response_0){
Response response_01111 = response_0;
}
public static void ResponseHeader_____init_____V_v2(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
java_lang_Object_____init_____V_v153((ResponseHeader)(responseheader_0));
}
public static void java_lang_Object_____init_____V_v153(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
}
public static void ResponseBody_____init_____V_v2(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_Object_____init_____V_v154((ResponseBody)(responsebody_0));
}
public static void java_lang_Object_____init_____V_v154(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
}
public static void Web___initResponseBody__LResponseBodyII_V_v2(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[4];
java_lang_string_0.value = byte_array_1_0;
Page[] page_array_1_0 = new Page[5];
Page[] page_array_1_1 = (Page[])(page_array_1_0);
Page page_0 = new Page();
Page_____init_____V_v10((Page)(page_0));
page_array_1_0[0] = (Page)(page_0);
byte[] byte_array_1_1 = new byte[30];
byte[] byte_array_1_2 = (byte[])(byte_array_1_1);
page_0.contents = byte_array_1_1;
Page page_1 = new Page();
Page_____init_____V_v10((Page)(page_1));
page_array_1_0[1] = (Page)(page_1);
byte[] byte_array_1_3 = new byte[30];
byte_array_1_1 = (byte[])(byte_array_1_3);
page_1.contents = byte_array_1_3;
Page page_2 = new Page();
Page_____init_____V_v10((Page)(page_2));
page_array_1_0[2] = (Page)(page_2);
byte[] byte_array_1_4 = new byte[30];
byte_array_1_3 = (byte[])(byte_array_1_4);
page_2.contents = byte_array_1_4;
Page page_3 = new Page();
Page_____init_____V_v10((Page)(page_3));
page_array_1_0[3] = (Page)(page_3);
byte[] byte_array_1_5 = new byte[30];
byte_array_1_4 = (byte[])(byte_array_1_5);
page_3.contents = byte_array_1_5;
Page page_4 = new Page();
Page_____init_____V_v10((Page)(page_4));
page_array_1_0[4] = (Page)(page_4);
byte[] byte_array_1_6 = new byte[30];
byte_array_1_5 = (byte[])(byte_array_1_6);
page_4.contents = byte_array_1_6;
responsebody_0.pages = page_array_1_0;
}
public static void Page_____init_____V_v10(Page page_0){
Page page_01111 = page_0;
java_lang_Object_____init_____V_v156((Page)(page_0));
}
public static void java_lang_Object_____init_____V_v156(Page page_0){
Page page_01111 = page_0;
}
public static void Thread_4___MyThread___run___V(MyThread mythread_0){
MyThread mythread_01111 = mythread_0;
Web___service__LRequestLResponse_V_v3((Request)(Main0.globalVar_8.request));
}
public static void Web___service__LRequestLResponse_V_v3(Request request_0){
Request request_01111 = request_0;
Web___getRequestPageNum__LRequest_I_v3((Request)(request_0));
Web___getRequestPageSize__LRequest_I_v3((Request)(request_0));
Response response_0 = new Response();
Response_____init_____V_v3((Response)(response_0));
Response response_1 = (Response)(response_0);
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[14];
java_lang_string_0.value = byte_array_1_0;
ResponseHeader responseheader_0 = new ResponseHeader();
ResponseHeader_____init_____V_v3((ResponseHeader)(responseheader_0));
ResponseHeader responseheader_1 = (ResponseHeader)(responseheader_0);
ResponseBody responsebody_0 = new ResponseBody();
ResponseBody_____init_____V_v3((ResponseBody)(responsebody_0));
ResponseBody responsebody_1 = (ResponseBody)(responsebody_0);
Web___initResponseBody__LResponseBodyII_V_v3((ResponseBody)(responsebody_0));
response_0.responseHeader = responseheader_0;
response_0.responseBody = responsebody_0;
}
public static void Web___getRequestPageNum__LRequest_I_v3(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Web___getRequestPageSize__LRequest_I_v3(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Response_____init_____V_v3(Response response_0){
Response response_01111 = response_0;
java_lang_Object_____init_____V_v161((Response)(response_0));
}
public static void java_lang_Object_____init_____V_v161(Response response_0){
Response response_01111 = response_0;
}
public static void ResponseHeader_____init_____V_v3(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
java_lang_Object_____init_____V_v163((ResponseHeader)(responseheader_0));
}
public static void java_lang_Object_____init_____V_v163(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
}
public static void ResponseBody_____init_____V_v3(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_Object_____init_____V_v164((ResponseBody)(responsebody_0));
}
public static void java_lang_Object_____init_____V_v164(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
}
public static void Web___initResponseBody__LResponseBodyII_V_v3(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[4];
java_lang_string_0.value = byte_array_1_0;
Page[] page_array_1_0 = new Page[5];
Page[] page_array_1_1 = (Page[])(page_array_1_0);
Page page_0 = new Page();
Page_____init_____V_v15((Page)(page_0));
page_array_1_0[0] = (Page)(page_0);
byte[] byte_array_1_1 = new byte[30];
byte[] byte_array_1_2 = (byte[])(byte_array_1_1);
page_0.contents = byte_array_1_1;
Page page_1 = new Page();
Page_____init_____V_v15((Page)(page_1));
page_array_1_0[1] = (Page)(page_1);
byte[] byte_array_1_3 = new byte[30];
byte_array_1_1 = (byte[])(byte_array_1_3);
page_1.contents = byte_array_1_3;
Page page_2 = new Page();
Page_____init_____V_v15((Page)(page_2));
page_array_1_0[2] = (Page)(page_2);
byte[] byte_array_1_4 = new byte[30];
byte_array_1_3 = (byte[])(byte_array_1_4);
page_2.contents = byte_array_1_4;
Page page_3 = new Page();
Page_____init_____V_v15((Page)(page_3));
page_array_1_0[3] = (Page)(page_3);
byte[] byte_array_1_5 = new byte[30];
byte_array_1_4 = (byte[])(byte_array_1_5);
page_3.contents = byte_array_1_5;
Page page_4 = new Page();
Page_____init_____V_v15((Page)(page_4));
page_array_1_0[4] = (Page)(page_4);
byte[] byte_array_1_6 = new byte[30];
byte_array_1_5 = (byte[])(byte_array_1_6);
page_4.contents = byte_array_1_6;
responsebody_0.pages = page_array_1_0;
}
public static void Page_____init_____V_v15(Page page_0){
Page page_01111 = page_0;
java_lang_Object_____init_____V_v166((Page)(page_0));
}
public static void java_lang_Object_____init_____V_v166(Page page_0){
Page page_01111 = page_0;
}
public static void Thread_5___MyThread___run___V(MyThread mythread_0){
MyThread mythread_01111 = mythread_0;
Web___service__LRequestLResponse_V_v4((Request)(Main0.globalVar_9.request));
}
public static void Web___service__LRequestLResponse_V_v4(Request request_0){
Request request_01111 = request_0;
Web___getRequestPageNum__LRequest_I_v4((Request)(request_0));
Web___getRequestPageSize__LRequest_I_v4((Request)(request_0));
Response response_0 = new Response();
Response_____init_____V_v4((Response)(response_0));
Response response_1 = (Response)(response_0);
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[14];
java_lang_string_0.value = byte_array_1_0;
ResponseHeader responseheader_0 = new ResponseHeader();
ResponseHeader_____init_____V_v4((ResponseHeader)(responseheader_0));
ResponseHeader responseheader_1 = (ResponseHeader)(responseheader_0);
ResponseBody responsebody_0 = new ResponseBody();
ResponseBody_____init_____V_v4((ResponseBody)(responsebody_0));
ResponseBody responsebody_1 = (ResponseBody)(responsebody_0);
Web___initResponseBody__LResponseBodyII_V_v4((ResponseBody)(responsebody_0));
response_0.responseHeader = responseheader_0;
response_0.responseBody = responsebody_0;
}
public static void Web___getRequestPageNum__LRequest_I_v4(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Web___getRequestPageSize__LRequest_I_v4(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Response_____init_____V_v4(Response response_0){
Response response_01111 = response_0;
java_lang_Object_____init_____V_v171((Response)(response_0));
}
public static void java_lang_Object_____init_____V_v171(Response response_0){
Response response_01111 = response_0;
}
public static void ResponseHeader_____init_____V_v4(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
java_lang_Object_____init_____V_v173((ResponseHeader)(responseheader_0));
}
public static void java_lang_Object_____init_____V_v173(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
}
public static void ResponseBody_____init_____V_v4(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_Object_____init_____V_v174((ResponseBody)(responsebody_0));
}
public static void java_lang_Object_____init_____V_v174(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
}
public static void Web___initResponseBody__LResponseBodyII_V_v4(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[4];
java_lang_string_0.value = byte_array_1_0;
Main0.globalVar_10.componentType = Main0.globalVar_11;
Main0.globalVar_10.classLoader = Main0.globalVar_2;
Main0.globalVar_10.module = Main0.globalVar_3;
Page[] page_array_1_0 = new Page[5];
Page[] page_array_1_1 = (Page[])(page_array_1_0);
Page page_0 = new Page();
Page_____init_____V_v20((Page)(page_0));
page_array_1_0[0] = (Page)(page_0);
byte[] byte_array_1_1 = new byte[30];
byte[] byte_array_1_2 = (byte[])(byte_array_1_1);
page_0.contents = byte_array_1_1;
Page page_1 = new Page();
Page_____init_____V_v20((Page)(page_1));
page_array_1_0[1] = (Page)(page_1);
byte[] byte_array_1_3 = new byte[30];
byte_array_1_1 = (byte[])(byte_array_1_3);
page_1.contents = byte_array_1_3;
Page page_2 = new Page();
Page_____init_____V_v20((Page)(page_2));
page_array_1_0[2] = (Page)(page_2);
byte[] byte_array_1_4 = new byte[30];
byte_array_1_3 = (byte[])(byte_array_1_4);
page_2.contents = byte_array_1_4;
Page page_3 = new Page();
Page_____init_____V_v20((Page)(page_3));
page_array_1_0[3] = (Page)(page_3);
byte[] byte_array_1_5 = new byte[30];
byte_array_1_4 = (byte[])(byte_array_1_5);
page_3.contents = byte_array_1_5;
Page page_4 = new Page();
Page_____init_____V_v20((Page)(page_4));
page_array_1_0[4] = (Page)(page_4);
byte[] byte_array_1_6 = new byte[30];
byte_array_1_5 = (byte[])(byte_array_1_6);
page_4.contents = byte_array_1_6;
responsebody_0.pages = page_array_1_0;
}
public static void Page_____init_____V_v20(Page page_0){
Page page_01111 = page_0;
java_lang_Object_____init_____V_v202((Page)(page_0));
}
public static void java_lang_Object_____init_____V_v202(Page page_0){
Page page_01111 = page_0;
}
public static void Thread_1___MyThread___run___V(MyThread mythread_0){
MyThread mythread_01111 = mythread_0;
Web___service__LRequestLResponse_V_v5((Request)(Main0.globalVar_5.request));
}
public static void Web___service__LRequestLResponse_V_v5(Request request_0){
Request request_01111 = request_0;
Web___getRequestPageNum__LRequest_I_v5((Request)(request_0));
Web___getRequestPageSize__LRequest_I_v5((Request)(request_0));
Response response_0 = new Response();
Response_____init_____V_v5((Response)(response_0));
Response response_1 = (Response)(response_0);
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[14];
java_lang_string_0.value = byte_array_1_0;
ResponseHeader responseheader_0 = new ResponseHeader();
ResponseHeader_____init_____V_v5((ResponseHeader)(responseheader_0));
ResponseHeader responseheader_1 = (ResponseHeader)(responseheader_0);
ResponseBody responsebody_0 = new ResponseBody();
ResponseBody_____init_____V_v5((ResponseBody)(responsebody_0));
ResponseBody responsebody_1 = (ResponseBody)(responsebody_0);
Web___initResponseBody__LResponseBodyII_V_v5((ResponseBody)(responsebody_0));
response_0.responseHeader = responseheader_0;
response_0.responseBody = responsebody_0;
}
public static void Web___getRequestPageNum__LRequest_I_v5(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Web___getRequestPageSize__LRequest_I_v5(Request request_0){
Request request_01111 = request_0;
RequestParameter requestparameter_0 = (RequestParameter)(request_0.requestParameter);
}
public static void Response_____init_____V_v5(Response response_0){
Response response_01111 = response_0;
java_lang_Object_____init_____V_v207((Response)(response_0));
}
public static void java_lang_Object_____init_____V_v207(Response response_0){
Response response_01111 = response_0;
}
public static void ResponseHeader_____init_____V_v5(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
java_lang_Object_____init_____V_v209((ResponseHeader)(responseheader_0));
}
public static void java_lang_Object_____init_____V_v209(ResponseHeader responseheader_0){
ResponseHeader responseheader_01111 = responseheader_0;
}
public static void ResponseBody_____init_____V_v5(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_Object_____init_____V_v210((ResponseBody)(responsebody_0));
}
public static void java_lang_Object_____init_____V_v210(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
}
public static void Web___initResponseBody__LResponseBodyII_V_v5(ResponseBody responsebody_0){
ResponseBody responsebody_01111 = responsebody_0;
java_lang_String java_lang_string_0 = new java_lang_String();
java_lang_String java_lang_string_1 = (java_lang_String)(java_lang_string_0);
byte[] byte_array_1_0 = new byte[4];
java_lang_string_0.value = byte_array_1_0;
Page[] page_array_1_0 = new Page[5];
Page[] page_array_1_1 = (Page[])(page_array_1_0);
Page page_0 = new Page();
Page_____init_____V_v25((Page)(page_0));
page_array_1_0[0] = (Page)(page_0);
byte[] byte_array_1_1 = new byte[30];
byte[] byte_array_1_2 = (byte[])(byte_array_1_1);
page_0.contents = byte_array_1_1;
Page page_1 = new Page();
Page_____init_____V_v25((Page)(page_1));
page_array_1_0[1] = (Page)(page_1);
byte[] byte_array_1_3 = new byte[30];
byte_array_1_1 = (byte[])(byte_array_1_3);
page_1.contents = byte_array_1_3;
Page page_2 = new Page();
Page_____init_____V_v25((Page)(page_2));
page_array_1_0[2] = (Page)(page_2);
byte[] byte_array_1_4 = new byte[30];
byte_array_1_3 = (byte[])(byte_array_1_4);
page_2.contents = byte_array_1_4;
Page page_3 = new Page();
Page_____init_____V_v25((Page)(page_3));
page_array_1_0[3] = (Page)(page_3);
byte[] byte_array_1_5 = new byte[30];
byte_array_1_4 = (byte[])(byte_array_1_5);
page_3.contents = byte_array_1_5;
Page page_4 = new Page();
Page_____init_____V_v25((Page)(page_4));
page_array_1_0[4] = (Page)(page_4);
byte[] byte_array_1_6 = new byte[30];
byte_array_1_5 = (byte[])(byte_array_1_6);
page_4.contents = byte_array_1_6;
responsebody_0.pages = page_array_1_0;
}
public static void Page_____init_____V_v25(Page page_0){
Page page_01111 = page_0;
java_lang_Object_____init_____V_v212((Page)(page_0));
}
public static void java_lang_Object_____init_____V_v212(Page page_0){
Page page_01111 = page_0;
}
}
