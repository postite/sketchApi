import MSStyle.MSGradient;
import MSStyle.NSImage;
extern class MSStyleFill{
public function fillType():Int;
//A color fill (0), gradient (1) or pattern (4). Other values make no sense and can lead to unpredictable behaviour

public function gradient():MSGradient;
//An MSGradient object that will only be used if the fillType is set to a gradient.

public function patternImage():NSImage;
//An NSImage object that will be used if the fillType is set to pattern

public function noiseIntensity():Float;
//A float representing the intensity of the noise from 0..1

public function isEnabled():Bool;
//Whether the style object is enabled or not


//undoc
public function setFillType(v:Int):Void;
public function color():NSColor;
public function setColor(c:NSColor):Void;

}
