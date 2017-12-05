package Ed
{
	import flash.display.MovieClip
	import flash.events.*
	
	public class EksplozijaRakete extends MovieClip
	{
		public function EksplozijaRakete():void
		{
			
		}
		
		// pogodak koji se racuna iz grafike eksplozije
		public function pogodak(stg):void
		{
			var i = 0;
			for (i; i < stg.numChildren; i++)
			{
				if (((stg.getChildAt(i) is Top)||(stg.getChildAt(i) is Lanser)||(stg.getChildAt(i) is Torpedo))&&(stg.getChildAt(i).hitTestObject(this)))
				{
					stg.getChildAt(i).pogodjen = true;
				}
			}
		}
	}
}