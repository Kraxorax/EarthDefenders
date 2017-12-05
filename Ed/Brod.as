package Ed
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Brod extends MovieClip
	{
		var brzX:Number = 0;
		var brzY:Number = 0;
		var intenzitet:Number=10;
		var igra;
		var laserTajmer = null;
		var mrtav = false;
		var pauza;
		
		// konstruktor
		function Brod(igra):void
		{
			this.igra = igra;
			this.pauza = igra.pauza;
			this.x = 300;
			this.y = 300;
		}
		
		
		// poziva Igra.onTick
		function kretji():void
		{
			this.x += brzX*intenzitet*igra.ubrzanjeIgre*igra.brzinaIgre;
			this.y += brzY*intenzitet*igra.ubrzanjeIgre*igra.brzinaIgre;
		}
		
		// zaustavlja brod kad se klikne na njega		
		function zaustavi():void
		{
			brzX = 0;
			brzY = 0;
			trace("STOP");
		}
		
		// postavlja i pokretje rajmer za lasere
		public function laseriStart():void
		{
			laserTajmer = new Timer(1000);
			laserTajmer.addEventListener(TimerEvent.TIMER, laserPuca);
			laserTajmer.start();
		}
		
		// ispaljuje laser kad se tajmer oglasi i podeshava novu vrednost za tajmer
		public function laserPuca(te:TimerEvent):void
		{
			if (igra.pauza == true)
			{
				return;
			}
			new Laser(igra.stg, this.x, this.y);
			igra.zvukLasera.play();
			laserTajmer.delay = (1000 - igra.evil*5);
			laserTajmer.reset();
			laserTajmer.start();
		}
		
		// poziva Igra.onTick
		function odbijanjeZid():void {
			if (this.x>=580) {
				trace("udario o desni zid");
				brzX = -(Math.abs(brzX));
			}
			if (this.x<=20) {
				trace("udario o levi zid");
				brzX=Math.abs(brzX);
			}

			if (this.y>=580) {
				trace("udario o donji zid");
				brzY = -(Math.abs(brzY));
			}
			if (this.y-150<=0) {
				trace("udario o gornji zid");
				brzY=Math.abs(brzY);
			}
		}
		
	}
}