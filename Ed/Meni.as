package Ed
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	public class Meni extends MovieClip
	{
		// dugmad brzine
		var brzoDugme;
		var normalnoDugme;
		var sporoDugme;
		
		// dugmad tezina
		var teshkoDugme;
		var lakoDugme;
		
		// start dugme i mnozilac poena
		var startDugme;
		var mnozhilac;
		
		// vrednosti brzine i tezine
		var brz = 1;
		var tez:int = 0;
		
		var stg;
		var igra;
		
		var font;
		
		// konstruktor menija
		public function Meni(stg):void
		{
			this.stg = stg;
			this.igra = igra;
			
			this.x = 300;
			this.y = 300;
			
			font = new TextFormat;
			font.font = "Consolas";
		}
		
		
		public function upali():void
		{
			stg.addChild(this);
			dugmadBrzine();
			dugmadTezhine();
			startDugmePostavi();
			mnozhilacPoena();
		}
		
		function startDugmePostavi():void
		{
			startDugme = new StartDugme;
			trace("hello!");
			startDugme.name = "start_dugme";
			startDugme.x = 300;
			startDugme.y = 485;
			stg.addChild(startDugme);
		}
		
		function dugmadBrzine():void
		{
			brzoDugme = new BrzoDugme;
			brzoDugme.x = 120;
			brzoDugme.y = 485;
			brzoDugme.name = "brzo_dugme";
			brzoDugme.addEventListener(MouseEvent.CLICK, brzina);
			stg.addChild(brzoDugme);
			
			normalnoDugme = new NormalnoDugme;
			normalnoDugme.x = 128;
			normalnoDugme.y = 526;
			normalnoDugme.name = "normalno_dugme";
			normalnoDugme.addEventListener(MouseEvent.CLICK, brzina);
			stg.addChild(normalnoDugme);
			
			sporoDugme = new SporoDugme;
			sporoDugme.x = 153;
			sporoDugme.y = 568;
			sporoDugme.name = "sporo_dugme";
			sporoDugme.addEventListener(MouseEvent.CLICK, brzina);
			stg.addChild(sporoDugme);
		}
		
		function dugmadTezhine():void
		{
			lakoDugme = new LakoDugme;
			lakoDugme.x = 461;
			lakoDugme.y = 526;
			lakoDugme.name = "lako_dugme";
			lakoDugme.addEventListener(MouseEvent.CLICK, tezhina);
			stg.addChild(lakoDugme);
			
			teshkoDugme = new TeshkoDugme;
			teshkoDugme.x = 472;
			teshkoDugme.y = 485;
			teshkoDugme.name = "teshko_dugme";
			teshkoDugme.addEventListener(MouseEvent.CLICK, tezhina);
			stg.addChild(teshkoDugme);
		}
		
		function tezhina(me:MouseEvent):void
		{
			if (me.currentTarget.name == "lako_dugme")
			{
				trace("lako");
				tez = 0;
				mnozhilac.text = mnozhenjePoena();
				mnozhilac.setTextFormat(font);
			}
			else if (me.currentTarget.name == "teshko_dugme")
			{
				trace("teshko");
				tez = 1;
				mnozhilac.text = mnozhenjePoena();
				mnozhilac.setTextFormat(font);
			}
		}
		
		function brzina(me:MouseEvent):void
		{
			if (me.currentTarget.name == "sporo_dugme")
			{
				trace("sporo");
				brz = 0.5;
				mnozhilac.text = mnozhenjePoena();
				mnozhilac.setTextFormat(font);
			}
			else if (me.currentTarget.name == "normalno_dugme")
			{
				trace("normalno");
				brz = 1;
				mnozhilac.text = mnozhenjePoena();
				mnozhilac.setTextFormat(font);
			}
			else if (me.currentTarget.name == "brzo_dugme")
			{
				trace("brzo");
				brz = 1.5;
				mnozhilac.text = mnozhenjePoena();
				mnozhilac.setTextFormat(font);
			}
		}
		
		public function mnozhenjePoena():Number
		{
			var mnozhilacTezhine;
			var mnozhilacBrzine;
			var mnozhilacPoena;
			
			if (tez == 0)
				mnozhilacTezhine = 1;
			if (tez == 1)
				mnozhilacTezhine = 2;
				
			if (brz == 0.5)
				mnozhilacBrzine = 0.5;
			if (brz == 1)
				mnozhilacBrzine = 1;
			if (brz == 1.5)
				mnozhilacBrzine = 2;
						
			mnozhilacPoena = mnozhilacTezhine * mnozhilacBrzine;
			return mnozhilacPoena;
		}
		
		function mnozhilacPoena():void
		{
			mnozhilac = new TextField;
			mnozhilac.x = 530;
			mnozhilac.y = 370;
			mnozhilac.textColor = [0xff8888];
			mnozhilac.scaleX = 2;
			mnozhilac.scaleY = 2.5;
			mnozhilac.text = mnozhenjePoena();
			mnozhilac.mouseEnabled = false;
			stg.addChild(mnozhilac);
			mnozhilac.setTextFormat(font);
		}  
		
		public function ugasi():void
		{
			stg.removeChild(this);
			
			stg.removeChild(startDugme);
			
			stg.removeChild(sporoDugme);
			stg.removeChild(normalnoDugme);
			stg.removeChild(brzoDugme);
			
			stg.removeChild(lakoDugme);
			stg.removeChild(teshkoDugme);
			
			stg.removeChild(mnozhilac);
		}
	}
}