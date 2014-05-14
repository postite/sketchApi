package exp;
using helpers.Layer;
using helpers.Slice;
using helpers.Document;
import exp.ExportTypes;
using helpers.StringSketch;
import Global.*;






class ExportSlice extends ExportLayer implements Exportable
{

public static var one:Bool=false;


	public function new(layer:MSLayerGroup)
	{
		super(layer);
		this.type=Slice;

	}
	override public function export():Exportable
	{	
		onelog(orig);
		var slice:MSSliceLayer=null;
		var layer:MSLayer=null;
		switch(helpers.Layer._class(orig)){
			case MSSliceLayer:
				slice= cast orig;
				layer=slice.parentGroup();
			case MSLayerGroup:
				slice=doc.sliceForRect(orig.frame());
				layer=orig;
			case MSLayer:
				slice=doc.sliceForRect(orig.frame());
				layer=orig;
		}
		var slice:MSSliceLayer= cast orig;
		onelog(slice.absoluteRect().width() +"height="+slice.absoluteRect().height());
		onelog(slice.absoluteRect().origin().x +"height="+slice.absoluteRect().origin().y);
		onelog(slice.absoluteRect().rulerX() +"height="+slice.absoluteRect().rulerY());
		onelog(slice.relativeRect().origin.x +"y="+slice.relativeRect().origin.y);
		onelog("parent="+slice.ancestors()[slice.ancestors().length-2].name());
		onelog("parent="+slice.parentGroup().name());
		onelog("shouldTrim="+slice.exportOptions().shouldTrim());
		onelog("includedLayerIds="+slice.exportOptions().includedLayerIds().length);
		// for( l in slice.exportOptions().includedLayerIds().iterator()){
		// 	onelog(l);
		// }
		onelog("layerOptions="+slice.exportOptions().layerOptions());
		

		var sizes=slice.exportOptions().sizes();
				onelog("sizes="+slice.exportOptions().sizes());

		for( a in sizes){
			onelog(a.defaultName()); //@0.5
			onelog(a.parentLayer().name());//sliceName
			onelog(a.isVectorExport());//svg or not
			onelog(a.name());//suffix
			onelog(a.format());//png/svg...etc
			onelog(a.visibleScaleType());//0
			onelog(a.scale());//0.5
		}
		x=slice.absoluteRect().rulerX();
		y=slice.absoluteRect().rulerY();
		width=slice.frame().width();
		height=slice.frame().height();
		// relx=slice.frame().x();
		// rely=slice.frame().y();
		if( slice.parentGroup().parentGroup()!=slice.parentArtboard()){
		relx=slice.parentGroup().frame().x();
		rely=slice.parentGroup().frame().y();
		}else{
			relx=x;
			rely=y;
		}

		this.type=Slice;
		//this.format=Type.createEnum (Format,Std.String(slice.exportOptions().sizes().firstObject().format().capitalize()));
		this.format=Std.string(slice.exportOptions().sizes().firstObject().format());
		exportData=slice.export(layer,doc.dir()+"view/images",sizes.firstObject().scale(),config);
		//src=relativeSrc(exportData.path);
		src=exportData.name;
		// relx=x;
		// rely=y;
		return cast this;

	}
	


}