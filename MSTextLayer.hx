typedef Color=Dynamic //todo

extern class MSTextLayer extends MSLayer{

//Represents text. Subclass of MSLayer Only the most basic of properties have yet been exposed.

public function fontSize():Int;
public function fontPostscriptName():String;
public function textColor():Color;
public function textAlignment():Dynamic;
public function characterSpacing():Int;
public function lineSpacing():Int;

//undocumented
//public function textColor():Color;
public function stringValue():String;
}