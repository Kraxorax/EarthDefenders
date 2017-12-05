package Ed
{
	import flash.utils.Timer;
    import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.geom.Point;
	
	public class Igra extends MovieClip
	{
		var stg;
		var meni;
		var main;
		var brzinaIgre;
		var tezhinaIgre;
		var brod;
		var kretanje = new Kretanje;
		var brojZhivota = 2;
		var pokazivachZhivota;
		var zemlja;
		var zemlja1;
		var evil:int = -1;
		var pokazivachEvila;
		var zvukLasera;
		var ubrzanjeIgre = 1;
		var protivnici = null;
		var evilTajmer;
		var tajmerUbrzanja;
		var poeni = 0;
		var mnozhilacPoena;
		var pokazivachPoena;
		var zvezdaKontenjer;
		
		// lepota, grafika, zvuk...
		var zvezda1;
		var zvezda2;
		var zvezda3;
		var zvezda4;
		var eksplozijaTopa;
		var zvukSmrtiTopa;
		var eksplozijaLansera;
		var zvukSmrtiLansera;
		var zvukTorpeda;
		var eksplozijaBroda;
		var zvukEksplozijeBroda;
		var eksplozijaTorpeda;
		var zvukRakete;
		
		var pauza = false;
		var font;
		var pomotj;
		
			
		public function Igra(main):void
		{
			var stage = main.stage;
			this.main = main;
			this.stg = main.stg;
			meni = main.meni;
			this.brzinaIgre = main.meni.brz;
			this.tezhinaIgre = main.meni.tez;
			this.mnozhilacPoena = main.meni.mnozhenjePoena();
			trace("brzina = " + brzinaIgre);
			trace("tezhina = " + tezhinaIgre);
			
			this.stg.addEventListener(MouseEvent.MOUSE_DOWN, klik);
			main.stage.addEventListener(KeyboardEvent.KEY_DOWN, pauziraj);
			main.stage.addEventListener(Event.MOUSE_LEAVE, pauziraj);
			
			tajmerUbrzanja = new Timer(30000);
			tajmerUbrzanja.addEventListener(TimerEvent.TIMER, ubrzanje);
			tajmerUbrzanja.start();
			
			zvukEksplozijeBroda = new ZvukSmrtiBroda;
			zvukLasera = new ZvukLasera;
			zvukSmrtiTopa = new SmrtTopa;
			zvukSmrtiLansera = new SmrtLansera;
			zvukRakete = new ZvukRakete;
			zvukTorpeda = new ZvukTorpeda;
			
			pomotj = new Help;
			pomotj.x = 300;
			pomotj.y = 300;
			
			font = new TextFormat;
			font.font = "Consolas";
		}
		
		function pauziraj(e:Event):void
		{
			if (pauza == false)
			{
				pauza = true;  
				if (!stg.contains(pomotj))
				{
					this.stg.addChild(pomotj);
					tajmerUbrzanja.stop();
				}
			}
			else
			{
				pauza = false;
				if (stg.contains(pomotj))
				{
					this.stg.removeChild(pomotj);
					tajmerUbrzanja.start();
				}
			}
		}
		
		function startuje():void
		{
			this.stg.addEventListener(Event.ENTER_FRAME, onTick);
			
			eksplozijaBroda = new SmrtBroda;
			eksplozijaBroda.stop();
			
			postaviPozadinu();
			evilnessStart();
			poeniStart();
			zhivotiStart();
			
			brod = new Brod(this);
			stg.addChild(brod);
						
			stg.addChild(pokazivachZhivota);
				
			brod.laseriStart();
			
			// ove dve kondicije omogutjavaju da igra.ugasiIgru() pozove startuje()
			if ((brod.laserTajmer == null)||(brod.laserTajmer.running == false))
				brod.laseriStart();
			
			if (protivnici == null)
				protivnici = new Protivnici(this);
			
			pauza = false;
		}
		

		function postaviPozadinu():void
		{
			zvezda1 = new Zvezde;
			zvezda2 = new Zvezde;
			zvezda1.x = 300;
			zvezda2.x = 300;
			zvezda1.y = 180;
			zvezda2.y = -665;
			stg.addChild(zvezda1);
			stg.addChild(zvezda2);
			
			zvezda3 = new ZvezdeDruge;
			zvezda4 = new ZvezdeDruge;
			zvezda3.x = 300;
			zvezda4.x = 300;
			zvezda3.y = 207;
			zvezda4.y = -563;
			stg.addChild(zvezda3);
			stg.addChild(zvezda4);
			
			zemlja = new Zemlja;
			zemlja.x = 0;
			zemlja.y = 0;
			stg.addChild(zemlja);
		}
		
		
		function poeniStart():void
		{
			pokazivachPoena = new TextField;
			pokazivachPoena.x = 100;
			pokazivachPoena.y = 550;
			pokazivachPoena.textColor = [0xff3300];
			pokazivachPoena.scaleX = 2;
			pokazivachPoena.scaleY = 2.5;
			pokazivachPoena.text = poeni;
			pokazivachPoena.mouseEnabled = false;
			stg.addChild(pokazivachPoena);
			pokazivachPoena.setTextFormat(font);
			
		}
		
		function evilnessStart():void
		{
			if (evil == -1)  // ne razumem koji kurac ovo radi???
			{
				var e;
				e = 240 / brzinaIgre;
				evilTajmer = new Timer(e);
				evilTajmer.addEventListener(TimerEvent.TIMER, joshEvila);
				evilTajmer.start();
			}
			
			evil = 0;
			
			pokazivachEvila = new TextField;
			pokazivachEvila.x = 300;
			pokazivachEvila.y = 550;
			pokazivachEvila.textColor = [0xff6600];
			pokazivachEvila.scaleX = 3;
			pokazivachEvila.scaleY = 3;
			pokazivachEvila.mouseEnabled = false;
			stg.addChild(pokazivachEvila);
		}
		
		function zhivotiStart():void
		{
			pokazivachZhivota = new TextField;
			pokazivachZhivota.x = 500;
			pokazivachZhivota.y = 550;
			pokazivachZhivota.textColor = [0xff3300];
			pokazivachZhivota.scaleX = 2;
			pokazivachZhivota.scaleY = 2.5;
			pokazivachZhivota.text = brojZhivota;
			pokazivachZhivota.mouseEnabled = false;
			pokazivachZhivota.setTextFormat(font);
		}
		
		function ubrzanje(te:TimerEvent):void
		{
			if (pauza == true)
			{
				return;
			}
			ubrzanjeIgre += 0.1;
		}
		
		
		// kucajuce srce igre. Ova funkcije odlucuje sta se desava frejm po frejm.
		function onTick(e:Event):void
		{
			if (pauza == true)
			{
				return;
			}
			if (brod.mrtav)
			{
				if (stg.contains(eksplozijaBroda) == false)
				{
					pustiEksplozijuBroda();
				}
			}
			brod.kretji();
			brod.odbijanjeZid();
			kretanjeZvezda();
			
			// glavna petlja
			var i = 0;
			for (i; i < stg.numChildren; i++)
			{
// Raketa i Djule
				if ((stg.getChildAt(i) is Raketa)||(stg.getChildAt(i) is Djule))
				{	
					// pokretje raketu. Raketa.kretji vratja TRUE u sluchaju da je raketa eksplodirala
					if(stg.getChildAt(i).kretji()) 
					{
						i--;
						continue;
					}
					// proverava da li je raketa pogodila nesto tokom kretanja
					stg.getChildAt(i).pogodak();
				}
// Eksplozija Rakete				
				else if (stg.getChildAt(i) is EksplozijaRakete)
				{
					// proverava da li je eksplozija rakete nesto pogodila i postavlja .pogodjen = TRUE
					stg.getChildAt(i).pogodak(stg);
				}
// Laser
				else if (stg.getChildAt(i) is Laser)
				{
					// pokretje laser. Laser.kretji vratja TRUE u sluchaju da je izasao iz polja
					if(stg.getChildAt(i).kretji(ubrzanjeIgre))
					{
						i--;
						continue;
					}
					// proverava da li je laser pogodio nesto i postavlja .pogodjen = TRUE
					stg.getChildAt(i).pogodak();
				}
// Top i Lanser
				else if ((stg.getChildAt(i) is Top) || (stg.getChildAt(i) is Lanser))
				{
					if (stg.getChildAt(i).pogodjen == true)
					{
						stg.getChildAt(i).eksplodira();
						
						// daje poene i prikazuje ih
						dajPoene(stg.getChildAt(i));
						
						// uklanja sa stejdza
						stg.getChildAt(i).iskljuchi();
						stg.removeChildAt(i);
						i--;
						continue;
					}
					// proverava tezinu igre i poziva odgovarajuce kretanje
					if (tezhinaIgre == 1)
					{
						stg.getChildAt(i).kretjiTeshko(ubrzanjeIgre);
					}
					else stg.getChildAt(i).kretji(ubrzanjeIgre);
				}
// Torpedo
				else if (stg.getChildAt(i) is Torpedo)
				{
					if (stg.getChildAt(i).pogodjen == true)
					{
						// proverava da li je pogodjeno i pusta eksploziju
						stg.getChildAt(i).eksplozija();
						
						dajPoene(stg.getChildAt(i));
						
						// uklanja sa stejdza
						stg.removeChildAt(i);
						i--;
						continue;
					}
					// pokerece i dobija nazad TRUE i slucaju da je izaslo iz polja
					if (stg.getChildAt(i).kretji(ubrzanjeIgre))
					{
						i--;
						continue;
					}
					// proverava da li je pogodio brod
					stg.getChildAt(i).pogodak();
				}
			}
		}
		
		function dajPoene(izvor):void
		{
			poeni += izvor.poeni * mnozhilacPoena;
			pokazivachPoena.text = poeni;
			pokazivachPoena.setTextFormat(font);
		}
		
		
		public function pustiEksplozijuBroda():void
		{
			stg.removeChild(brod);
			brod.laserTajmer.stop();
			
			zvukEksplozijeBroda.play();
			
			eksplozijaBroda.x = brod.x;
			eksplozijaBroda.y = brod.y;
			eksplozijaBroda.addEventListener("UGASIeksplozijuBRODA", umiranje);
			stg.addChild(eksplozijaBroda);
			eksplozijaBroda.play();
		}
		
		public function ugasiEksploziju(e:Event):void
		{
			if (stg.contains(e.target))
				stg.removeChild(e.target);
		}
		
		function kretanjeZvezda():void
		{
			zvezda1.y += 1;
			zvezda2.y += 1;
			
			zvezda3.y += 0.5;
			zvezda4.y += 0.5;
			
			if (zvezda1.y > 1032)
			{
				zvezda1.y = -665;
			}
			if (zvezda2.y > 1032)
			{
				zvezda2.y = -665;
			}
			if (zvezda3.y > 979)
			{
				zvezda3.y = -563;
			}
			if (zvezda4.y > 979)
			{
				zvezda4.y = -563;
			}
		}
		
		// prati gde je igrach kliknuo i preduzima odgovarajutje korake
		function klik(me:MouseEvent):void
		{
			var cilj = new Point(mouseX, mouseY);
			if (me.target == brod)
			{
				brod.zaustavi();
			}
			else if (mouseY < 90)
			{
				if (evil >=10)
				{
					zvukRakete.play();
					new Raketa(this, cilj);
					evil -= 10;
					trace(evil);
				}
				else trace("Nema Evila");
			}
			else if (brod != undefined)
			{
				kretanje.pravac(brod, cilj);
			}
		}
		
		// dodaje evil na tajmer event
		function joshEvila(te:TimerEvent):void
		{
			if (pauza == true)
			{
				return;
			}
			if (evil < 100)
			{
				evil += 1;
				pokazivachEvila.text = evil;
				pokazivachEvila.setTextFormat(font);
			}
		}
		
		// zavrshava umiranje broda
		function umiranje(e:Event):void
		{
			brod.mrtav = false;
			ubrzanjeIgre = 1;
			if (brojZhivota == 0)
			{
				var e = new Event(Event.CLOSE);
				dispatchEvent(e);
				return;
			}
			brojZhivota -= 1;
			
			protivnici.gasi();
			startuje();
		}
		
		// gasi igru pre odlaska na tabelu
		public function ugasiIgru():void
		{
			this.stg.removeEventListener(MouseEvent.MOUSE_DOWN, klik);
			this.stg.removeEventListener(Event.ENTER_FRAME, onTick);
			main.stage.removeEventListener(Event.MOUSE_LEAVE, pauziraj);
			main.stage.removeEventListener(KeyboardEvent.KEY_DOWN, pauziraj);
			tajmerUbrzanja.removeEventListener(TimerEvent.TIMER, ubrzanje);
			brod.laserTajmer.removeEventListener(TimerEvent.TIMER, brod.laserPuca);
			evilTajmer.removeEventListener(TimerEvent.TIMER, joshEvila);
			protivnici.gasi();
			protivnici.topTajmer.removeEventListener(TimerEvent.TIMER, protivnici.noviTop);
			protivnici.lanserTajmer.removeEventListener(TimerEvent.TIMER, protivnici.noviLanser);
		}
	}
}