package Ed
{
	import flash.display.*;
	import flash.events.*;
	
// KONGREGATE API

// fuck this shit
	import flash.display.LoaderInfo;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.system.Security;
//	KONGREGATE API

	public class Main extends MovieClip
	{
		
// Klasne promenjive
		public var stg:Sprite = new Sprite();
		public var meni;
		public var igra;
		public var tabela;
		public var mjuz = new Muzika;
		
//	KONGREGATE API 
		// Pull the API path from the FlashVars
		//var paramObj:Object = LoaderInfo(root.loaderInfo).parameters;
		 
		// The API path. The "shadow" API will load if testing locally. 
		//var apiPath:String = paramObj.kongregate_api_path || 
		//  "http://www.kongregate.com/flash/API_AS3_Local.swf";
		 
		// Allow the API access to this SWF
		//Security.allowDomain(apiPath);
		 
		// Load the API
		//var request:URLRequest = new URLRequest(apiPath);
		//var loader:Loader = new Loader();
		//loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
		//loader.load(request);
		//this.addChild(loader);
		 
		// Kongregate API reference
		//var kongregate:*;
//	KONGREGATE API		
		
		
		// Konstruktor mejna
		public function Main():void
		{

			// Postavlja sprajt koji nosi ulogu stejdza
			stg.graphics.beginFill(0x000000, 1);  
			stg.graphics.drawRect(0, 0, 600, 600);  
			stg.name = "stg";
			stg.addEventListener(MouseEvent.CLICK, pustiIgru);
			this.addChild(stg);
			
			// Pushta muziku da lupuje 9999 puta
			mjuz.play(0, 9999);
			
			// Instancira tabelu i meni, i pokrece meni
			tabela = new Tabela(stg);
			meni = new Meni(stg);
			meni.upali();
		}
		
//	KONGREGATE API				
		// This function is called when loading is complete
		function loadComplete(event:Event):void
		{
			// Save Kongregate API reference
			//kongregate = event.target.content;
		 
			// Connect to the back-end
			//kongregate.services.connect();
		 
			// You can now access the API via:
			// kongregate.services
			// kongregate.user
			// kongregate.scores
			// kongregate.stats
			// etc...
		}
//	KONGREGATE API		

		// pokrece igru. igra.startuje se koristi i posle svake smrti?
		public function pustiIgru(me:MouseEvent):void
		{
			if (me.target.name == "start_dugme")
				{
					meni.ugasi();
					igra = new Igra(this);
					igra.addEventListener(Event.CLOSE, dajTabelu);
					igra.startuje();
				}
		}
		
		// gasi igru i pali tabelu
		public function dajTabelu(me:Event):void
		{
			igra.ugasiIgru();
			tabela.upaliTabelu(igra.poeni);
			tabela.addEventListener(MouseEvent.CLICK, pokretanje);
		}
		
		// gasi tabelu i pali meni 
		function pokretanje(me:MouseEvent):void
		{
			tabela.ugasiTabelu();
			stg.removeChild(tabela);
			meni.upali();
		}
	}
}