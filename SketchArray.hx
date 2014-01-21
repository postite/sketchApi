/// hacked array to make length & for loops working

extern class SketchArray<T> implements ArrayAccess<T>{
		var  length(get,null) : Int;
        public static function __init__():Void {
        
         }

         


       
        // inline function new():Void{
        //     untyped log ("new");
        // }
        // function concat( a : Array<T> ) : Array<T>;
        // function join( sep : String ) : String;
        // function pop() : Null<T>;
        // function push(x : T) : Int;
        // function reverse() : Void;
        // function shift() : Null<T>;
        // function slice( pos : Int, ?end : Int ) : Array<T>;
        // function sort( f : T -> T -> Int ) : SketchArray<T>;
        // function splice( pos : Int, len : Int ) : Array<T>;
        // function toString() : String;
        // function unshift( x : T ) : Void;
        function firstObject():T;
        inline function get_length():Int
        {
           
        	return (untyped this).length();
        }
        // inline function insert( pos : Int, x : T ) : Void {
        //         (untyped this).splice(pos,0,x);
        // }

        //  function remove( x : T ) : Bool ;

        //  function indexOf( x : T, ?fromIndex:Int ) : Int ;

        //  function lastIndexOf( x : T, ?fromIndex:Int ) : Int ;

        //  function copy() : Array<T> {
        //         return (untyped this).slice();
        // }

        // function map<S>(f:T->S):Array<S>;
        // function filter(f:T->Bool):Array<T>;

         @:runtime inline function iterator() : NativeArrayIterator<T> {
                return new NativeArrayIterator<T>(this);
        }
}

@:keep
class NativeArrayIterator<T>
{
  public var array(default, null):SketchArray<T>;
  public var i:Int;
  inline public function new(ar:SketchArray<T>) {
    this.array = ar;
    this.i = 0;
  }

  public function next() : T return this.array[i++];

  public function hasNext() : Bool return i < this.array.length;

  inline public function reset():Void i = 0;

  inline public function keys():IntIterator return 0...array.length;

  public function haxeArray():Array<T> {
        var a:Array<T> = [];
        for (e in this) a.push(e);
        return a;
  }

}
