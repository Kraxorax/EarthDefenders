package Ed
{
	import flash.display.MovieClip;
	
	public class Laser extends MovieClip
	{
		private var brzY:Number = 60;
		private var intBrz:Number = 30;
		private var stg;
		
		// konstruktor, postavlja na poziciju i na stage
		public function Laser(stg, pX:Number, pY:Number):void
		{
			this.x = pX;
			this.y = pY;

			this.stg = stg;
			this.stg.addChild(this);
		}
		
		function kretji(ubrzanjeIgre):Boolean
		{
			this.y -= brzY * ubrzanjeIgre;
			if (this.y < -30)
			{
				stg.removeChild(this);
				return true;
			}
			return false;
		}
		
		function pogodak():void
		{
			var i = 0;
			for (i; i < stg.numChildren; i++)
			{
				if ((stg.getChildAt(i) is Top)||(stg.getChildAt(i) is Lanser)||(stg.getChildAt(i) is Torpedo))
				{
					if (this.hitTestObject(stg.getChildAt(i)))
					{
						trace("pogodak!");
						// markira da je objekat pogodjen da bi ga Igra.onTick izbacila
						stg.getChildAt(i).pogodjen = true;
					}
				}
			}
		}
	}
}