/// hacked array to make length & for loops working
extern class SketchArray<T> implements ArrayAccess<T>{
		var  length(get,null) : Int;
        
        public static function __init__():Void {
        
        
        
       // untyped __js__("nativeArray= new Array()");
        // untyped __js__("log ('init'+selection.length())");
        
         }
        
        
        function concat( a : Array<T> ) : Array<T>;
        function join( sep : String ) : String;
        function pop() : Null<T>;
        function push(x : T) : Int;
        function reverse() : Void;
        function shift() : Null<T>;
        function slice( pos : Int, ?end : Int ) : Array<T>;
         function sort( f : T -> T -> Int ) : SketchArray<T>;
        function splice( pos : Int, len : Int ) : Array<T>;
        function toString() : String;
        function unshift( x : T ) : Void;
        function firstObject():T;
        inline function get_length():Int
        {
        	return (untyped this).length();
        }
        inline function insert( pos : Int, x : T ) : Void {
                (untyped this).splice(pos,0,x);
        }

         function remove( x : T ) : Bool ;

         function indexOf( x : T, ?fromIndex:Int ) : Int ;

         function lastIndexOf( x : T, ?fromIndex:Int ) : Int ;

         function copy() : Array<T> {
                return (untyped this).slice();
        }

        function map<S>(f:T->S):Array<S>;
        function filter(f:T->Bool):Array<T>;

         @:runtime inline function iterator() : Iterator<T> {
                return new SketArrayIterable<T>(this);
        }
}

class SketArrayIterable<T>
    {
        public var length: Int;
        private var count: Int;
        private var ar: SketchArray<T>;
        public function new( arr: SketchArray<T> ) {
            count = 0;
            length = arr.length;
            ar = arr;   
        }
        public function iterator ():Iterator<T> { 
                return this;                 
        }
        public function hasNext(): Bool {
                 return count < length;
        }
        public function next(): T { 
                 return ar[ count++ ]; 
        }   
    }

class SketchArrayTools<T>{
	static var length= function(ar:SketchArray<T>){return 2;};
}