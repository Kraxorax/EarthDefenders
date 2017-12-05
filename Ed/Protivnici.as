package Ed
{
	import flash.utils.Timer;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	
	public class Protivnici extends MovieClip
	{
		public var topTajmer;
		public var lanserTajmer;
		var top;
		var lanser;
		var tezhinaIgre;
		var brzinaIgre;
		var ubrzanjeIgre;
		var stg;
		var igra;
		
		function Protivnici(igra):void
		{
			this.igra = igra;
			this.stg = igra.stg;
			this.ubrzanjeIgre = igra.ubrzanjeIgre;
			this.brzinaIgre = igra.brzinaIgre;
			
			if (igra.tezhinaIgre == 1)
			{
				topTajmer = new Timer(Math.round(1000 / igra.ubrzanjeIgre / igra.brzinaIgre));
			}
			else topTajmer = new Timer(1500 / igra.ubrzanjeIgre / igra.brzinaIgre);
			topTajmer.addEventListener(TimerEvent.TIMER, noviTop);
			topTajmer.start();
			
			if (igra.tezhinaIgre == 1)
			{
				lanserTajmer = new Timer(Math.round(1875 / igra.ubrzanjeIgre / igra.brzinaIgre));
			}
			else lanserTajmer = new Timer(3750 / igra.ubrzanjeIgre / igra.brzinaIgre);
			lanserTajmer.addEventListener(TimerEvent.TIMER, noviLanser);
			lanserTajmer.start();
		}
		
		function noviTop(te:TimerEvent):void
		{
			if (igra.pauza == true)
			{
				return;
			}
			top = new Top(igra);
		}
		
		function noviLanser(te:TimerEvent):void
		{
			if (igra.pauza == true)
			{
				return;
			}
			lanser = new Lanser(igra);
		}
		
		public function gasi():void
		{
			while(stg.numChildren > 0)
			{
				if ((stg.getChildAt(0) is Lanser)||(stg.getChildAt(0) is Top))
					stg.getChildAt(0).iskljuchi();
										
				stg.removeChildAt(0);
			}
		}
	}
}