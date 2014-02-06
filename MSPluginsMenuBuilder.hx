extern class MSPluginsMenuBuilder 
{


public static function  rawShortcutStringForPluginAtPath(id:Dynamic):Dynamic;//(id)
public static function  shortcutModifiersForPluginAtPath(id:Dynamic):Int;//unsigned long
public static function  shortcutForPluginAtPath(id:Dynamic):Dynamic;//(id)
public static function  menuItemForSubDirectoryAtPath(id:Dynamic):Dynamic;//(id)
public static function  menuItemForPluginAtPath(id:Dynamic):Dynamic;//(id)
public static function  isPathPointingToScript(id:Dynamic):Bool;//(BOOL)
public static function  isPathPointToFolder(id:Dynamic):Bool;//(BOOL)
public static function  sortedSubpathsOfDirectory(id:Dynamic):Dynamic;//(id)
public static function  pluginMenuForDirectoryAtPath(id:Dynamic):Dynamic;//(id)
public static function  pluginsPath():String;//(id:Dynamic):Dynamic function  attachPluginMenuToItem(id:Dynamic):Dynamic;//(void)
//public function  savePluginWithName(id:Dynamic):Dynamic contents:(id)arg2;//(void)

}