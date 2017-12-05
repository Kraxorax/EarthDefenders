package Ed
{
	import flash.display.*;
	import flash.text.*;
	import flash.net.SharedObject;
	
	public class Tabela extends MovieClip
	{
		var stg;
		var pokazivachPoena;
		var poeni;
		var rezultati;
		var snimljeniRezultati;
		var trenutniPoeni;
		var polje1;
		var polje2;
		var polje3;
		var polje4;
		var polje5;
		var polje6;
		var polje7;
		var polje8;
		var polje9;
		var polje10;
		var font;
		
		public function Tabela(stg):void
		{
			this.stg = stg;
			rezultati = new Array();
			snimljeniRezultati = SharedObject.getLocal( "rezED" );
			if (snimljeniRezultati.data.rezultati != null)
			{
				rezultati = snimljeniRezultati.data.rezultati;
			}
			
			font = new TextFormat;
			font.font = "Eccentric Std";
		}
		
		public function upaliTabelu(poeni):void
		{
			stg.addChild(this);
			this.poeni = poeni;
			
			rezultati.push(poeni);
			rezultati.sort(Array.NUMERIC | Array.DESCENDING);
			rezultati.splice(10, 1);
			
			snimljeniRezultati.data.rezultati = rezultati;
			snimljeniRezultati.flush();

			postaviPolja();
			oznachiPolje();
		}
		
		public function postaviPolja():void
		{
			trenutniPoeni = new TextField;
			trenutniPoeni.x = 80;
			trenutniPoeni.y = 115;
			trenutniPoeni.textColor = [0xffffff];
			trenutniPoeni.scaleX = 4;
			trenutniPoeni.scaleY = 4;
			trenutniPoeni.mouseEnabled = false;
			trenutniPoeni.text = poeni;
			stg.addChild(trenutniPoeni);
			trenutniPoeni.setTextFormat(font);
			
			polje1 = new TextField;
			polje1.x = 350;
			polje1.y = 50;
			polje1.textColor = [0xaaaaaa];
			polje1.scaleX = 3;
			polje1.scaleY = 3;
			polje1.mouseEnabled = false;
			polje1.text = snimljeniRezultati.data.rezultati[0];
			stg.addChild(polje1);
			polje1.setTextFormat(font);
			
			polje2 = new TextField;
			polje2.x = 350;
			polje2.y = 100;
			polje2.textColor = [0xaaaaaa];
			polje2.scaleX = 3;
			polje2.scaleY = 3;
			polje2.mouseEnabled = false;
			if (snimljeniRezultati.data.rezultati[1] != null)
			{
				polje2.text = snimljeniRezultati.data.rezultati[1];
			}
			stg.addChild(polje2);
			polje2.setTextFormat(font);
			
			polje3 = new TextField;
			polje3.x = 350;
			polje3.y = 150;
			polje3.textColor = [0xaaaaaa];
			polje3.scaleX = 3;
			polje3.scaleY = 3;
			polje3.mouseEnabled = false;
			if (snimljeniRezultati.data.rezultati[2] != null)
			{
				polje3.text = snimljeniRezultati.data.rezultati[2];
			}
			stg.addChild(polje3);
			polje3.setTextFormat(font);
			
			polje4 = new TextField;
			polje4.x = 350;
			polje4.y = 200;
			polje4.textColor = [0xaaaaaa];
			polje4.scaleX = 3;
			polje4.scaleY = 3;
			polje4.mouseEnabled = false;
			if (snimljeniRezultati.data.rezultati[3] != null)
			{
				polje4.text = snimljeniRezultati.data.rezultati[3];
			}
			stg.addChild(polje4);
			polje4.setTextFormat(font);
			
			polje5 = new TextField;
			polje5.x = 350;
			polje5.y = 250;
			polje5.textColor = [0xaaaaaa];
			polje5.scaleX = 3;
			polje5.scaleY = 3;
			polje5.mouseEnabled = false;
			if (snimljeniRezultati.data.rezultati[4] != null)
			{
				polje5.text = snimljeniRezultati.data.rezultati[4];
			}
			stg.addChild(polje5);
			polje5.setTextFormat(font);
			
			polje6 = new TextField;
			polje6.x = 350;
			polje6.y = 300;
			polje6.textColor = [0xaaaaaa];
			polje6.scaleX = 3;
			polje6.scaleY = 3;
			polje6.mouseEnabled = false;
			if (snimljeniRezultati.data.rezultati[5] != null)
			{
				polje6.text = snimljeniRezultati.data.rezultati[5];
			}
			stg.addChild(polje6);
			polje6.setTextFormat(font);
			
			polje7 = new TextField;
			polje7.x = 350;
			polje7.y = 350;
			polje7.textColor = [0xaaaaaa];
			polje7.scaleX = 3;
			polje7.scaleY = 3;
			polje7.mouseEnabled = false;
			if (snimljeniRezultati.data.rezultati[6] != null)
			{
				polje7.text = snimljeniRezultati.data.rezultati[6];
			}
			stg.addChild(polje7);
			polje7.setTextFormat(font);
			
			polje8 = new TextField;
			polje8.x = 350;
			polje8.y = 400;
			polje8.textColor = [0xaaaaaa];
			polje8.scaleX = 3;
			polje8.scaleY = 3;
			polje8.mouseEnabled = false;
			if (snimljeniRezultati.data.rezultati[7] != null)
			{
				polje8.text = snimljeniRezultati.data.rezultati[7];
			}
			stg.addChild(polje8);
			polje8.setTextFormat(font);
			
			polje9 = new TextField;
			polje9.x = 350;
			polje9.y = 450;
			polje9.textColor = [0xaaaaaa];
			polje9.scaleX = 3;
			polje9.scaleY = 3;
			polje9.mouseEnabled = false;
			if (snimljeniRezultati.data.rezultati[8] != null)
			{
				polje9.text = snimljeniRezultati.data.rezultati[8];
			}
			stg.addChild(polje9);
			polje9.setTextFormat(font);
			
			polje10 = new TextField;
			polje10.x = 350;
			polje10.y = 500;
			polje10.textColor = [0xaaaaaa];
			polje10.scaleX = 3;
			polje10.scaleY = 3;
			polje10.mouseEnabled = false;
			if (snimljeniRezultati.data.rezultati[9] != null)
			{
				polje10.text = snimljeniRezultati.data.rezultati[9];
			}
			stg.addChild(polje10);
			polje10.setTextFormat(font);
		}
		
		public function oznachiPolje():void
		{
			var i = 0;
			for (i; i<stg.numChildren; i++)
			{
				if ((stg.getChildAt(i) is TextField) && (stg.getChildAt(i).text == poeni))
				{
					stg.getChildAt(i).textColor = [0xffffff];
				}
			}
		}
		
		public function ugasiTabelu():void
		{
			trace(rezultati);
			stg.removeChild(trenutniPoeni);
			stg.removeChild(polje1);
			stg.removeChild(polje2);
			stg.removeChild(polje3);
			stg.removeChild(polje4);
			stg.removeChild(polje5);
			stg.removeChild(polje6);
			stg.removeChild(polje7);
			stg.removeChild(polje8);
			stg.removeChild(polje9);
			stg.removeChild(polje10);
		}
	}
}