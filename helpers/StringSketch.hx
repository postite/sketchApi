package helpers;

typedef Tag={
  name:String,
  tag:String,
  tagName:String
}
typedef ClassOrId={
  classes:List<String>,
  ids:List<String>,
  cleanName:String
}
//stolen from https://github.com/malkomalko/sketch-android-kit
class StringSketch{

  public static function camelize(str:String):String{
    // return _.str.trim(str).replace(/[-_\s]+(.)?/g, function(match, c){
    //   return c ? c.toUpperCase() : ''
    // })
return throw 'not yet implemented';
  }
  public static function capitalize (str:String):String{
    // str = str == null ? '' : String(str)
    
     return str.charAt(0).toUpperCase() + str.substr(1);
//return throw 'not yet implemented'; 
  }
  public static function classify(str:String):String{
    // return _.str.titleize(String(str).replace(/[\W_]/g, ' ')).replace(/\s/g, '')
return throw 'not yet implemented'; 
  }
  public static function cleanPath(str:String):String{
    var r:EReg=~/\/+$/;
    return  r.replace(str,'');
  }
  public static function clean(str:String):String{
   //return _.str.trim(str).replace(/\s+/g, ' ')
  	 var spaces = ~/\s+/g; // g : replace all instances
   //trace(r.replace(str,"xx")); // "aaabcbcbcxx"
    str=removeSlashes(str);
  	 var trimed=StringTools.trim(str);
 	   str=spaces.replace(trimed,'');
     var begin=~/^[°_#-]{1,}/g;
      str= begin.replace(str,"");
     
      return str;
  }
  public static function removeSlashes(str:String):String{
    var slashes=~/(\/)\w+/g;
    var unslashed=slashes.replace(str,"");
    return unslashed;
  }
  public static function endsWith(str:String, ends:String){
     if (ends == '') return true;
     if (str == null || ends == null) return false;
     str = Std.string(str);
     ends = Std.string(ends);
    return str.length >= ends.length && str.substr(str.length - ends.length) == ends;
//return throw 'not yet implemented'; 
  }
  public static function escapeRegExp(str:String):String{
    // if (str == null) return ''
    // return String(str).replace(/([.*+?^=!:${}()|[\]\/\\])/g, '\\$1')
return throw 'not yet implemented';
  }
  public static function include(str:String,needle:String ){
    // if (needle === '') return true
    // if (str == null) return false
    // return String(str).indexOf(needle) !== -1
return throw 'not yet implemented'; 
  }
  public static function isBlank(str:String):String{
    // if (str == null) str = ''
    // return (/^\s*$/).test(str)
return throw 'not yet implemented'; 
  }
  public static function javaId(str:String):String{
     if (str == null) str = '';
     str = str.toLowerCase();
     str = clean(str);
     var r =~/ /g;

     str = r.replace(str,'_');
     var r2=~/[^a-z0-9_]/g;
     return r2.replace(str,'');
    
 return str; 
  }
  public static function split(str:String,modifier:String ){
    // if (str == null) str = ''
    // str = str.split(new RegExp('\\s*' + modifier + '\\s*'))[1]
    // return _.str.clean(str)
 return throw 'not yet implemented';
  }
  public static function startsWith(str:String,starts:String ):Bool{
      var str=Std.string(str); //ensure str is a string or it fails
     if (starts == '') return true;
     if (str == null || starts == null) return false;
     var is= (str.length >= starts.length && str.substr(0, starts.length) == starts);
     return is;
  }
  
  public static function titleize(str:String):String{
  //   if (str == null) return ''
  //   sreturn str;tr = String(str).toLowerCase()
  //   return str.replace(/(?:^|\s|-)\S/g, function(c){ return c.toUpperCase() })
  // 
  return throw 'not yet implemented';
}
  public static function trim(str:String,characters:String ){
    // if (str == null) return ''
    // if (!characters && nativeTrim) return nativeTrim.call(str)
    // characters = defaultToWhiteSpace(characters)
    // return String(str).replace(new RegExp('\^' + characters + '+|'
    //                                            + characters + '+$', 'g'), '')
	return throw 'not yet implemented';
  }

  public static function getTextTag(text:String,?defaultTag:String="div"):Tag 
{

  var textname:String=Std.string(text); //<h1>pipo

  var tags = ~/^<(a|blockquote|div|h1|h2|h3|h4|h5|h6|label|p|span|section|T|linkit)>/;
   if( tags.match(textname)){ 
   // UI.alert(textname,"contaner title");
    var name= tags.replace(textname, "");////pipo
    var tag= tags.matched(0);//<h1>
    var tagName=tags.matched(1);//h1
    return {name:name,tag:tag,tagName:tagName}
  }
  return {name:textname,tag:'<$defaultTag>',tagName:'$defaultTag'};
}
public static function getClassOrId(text:String):ClassOrId
{
    var list:List<String>;
    var textname:String=Std.string(text); //.pipo
    var matchedClasses:List<String>= new List();
    var matchedIds:List<String>= new List();
    var returns={classes:matchedClasses,ids:matchedIds,cleanName:textname};
    var classOrId=~/(\.)[a-z-A-Z]\w+|(#)[a-z-A-Z]\w+/g;
      var clean=classOrId.map(textname, function(r){
        var matched=r.matched(0);
        switch (matched.substr(0,1)) {
          case ".":
          returns.classes.add(matched.substr(1));
          case "#":
          returns.ids.add(matched.substr(1));
        }
         
         return "";
        });

      returns.cleanName=clean;
      //UI.alert(Std.string(returns));
    //}
    return returns;
}

}