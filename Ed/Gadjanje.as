package Ed {
	
	public class Gadjanje {

		var stvar;
		
		public function Gadjanje() {
			// constructor code
		}

		public function pogodak(stvar):Boolean
		{
			var i = 0;
			for(i; i < stvar.stg.numChildren; i++)
			{
				if ((stvar.stg.getChildAt(i) is Top)||(stvar.stg.getChildAt(i) is Lanser)||(stvar.stg.getChildAt(i) is Torpedo))
				{
					if (stvar.stg.getChildAt(i).hitTestObject(stvar))
					{
						trace("pogodak!");
						stvar.stg.getChildAt(i).pogodjen = true;
						return true;
					}
				}
			}
			return false;
		}
		
		public function pogodakBroda(stvar):Boolean
		{
			var i = 0;
			for (i; i < stvar.stg.numChildren; i++)
			{
				if (stvar.stg.getChildAt(i) is Brod)
				{
					if (stvar.hitTestObject(stvar.stg.getChildAt(i)))
					{										 
						trace("SMRT!!!");
						stvar.stg.getChildAt(i).mrtav = true;
						stvar.pogodjen = true;
						return true;
					}
				}
			}
			return false;
		}
	}
	
}
