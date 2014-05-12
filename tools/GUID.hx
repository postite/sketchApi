package tools;

typedef GuidGenerator = Void -> String

class Guid {
  public static function generate(): String {
    var result = "";

// normal is up to 30
    for (j in 0...8) {
      if ( j == 8 || j == 12|| j == 16|| j == 20) {
        result += "-";
      }

      result += StringTools.hex(Math.floor(Math.random()*16));
    }

    return result.toUpperCase();
  }
}
