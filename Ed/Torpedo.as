package Ed
{
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Torpedo extends MovieClip
	{
		var stg;
		var poeni = 2;
		var ubrzanjeIgre;
		var brzinaIgre;
		var brzY;
		var brzX;
		var brod;
		var igra;
		var kretanje;
		var eksplozijaTorpeda;
		var zvukTorpeda;
		
		
		public var pogodjen = false;
		
		function Torpedo(igra, tX, tY):void
		{
			this.igra = igra;
			this.brzinaIgre = igra.brzinaIgre;
			this.ubrzanjeIgre = igra.ubrzanjeIgre;
			this.kretanje = igra.kretanje;
			this.stg = igra.stg;
			this.brod = igra.brod;
			this.x = tX;
			this.y = tY;
			stg.addChild(this);
			
			zvukTorpeda = new ZvukTorpeda;
			
			kretanje.pravac(this, brod);
						
			this.rotation = kretanje.rotacija(this, brod);
		}
		
		function kretji(ubrzanjeIgre):Boolean
		{
			this.y += (brzY * 5 * ubrzanjeIgre * brzinaIgre);
			this.x += (brzX * 5 * ubrzanjeIgre * brzinaIgre);
			if (this.y >= 600)
			{
				stg.removeChild(this);
				return true;
			}
			return false;
		}
		
		function pogodak():void
		{
				if (this.hitTestObject(igra.brod))
				{										 
					trace("SMRT!!!");
					igra.brod.mrtav = true;
					pogodjen = true;
				}
		}
		
		function eksplozija():void
		{
			eksplozijaTorpeda = new EksplozijaTorpeda;
			eksplozijaTorpeda.x = this.x;
			eksplozijaTorpeda.y = this.y;
			eksplozijaTorpeda.addEventListener("UGASIeksplozijuTORPEDA", igra.ugasiEksploziju);
			stg.addChild(eksplozijaTorpeda);
			zvukTorpeda.play();
			eksplozijaTorpeda.play();;
		}
		
		function gasiEksploziju(e:Event):void
		{
			if (stg.contains(e.target))
				stg.removeChild(e.target);	
		}
	}
}