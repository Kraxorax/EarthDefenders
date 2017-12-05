package Ed
{
	import flash.display.MovieClip;
	
	public class Djule extends MovieClip
	{
		var igra;
		var stg;
		var ubrzanjeIgre;
		var brzinaIgre;
		var brzY:Number = 10;
		
		function Djule(igra, tX, tY):void
		{
			this.igra = igra
			this.ubrzanjeIgre = igra.ubrzanjeIgre;
			this.brzinaIgre = igra.brzinaIgre;
			
			this.stg = igra.stg;
			this.x = tX;
			this.y = tY;
			stg.addChild(this);
		}
		
		function kretji():Boolean
		{
			this.y += (brzY * ubrzanjeIgre * brzinaIgre);
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
			}
		}
	}
}