package helpers;


class StringSketch{

  public static function camelize(str:String):String{
    // return _.str.trim(str).replace(/[-_\s]+(.)?/g, function(match, c){
    //   return c ? c.toUpperCase() : ''
    // })
 return str; 
  }
  public static function capitalize (str:String):String{
    // str = str == null ? '' : String(str)
    // return str.charAt(0).toUpperCase() + str.slice(1)
 return str; 
  }
  public static function classify(str:String):String{
    // return _.str.titleize(String(str).replace(/[\W_]/g, ' ')).replace(/\s/g, '')
 return str; 
  }
  public static function clean(str:String):String{
   //return _.str.trim(str).replace(/\s+/g, ' ')
  	 var r = ~/\s+/g; // g : replace all instances
   //trace(r.replace(str,"xx")); // "aaabcbcbcxx"
  	 var trimed=StringTools.trim(str);
 	return r.replace(trimed,' ');
  }
  public static function endsWith(str:String, ends:String){
    // if (ends === '') return true
    // if (str == null || ends == null) return false
    // str = String(str)
    // ends = String(ends)
    // return str.length >= ends.length && str.slice(str.length - ends.length) === ends
 return str; 
  }
  public static function escapeRegExp(str:String):String{
    // if (str == null) return ''
    // return String(str).replace(/([.*+?^=!:${}()|[\]\/\\])/g, '\\$1')
 return str; 
  }
  public static function include(str:String,needle:String ){
    // if (needle === '') return true
    // if (str == null) return false
    // return String(str).indexOf(needle) !== -1
 return str; 
  }
  public static function isBlank(str:String):String{
    // if (str == null) str = ''
    // return (/^\s*$/).test(str)
 return str; 
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
 return str; 
  }
  public static function startsWith(str:String,starts:String ):Bool{
     if (starts == '') return true;
     if (str == null || starts == null) return false;

     return (str.length >= starts.length && str.substr(0, starts.length) == starts);
  }
  public static function titleize(str:String):String{
  //   if (str == null) return ''
  //   sreturn str;tr = String(str).toLowerCase()
  //   return str.replace(/(?:^|\s|-)\S/g, function(c){ return c.toUpperCase() })
  // 
  return throw 'not implemented';
}
  public static function trim(str:String,characters:String ){
    // if (str == null) return ''
    // if (!characters && nativeTrim) return nativeTrim.call(str)
    // characters = defaultToWhiteSpace(characters)
    // return String(str).replace(new RegExp('\^' + characters + '+|'
    //                                            + characters + '+$', 'g'), '')
	return str;
  }

}