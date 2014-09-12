class SketchTest {
    
    static function main(){
        var r = new haxe.unit.TestRunner();
        r.add(new TestDoc());
        r.add(new TestLayer());
        // your can add others TestCase here

        // finally, run the tests
        r.run();
    }
}