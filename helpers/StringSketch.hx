package helpers;

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
  	 var r = ~/\s+/g; // g : replace all instances
   //trace(r.replace(str,"xx")); // "aaabcbcbcxx"
  	 var trimed=StringTools.trim(str);
 	  return r.replace(trimed,' ');
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

  public static function getTextTag(text:String):{name:String,tag:String,tagName:String} 
{

  var textname:String=Std.string(text); //<h1>pipo
  var tags = ~/^<(a|blockquote|div|h1|h2|h3|h4|h5|h6|label|p|span)>/;
   if( tags.match(textname)){ 
    var name= tags.replace(textname, "");////pipo
    var tag= tags.matched(0);//<h1>
    var tagName=tags.matched(1);//h1
    return {name:name,tag:tag,tagName:tagName}
  }
  return {name:textname,tag:"<span>",tagName:"span"};
}

}