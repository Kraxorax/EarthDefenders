package Ed
{
	import flash.utils.Timer;
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Top extends MovieClip
	{
		var stg;
		public var poeni = 4;
		public var pucanjaTajmer;
		var ubrzanjeIgre;
		var brzinaIgre;
		var brzX:Number = 5;
		public var pogodjen = false;
		var igra;
		var zvukPucanjaTopa = new TopPuca;
		var eksplozija;		
		var zvukSmrtiTopa = new SmrtTopa;
		
		public function Top(igra):void
		{
			this.igra = igra;
			this.ubrzanjeIgre = igra.ubrzanjeIgre;
			this.brzinaIgre = igra.brzinaIgre;
			this.stg = igra.stg;
			
			pucanjaTajmer = new Timer(Math.round(((0.5 + Math.random()) * 1000) / ubrzanjeIgre / brzinaIgre));
			pucanjaTajmer.addEventListener(TimerEvent.TIMER, puca, false, 0, true);
			pucanjaTajmer.start();
						
			// bira sa koje strane ce se pojaviti protivnik
			if (Math.random()>0.5)
			{
				this.x = 593;
			}
			else this.x = 7;
			this.y = 55;
			this.stg.addChild(this);
		}
		
		function kretji(ubrzanjeIgre):void
		{
			this.x += brzX * ubrzanjeIgre * brzinaIgre;
			if (this.x > 595)
			{
				brzX = -(Math.abs(brzX));
			}
			else if (this.x < 5)
			{
				brzX = Math.abs(brzX);
			}
		}
		
		function kretjiTeshko(ubrzanjeIgre):void
		{
			this.x += brzX * ubrzanjeIgre * brzinaIgre;
			if ((this.x > 595)||(Math.random()>0.99))
			{
				brzX = -(Math.abs(brzX));
			}
			else if ((this.x < 5||(Math.random()>0.99)))
			{
				brzX = Math.abs(brzX);
			}
		}
		
		function puca(te:TimerEvent):void
		{
			if (igra.pauza == true)
			{
				return;
			}
			zvukPucanjaTopa.play();
			new Djule(igra, this.x, this.y);
			pucanjaTajmer.delay = (Math.round(((0.5 + Math.random())*1000) / ubrzanjeIgre / brzinaIgre));
			pucanjaTajmer.reset();
			pucanjaTajmer.start();
		}
		
		function eksplodira():void
		{
			eksplozija = new TopEksplozija;
			eksplozija.x = this.x;
			eksplozija.y = this.y;
			eksplozija.addEventListener("UGASIeksplozijuTOPA", igra.ugasiEksploziju);
			stg.addChild(eksplozija);
			zvukSmrtiTopa.play();
			eksplozija.play();
		}
		
		function iskljuchi():void
		{
			pucanjaTajmer.removeEventListener(TimerEvent.TIMER, puca);
		}
	}
}